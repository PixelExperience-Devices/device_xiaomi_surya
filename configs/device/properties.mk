# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24 \
    persist.vendor.audio.voicecall.speaker.stereo=true

PRODUCT_SYSTEM_PROPERTIES += \
    ro.config.media_vol_default=8 \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_default=5 \
    ro.config.vc_call_vol_steps=10

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac-aptxadaptive \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=true \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    ro.vendor.bluetooth.wipower=false \
    vendor.qcom.bluetooth.soc=cherokee

# Bluetooth
PRODUCT_SYSTEM_PROPERTIES += \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    persist.vendor.btstack.enable.twsplus=true \
    persist.vendor.btstack.enable.twsplussho=true \
    vendor.bluetooth.soc=cherokee

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.android.camera

PRODUCT_SYSTEM_PROPERTIES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
    ro.charger.enable_suspend=true

# Chipset
PRODUCT_PROPERTY_OVERRIDES += \
    ro.soc.model=SM7150 \
    ro.soc.manufacturer=QTI

# Device Settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.soundfx.dirac=true \
    persist.audio.dirac.speaker=true \
    persist.dirac.acs.controller=qem \
    persist.dirac.acs.storeSettings=1 \
    persist.dirac.acs.ignore_error=1

PRODUCT_SYSTEM_PROPERTIES += \
    persist.lcd.hbm_mode=0 \
    persist.lcd.cabc_mode=1

# Display
PRODUCT_PROPERTY_OVERRIDES += \
   debug.sf.enable_hwc_vds=1 \
   debug.sf.latch_unsignaled=1 \
   ro.gfx.driver.1=com.qualcomm.qti.gpudrivers.sm6150.api30 \
   ro.vendor.display.ad=1 \
   ro.vendor.display.ad.sdr_calib_data=/vendor/etc/sdr_config.cfg \
   ro.vendor.display.ad.hdr_calib_data=/vendor/etc/hdr_config.cfg \
   ro.vendor.display.sensortype=2 \
   vendor.display.disable_idle_time_hdr=1 \
   vendor.display.disable_idle_time_video=1 \
   vendor.display.disable_rotator_downscale=1

PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.has_wide_color_display=false

# Disable vsync for cpu rendered apps
PRODUCT_SYSTEM_PROPERTIES += \
   debug.cpurend.vsync=false

# DPM
PRODUCT_PROPERTY_OVERRIDES += \
   persist.vendor.dpmhalservice.enable=1 \
   persist.vendor.dpm.idletimer.mode=default \
   persist.vendor.dpm.nsrm.bkg.evt=3955 \
   persist.vendor.dpmhalservice.enable=1

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# HVDCP
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cp.fcc_main_ua=400000 \
    persist.vendor.cp.taper_term_mv=6500 \
    persist.vendor.cp.vbus_offset_mv=1040

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
   persist.dbg.volte_avail_ovr=1 \
   persist.dbg.vt_avail_ovr=1 \
   persist.dbg.wfc_avail_ovr=1

# Incremental FS
PRODUCT_PROPERTY_OVERRIDES += \
   ro.incremental.enable=1

# IORap
PRODUCT_PRODUCT_PROPERTIES += \
   persist.device_config.runtime_native_boot.iorap_readahead_enable=true

# IWLAN
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.data.iwlan.enable=true \
    ro.telephony.iwlan_operation_mode=legacy

# Keystore
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore_desede=true \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Netflix
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.netflix.bsp_rev=Q6150-17263-1

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.process_sups_ind=1 \
    persist.vendor.radio.redir_party_num=1 \
    persist.vendor.radio.report_codec=1

# Qcom
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcomsysd.enabled=1

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.sensors.enable.mag_filter=true
    debug.sensors.diag_buffer_log=false

# SSR
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.ssr.restart_level=ALL_ENABLE

# Thermal
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/

# WiFi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.aware.interface=wifi-aware0

# ZRAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zram.mark_idle_delay_mins=60 \
    ro.zram.first_wb_delay_mins=1440 \
    ro.zram.periodic_wb_delay_hours=24

# Zygote
PRODUCT_SYSTEM_PROPERTIES += \
    persist.device_config.runtime_native.usap_pool_enabled=true
