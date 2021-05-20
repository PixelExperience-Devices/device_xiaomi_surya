ifeq ($(USE_DYNAMIC_REFRESH_RATE), true)
# Overlays
PRODUCT_PACKAGES += \
    SuryaRefreshRateSettings

# Refresh Rate Dynamic Props
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms?=500 \
    ro.surface_flinger.set_touch_timer_ms=750 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.disable_backpressure=0 \
    debug.sf.enable_gl_backpressure=1 \
    vendor.display.defer_fps_frame_count=4 \
    vendor.display.disable_metadata_dynamic_fps=1 \
    vendor.display.idle_time=0 \
    vendor.display.idle_time_inactive=0

# Enable app/sf phase offset as durations. The numbers below are translated from the existing
# positive offsets by finding the duration app/sf will have with the offsets.
# For SF the previous value was 6ms which under 16.6ms vsync time (60Hz) will leave SF with ~10.5ms
# for each frame. For App the previous value was 2ms which under 16.6ms vsync time will leave the
# App with ~20.5ms (16.6ms * 2 - 10.5ms - 2ms). The other values were calculated similarly.
# Full comparison between the old vs. the new values are captured in
# https://docs.google.com/spreadsheets/d/1a_5cVNY3LUAkeg-yL56rYQNwved6Hy-dvEcKSxp6f8k/edit
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.frame_rate_multiple_threshold=120 \
    debug.sf.late.sf.duration=10500000 \
    debug.sf.late.app.duration=20500000 \
    debug.sf.early.sf.duration=16000000 \
    debug.sf.early.app.duration=16500000 \
    debug.sf.earlyGl.sf.duration=13500000 \
    debug.sf.earlyGl.app.duration=21000000
else
# Overlays
PRODUCT_PACKAGES += \
    SuryaSmoothDisplaySettings

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.refreshrate.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.refreshrate.rc

# Smooth Display Refresh Rate Props
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.set_idle_timer_ms?=500 \
    ro.surface_flinger.set_touch_timer_ms=750 \
    ro.surface_flinger.set_display_power_timer_ms=1000 \
    ro.surface_flinger.support_kernel_idle_timer=true \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true

# Enable app/sf phase offset as durations. The numbers below are translated from the existing
# positive offsets by finding the duration app/sf will have with the offsets.
# For SF the previous value was 6ms which under 16.6ms vsync time (60Hz) will leave SF with ~10.5ms
# for each frame. For App the previous value was 2ms which under 16.6ms vsync time will leave the
# App with ~20.5ms (16.6ms * 2 - 10.5ms - 2ms). The other values were calculated similarly.
# Full comparison between the old vs. the new values are captured in
# https://docs.google.com/spreadsheets/d/1a_5cVNY3LUAkeg-yL56rYQNwved6Hy-dvEcKSxp6f8k/edit
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.frame_rate_multiple_threshold=120 \
    debug.sf.late.sf.duration=10500000 \
    debug.sf.late.app.duration=20500000 \
    debug.sf.early.sf.duration=16000000 \
    debug.sf.early.app.duration=16500000 \
    debug.sf.earlyGl.sf.duration=13500000 \
    debug.sf.earlyGl.app.duration=21000000

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.display.defer_fps_frame_count=2 \
    debug.sf.disable_backpressure=0 \
    debug.sf.enable_gl_backpressure=1
endif
