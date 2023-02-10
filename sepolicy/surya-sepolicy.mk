# Xiaomi and (Device specific) Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/xiaomi/surya/sepolicy/audio/vendor \
    device/xiaomi/surya/sepolicy/battery/vendor \
    device/xiaomi/surya/sepolicy/camera/vendor \
    device/xiaomi/surya/sepolicy/common/vendor \
    device/xiaomi/surya/sepolicy/fingerprint/vendor \
    device/xiaomi/surya/sepolicy/ir/vendor \
    device/xiaomi/surya/sepolicy/leds/vendor \
    device/xiaomi/surya/sepolicy/nfc/vendor \
    device/xiaomi/surya/sepolicy/power/vendor \
    device/xiaomi/surya/sepolicy/qcom/vendor \
    device/xiaomi/surya/sepolicy/thermal/vendor \
    device/xiaomi/surya/sepolicy/usb/vendor

# Private Sepolicy
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/xiaomi/surya/sepolicy/audio/private \
    device/xiaomi/surya/sepolicy/camera/private \
    device/xiaomi/surya/sepolicy/common/private
