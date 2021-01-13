# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aptxadaptive-aac-ldac \
    persist.vendor.btstack.enable.splita2dp=true \
    persist.vendor.btstack.enable.twsplus=true \
    persist.vendor.btstack.enable.twsplussho=true \
    ro.bluetooth.library_name=libbluetooth_qti.so \
    vendor.bluetooth.soc=cherokee

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=440

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.mm.enable.qcom_parser=131071983

# Netflix
PRODUCT_PROPERTY_OVERRIDES += \
    ro.netflix.bsp_rev=Q6150-17263-1

# WaveOS Maintainer
PRODUCT_PROPERTY_OVERRIDES += \
     ro.wave.maintainer=ghostrider_reborn

# Zygote
PRODUCT_PROPERTY_OVERRIDES += \
     persist.device_config.runtime_native.usap_pool_enabled=true

# Enable app/sf phase offset as durations. The numbers below are translated from the existing
# positive offsets by finding the duration app/sf will have with the offsets.
# For SF the previous value was 6ms which under 16.6ms vsync time (60Hz) will leave SF with ~10.5ms
# for each frame. For App the previous value was 2ms which under 16.6ms vsync time will leave the
# App with ~20.5ms (16.6ms * 2 - 10.5ms - 2ms). The other values were calculated similarly.
# Full comparison between the old vs. the new values are captured in
# https://docs.google.com/spreadsheets/d/1a_5cVNY3LUAkeg-yL56rYQNwved6Hy-dvEcKSxp6f8k/edit
PRODUCT_PROPERTY_OVERRIDES += debug.sf.use_phase_offsets_as_durations=1
PRODUCT_PROPERTY_OVERRIDES += debug.sf.late.sf.duration=10500000
PRODUCT_PROPERTY_OVERRIDES += debug.sf.late.app.duration=20500000
PRODUCT_PROPERTY_OVERRIDES += debug.sf.early.sf.duration=21000000
PRODUCT_PROPERTY_OVERRIDES += debug.sf.early.app.duration=16500000
PRODUCT_PROPERTY_OVERRIDES += debug.sf.earlyGl.sf.duration=13500000
PRODUCT_PROPERTY_OVERRIDES += debug.sf.earlyGl.app.duration=21000000
