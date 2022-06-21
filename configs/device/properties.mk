# Audio
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.soundfx.type=mi \
    ro.vendor.audio.soundfx.usb=true \
    persist.vendor.audio_hal.dsp_bit_width_enforce_mode=24 \
    persist.vendor.audio.voicecall.speaker.stereo=true

PRODUCT_SYSTEM_PROPERTIES += \
    ro.config.media_vol_default=8 \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_default=5 \
    ro.config.vc_call_vol_steps=10

# Bluetooth
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.bluetooth.modem_nv_support=true \
    persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
    persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
    persist.vendor.qcom.bluetooth.aac_vbr_ctl.enabled=false \
    persist.vendor.qcom.bluetooth.enable.splita2dp=true \
    persist.vendor.qcom.bluetooth.scram.enabled=true \
    persist.vendor.qcom.bluetooth.soc=cherokee \
    persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
    ro.vendor.bluetooth.wipower=false \
    vendor.qcom.bluetooth.soc=cherokee

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.vendor.bt.a2dp.aac_whitelist=false \
    persist.vendor.btstack.enable.lpa=true \
    persist.vendor.btstack.enable.twsplus=true

# Camera
PRODUCT_VENDOR_PROPERTIES += \
    camera.disable_zsl_mode=1 \
    persist.vendor.camera.privapp.list=org.codeaurora.snapcam,com.android.camera

PRODUCT_SYSTEM_PROPERTIES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera

# Charger
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.charger.enable_suspend=true

# Chipset
PRODUCT_VENDOR_PROPERTIES += \
    ro.soc.model=SM7150 \
    ro.soc.manufacturer=QTI

# Device Settings
PRODUCT_VENDOR_PROPERTIES += \
    ro.audio.soundfx.dirac=true \
    persist.audio.dirac.speaker=true \
    persist.dirac.acs.controller=qem \
    persist.dirac.acs.storeSettings=1 \
    persist.dirac.acs.ignore_error=1

PRODUCT_SYSTEM_PROPERTIES += \
    persist.lcd.cabc_mode=1

# Display
PRODUCT_VENDOR_PROPERTIES += \
   debug.sf.latch_unsignaled=1 \
   persist.sys.sf.native_mode=0 \
   persist.sys.sf.color_mode=0 \
   ro.gfx.driver.1=com.qualcomm.qti.gpudrivers.sm6150.api30 \
   ro.vendor.display.ad=1 \
   ro.vendor.display.ad.sdr_calib_data=/vendor/etc/sdr_config.cfg \
   ro.vendor.display.ad.hdr_calib_data=/vendor/etc/hdr_config.cfg \
   ro.vendor.display.sensortype=2 \
   vendor.display.disable_idle_time_hdr=1 \
   vendor.display.disable_idle_time_video=1 \
   vendor.display.disable_rotator_downscale=1 \
   vendor.display.qdcm.mode_combine=2

PRODUCT_DEFAULT_VENDOR_PROPERTIES += \
   ro.surface_flinger.has_wide_color_display=true \
   ro.surface_flinger.has_HDR_display=true

# Disable vsync for cpu rendered apps
PRODUCT_SYSTEM_PROPERTIES += \
   debug.cpurend.vsync=false

# DPM
PRODUCT_VENDOR_PROPERTIES += \
   persist.vendor.dpm.feature=1 \
   persist.vendor.dpmhalservice.enable=1 \
   persist.vendor.dpm.idletimer.mode=default \
   persist.vendor.dpm.nsrm.bkg.evt=3955

# DRM
PRODUCT_VENDOR_PROPERTIES += \
    drm.service.enabled=true

# FRP
PRODUCT_VENDOR_PROPERTIES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# HVDCP
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.cp.fcc_main_ua=400000 \
    persist.vendor.cp.taper_term_mv=6500 \
    persist.vendor.cp.vbus_offset_mv=1040

# IMS
PRODUCT_VENDOR_PROPERTIES += \
   persist.dbg.volte_avail_ovr=1 \
   persist.dbg.vt_avail_ovr=1 \
   persist.dbg.wfc_avail_ovr=1

# Incremental FS
PRODUCT_VENDOR_PROPERTIES += \
   ro.incremental.enable=1

# IORap
PRODUCT_PRODUCT_PROPERTIES += \
   persist.device_config.runtime_native_boot.iorap_readahead_enable=true

# IWLAN
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.data.iwlan.enable=true \
    ro.telephony.iwlan_operation_mode=legacy

# Keystore
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.keystore_desede=true \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Netflix
PRODUCT_VENDOR_PROPERTIES += \
    ro.netflix.bsp_rev=Q6150-17263-1

# NFC
PRODUCT_SYSTEM_PROPERTIES += \
    ro.nfc.port=I2C

# Radio
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.radio.add_power_save=1 \
    persist.vendor.radio.atfwd.start=true \
    persist.vendor.radio.data_con_rprt=1 \
    persist.vendor.radio.force_on_dc=true \
    persist.vendor.radio.manual_nw_rej_ct=1 \
    persist.vendor.radio.mt_sms_ack=30 \
    persist.vendor.radio.process_sups_ind=1 \
    persist.vendor.radio.redir_party_num=1 \
    persist.vendor.radio.report_codec=1 \
    ro.telephony.default_network=22,20

# Qcom
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.qcomsysd.enabled=1

# Sensors
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.sensors.enable.mag_filter=true \
    debug.sensors.diag_buffer_log=false

# Thermal
PRODUCT_VENDOR_PROPERTIES += \
    vendor.sys.thermal.data.path=/data/vendor/thermal/

# WiFi
PRODUCT_VENDOR_PROPERTIES += \
    wifi.aware.interface=wifi-aware0

# ZRAM
PRODUCT_VENDOR_PROPERTIES += \
    ro.zram.mark_idle_delay_mins=60 \
    ro.zram.first_wb_delay_mins=1440 \
    ro.zram.periodic_wb_delay_hours=24

# Zygote
PRODUCT_SYSTEM_PROPERTIES += \
    persist.device_config.runtime_native.usap_pool_enabled=true
