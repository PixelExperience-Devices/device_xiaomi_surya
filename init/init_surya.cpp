/*
   Copyright (c) 2015, The Linux Foundation. All rights reserved.
   Copyright (C) 2016 The CyanogenMod Project.
   Copyright (C) 2019-2020 The LineageOS Project.
   Copyright (C) 2023 Paranoid Android.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <cstdlib>
#include <string.h>

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>
#include <sys/sysinfo.h>
#include <android-base/properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;
using std::string;

void property_override(string prop, string value)
{
    auto pi = (prop_info*) __system_property_find(prop.c_str());

    if (pi != nullptr)
        __system_property_update(pi, value.c_str(), value.size());
    else
        __system_property_add(prop.c_str(), prop.size(), value.c_str(), value.size());
}

void set_ro_build_prop(const string &source, const string &prop,
                       const string &value, bool product = false) {
    string prop_name;

    if (product)
        prop_name = "ro.product." + source + prop;
    else
        prop_name = "ro." + source + "build." + prop;

    property_override(prop_name.c_str(), value.c_str());
}

void set_device_props(const string model, const string name, const string marketname,
                      const string mod_device) {
    // list of partitions to override props
    string source_partitions[] = { "", "bootimage.", "odm.", "product.",
                                   "system.", "system_ext.", "vendor." };

    for (const string &source : source_partitions) {
        set_ro_build_prop(source, "model", model, true);
        set_ro_build_prop(source, "name", name, true);
        set_ro_build_prop(source, "marketname", marketname, true);
    }
    property_override("ro.product.mod_device", mod_device.c_str());
    property_override("bluetooth.device.default_name", marketname.c_str());
    property_override("vendor.usb.product_string", marketname.c_str());
}

void vendor_load_properties()
{
    // Detect device and configure properties

    if (GetProperty("ro.boot.hwname", "") == "karna") { // POCO X3 (India)
        set_device_props("M2007J20CI", "karna_in", "POCO X3", "surya_in_global");
    } else { // POCO X3 NFC
        string region = GetProperty("ro.boot.hwc", "");
        if (region == "THAI" || region == "THAI_PA") // POCO X3 NFC Thailand
            set_device_props("M2007J20CT", "surya_global", "POCO X3 NFC", "surya_global");
        else // POCO X3 NFC Global
            set_device_props("M2007J20CG", "surya_global", "POCO X3 NFC", "surya_global");
    }

    // Set hardware revision
    property_override("ro.boot.hardware.revision", GetProperty("ro.boot.hwversion", "").c_str());

    // Override "release-keys" for build tags
    property_override("ro.build.tags", "release-keys");
}
