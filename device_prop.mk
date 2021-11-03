# Blur
ifeq ($(TARGET_SUPPORTS_BLUR), true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.sf.blurs_are_expensive=1 \
    ro.surface_flinger.supports_background_blur=1 \
    persist.sys.sf.disable_blurs=1
endif

# System
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.binary_xml=false
