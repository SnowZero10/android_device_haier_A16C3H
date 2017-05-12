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

LOCAL_PATH := device/haier/A16C3H

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/haier/A16C3H/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio.a2dp.default \
    audio.primary.msm8909 \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.msm8909 \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinymix \
    libaudioparameter \
    libaudio-resampler \
    sound_trigger.primary.msm8909

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml \
    $(LOCAL_PATH)/mixer_paths_qrd_skui.xml:system/etc/mixer_paths_qrd_skui.xml \
    $(LOCAL_PATH)/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/mixer_paths_msm8909_pm8916.xml:system/etc/mixer_paths_msm8909_pm8916.xml \
    $(LOCAL_PATH)/mixer_paths_skua.xml:system/etc/mixer_paths_skua.xml \
    $(LOCAL_PATH)/mixer_paths_skuc.xml:system/etc/mixer_paths_skuc.xml \
    $(LOCAL_PATH)/mixer_paths_skue.xml:system/etc/mixer_paths_skue.xml \
    $(LOCAL_PATH)/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    antradio_app \
    libantradio

# BT
PRODUCT_PACKAGES += \
    BluetoothExt

# Camera
PRODUCT_PACKAGES += \
    mm-qcamera-app \
    camera.msm8909 \
    libmmjpeg_interface \
    libqomx_core \
    libmmcamera_interface

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Curl
PRODUCT_PACKAGES += \
    libcurl \
    curl

# Data
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/dsi_config.xml:system/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/netmgr_config.xml:system/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/qmi_config.xml:system/etc/data/qmi_config.xml

PRODUCT_PACKAGES += \
    librmnetctl \
    rmnetcli

# Display
PRODUCT_PACKAGES += \
    copybit.msm8909 \
    gralloc.msm8909 \
    hwcomposer.msm8909 \
    libtinyxml \
    memtrack.msm8909 \
    libmemalloc \
    liboverlay \
    libgenlock \
    libqdutils

PRODUCT_PACKAGES += \
    libGLES_android

# Filesystem
PRODUCT_PACKAGES += \
    e2fsck \
    setup_fs \
    make_ext4fs

# FM
PRODUCT_PACKAGES += \
    FM2 \
    FMRecord \
    libqcomfm_jni \
    qcom.fmradio

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/lowi.conf:system/etc/lowi.conf \
    $(LOCAL_PATH)/configs/quipc.conf:system/etc/quipc.conf \

PRODUCT_PACKAGES += \
    libgps.utils \
    libloc_eng \
    libloc_api_v02 \
    libloc_api-rpc-qc

# HOSTAPD
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli

# IPROUTE2
PRODUCT_PACKAGES += \
    ip \
    libiprouteutil

# IPTABLES
PRODUCT_PACKAGES += \
    libext \
    iptables

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8909 \
    gralloc.msm8909 \
    memtrack.msm8909 \
    hwcomposer.msm8909 \
    libtinyxml \
    libagl

# IPv6
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config

# Jhead
PRODUCT_PACKAGES += \
    libjhead_jni

# Keylayout
PRODUCT_PACKAGES += \
    gpio-keys.kl \
    synaptics_dsx.kl \
    ft5x06_ts.kl \
    atmel_mxt_ts.kl

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8909

# Lights
PRODUCT_PACKAGES += \
    lights.msm8909

# LIB_NL
PRODUCT_PACKAGES += \
    libnl_2

# Listen configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/listen_platform_info.xml:system/etc/listen_platform_info.xml

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_8909.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_codecs_8909.xml:system/etc/media_codecs.xml

# msm8909_x20_g151 mixer_paths
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/mixer_paths_msm8909_x20_g151_pm8916.xml:system/etc/mixer_paths_msm8909_x20_g151_pm8916.xml

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libqdMetaData

# OMX
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libmm-omxcore \
    libOmxCore \
    libdivxdrmdecrypt \
    libOmxSwVencMpeg4 \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVdpp \
    libOmxVenc \
    libOmxVidEnc \
    libstagefrighthw \
    libdashplayer \
    qcmediaplayer

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8909 \
    power.default

# Qcom init file configs
PRODUCT_PACKAGES += \
    init.qcom.modem_links.sh \
    init.qti.synaptics_dsx_qhd.sh \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qti.ims.sh:system/etc/init.qti.ims.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/hsic.control.bt.sh:system/etc/hsic.control.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(LOCAL_PATH)/rootdir/etc/init.crda.sh:system/etc/init.crda.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
    $(LOCAL_PATH)/rootdir/etc/qca6234-service.sh:system/etc/qca6234-service.sh \
    $(LOCAL_PATH)/rootdir/etc/hcidump.sh:system/etc/hcidump.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.debug.sh:system/etc/init.qcom.debug.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.zram.sh:system/etc/init.qcom.zram.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.uicc.sh:system/etc/init.qcom.uicc.sh

# rootdir
PRODUCT_PACKAGES += \
    init.target.rc \
    init.carrier.rc \
    fstab.qcom \
    init.recovery.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.rc:root/init.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.factory.rc:root/init.qcom.factory.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.sh:root/init.qcom.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.bms.sh:root/init.qcom.bms.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    $(LOCAL_PATH)/rootdir/etc/init.class_main.sh:root/init.class_main.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.rc:root/init.qcom.usb.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.usb.sh:root/init.qcom.usb.sh \
    $(LOCAL_PATH)/rootdir/etc/ueventd.qcom.rc:root/ueventd.qcom.rc \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    $(LOCAL_PATH)/rootdir/etc/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    $(LOCAL_PATH)/rootdir/etc/init.mdm.sh:root/init.mdm.sh

# RIL
PRODUCT_PACKAGES += \
    libxml2

# Tinyxml
PRODUCT_PACKAGES += \
    libtinyxml2

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# vold
PRODUCT_PACKAGES += \
    vold.fstab

# webview
PRODUCT_PACKAGES += \
    libwebviewchromium \
    libwebviewchromium_loader \
    libwebviewchromium_plat_support

# Wifi
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    libwcnss_qmi \
    wcnss_service

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    hostapd_default.conf \
    hostapd.accept \
    hostapd.deny

#wlan driver
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/WCNSS_wlan_dictionary.dat:persist/WCNSS_wlan_dictionary.dat \
    $(LOCAL_PATH)/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

# ZLIB
PRODUCT_PACKAGES += \
    gzip \
    minigzip \
    libunz

#DTS
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    lpa.decode=false

# Set the default build as dsds
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.multisim.config=dsds

## CT: network mode used nv10
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.mode_pref_nv10=1

PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qc_nlp_in_use=1 \
    persist.loc.nlp_name=com.qualcomm.location \
    ro.gps.agps_provider=1 \
    ro.pip.gated=0

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.calls.on.ims=0 \
    persist.radio.jbims=0 \
    persist.radio.csvt.enabled=false \
    persist.radio.rat_on=combine \
    persist.radio.mt_sms_ack=20

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.sib16_support=1 \
    persist.radio.custom_ecc=1 \
    ro.frp.pst=/dev/block/bootdevice/by-name/config

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/haier/A16C3H/A16C3H-vendor.mk)
