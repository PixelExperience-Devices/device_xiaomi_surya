#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from surya device
$(call inherit-product, device/xiaomi/surya/device.mk)

# Inherit some common WaveOS stuff
TARGET_BOOT_ANIMATION_RES := 1080
WAVE_BUILD_TYPE := OFFICIAL
$(call inherit-product, vendor/wave/configs/common.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := wave_surya
PRODUCT_DEVICE := surya
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO X3
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
