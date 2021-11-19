#
# Copyright (C) 2020 Wave-OS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit framework first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from common AOSP configuration
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Inherit from surya device
$(call inherit-product, device/xiaomi/surya/device.mk)

# RefreshRate Settings
$(call inherit-product, device/xiaomi/surya/refreshrate.mk)
USE_DYNAMIC_REFRESH_RATE := true

# Device identifier
PRODUCT_NAME := aosp_surya
PRODUCT_DEVICE := surya
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO X3
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Target
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_BLUR := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="surya_global-user 11 RKQ1.200826.002 V12.5.3.0.RJGMIXM release-keys"

BUILD_FINGERPRINT := POCO/surya_global/surya:11/RKQ1.200826.002/V12.5.3.0.RJGMIXM:user/release-keys
