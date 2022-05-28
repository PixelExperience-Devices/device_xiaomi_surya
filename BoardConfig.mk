#
# Copyright (C) 2021 Paranoid Android
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/surya
COMMON_PATH := device/qcom/common

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Assert
TARGET_OTA_ASSERT_DEVICE := surya,karna

# Audio
BOARD_SUPPORTS_SOUND_TRIGGER := false
TARGET_PROVIDES_AUDIO_EXTNS := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sm6150
TARGET_NO_BOOTLOADER := true

# Camera
TARGET_CAMERA_BOOTTIME_TIMESTAMP := true

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/device_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/manifest.xml
DEVICE_MATRIX_FILE += $(COMMON_PATH)/compatibility_matrix.xml

ODM_MANIFEST_SKUS += surya
ODM_MANIFEST_SURYA_FILES := $(DEVICE_PATH)/configs/hidl/manifest-nfc.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_surya
TARGET_RECOVERY_DEVICE_MODULES := libinit_surya

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000

BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=1 androidboot.usbcontroller=a600000.dwc3 earlycon=msm_geni_serial,0x880000 loop.max_part=7
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += kpti=off cgroup.memory=nokmem,nosocket

BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_SEPARATED_DTBO := true

TARGET_KERNEL_CONFIG := vendor/surya-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/surya
TARGET_KERNEL_VERSION := 4.14

TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_ADDITIONAL_FLAGS := LD=ld.lld AR=llvm-ar AS=llvm-as NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip
TARGET_KERNEL_ADDITIONAL_FLAGS += HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_DISABLED_UBWC := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_USES_METADATA_PARTITION := true

BOARD_SUPER_PARTITION_SIZE := 8589934592
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8585740288 # (BOARD_SUPER_PARTITION_SIZE - 4MB overhead)

ifeq ($(VANILLA_BUILD),true) # Reserve 1GB free space
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1048576000
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1048576000
else # Reserve 100MB free space
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 104857600
endif

BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 104857600

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp
TARGET_TAP_TO_WAKE_NODE  := "/proc/tp_gesture"

# QC common
OVERRIDE_QCOM_HARDWARE_VARIANT := sm8150-common
TARGET_SEPOLICY_DIR := msmsteppe
include $(COMMON_PATH)/BoardConfigQcom.mk

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 150
TARGET_USERIMAGES_USE_F2FS := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Screen density
TARGET_SCREEN_DENSITY := 440

# Security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include device/xiaomi/J20C-sepolicy/J20C-sepolicy.mk
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# WiFi
CONFIG_ACS := true
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
