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

LOCAL_PATH := $(my-dir)

ifneq ($(TARGET_PREBUILT_KERNEL),)
# hack to force copy prebuilt dt.img
$(shell cp device/haier/A16C3H/boot.img-dt out/target/product/A16C3H/dt.img )

# another hack to generate kernel headers
$(info $(shell ($(LOCAL_PATH)/generate_kernel_headers.sh)))
endif

# this is for libstagefright
ifeq ($(AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD),true)
    $(shell cp hardware/qcom/audio/hal/audio_extn/audio_defs.h \
               frameworks/av/media/libstagefright/ )
endif #AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD

ifeq ($(strip $(BOARD_USES_SRS_TRUEMEDIA)),true)
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libsrsprocessing_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libsrsprocessing_intermediates/export_includes)

# frameworks/av/services/audioflinger/ also need these files
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := mm-audio/audio-effects
LOCAL_COPY_HEADERS    := include/mm-audio/audio_effects/postpro_patch.h \
                         include/mm-audio/audio_effects/srs_processing.h
include $(BUILD_COPY_HEADERS)
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_PM_SUPPORT)),true)
$(shell mkdir -p $(OUT)/obj/SHARED_LIBRARIES/libperipheral_client_intermediates/)
$(shell touch $(OUT)/obj/SHARED_LIBRARIES/libperipheral_client_intermediates/export_includes)

include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := libperipheralclient/inc
LOCAL_COPY_HEADERS    := include/libperipheralclient/inc/pm-service.h
include $(BUILD_COPY_HEADERS)
endif

# lib-bt header file
ifeq ($(BOARD_HAVE_BLUETOOTH_QCOM),true)
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := bt/hci_qcomm_init
LOCAL_COPY_HEADERS    := include/bt/hci_comm_init/bt_nv.h
include $(BUILD_COPY_HEADERS)
endif

# mm-video header files
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := mm-video/swvenc
LOCAL_COPY_HEADERS    := include/mm-video/swvenc/swvenc_api.h \
                         include/mm-video/swvenc/swvenc_types.h
include $(BUILD_COPY_HEADERS)
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_SSR)),true)
# mm-audio/surround_sound header files
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := mm-audio/surround_sound
LOCAL_COPY_HEADERS    := include/mm-audio/surround_sound/comdef.h \
                         include/mm-audio/surround_sound/profile.h \
                         include/mm-audio/surround_sound/surround_filters_interface.h
include $(BUILD_COPY_HEADERS)
endif

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTN_RESAMPLER)),true)
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := mm-audio/audio-src
LOCAL_COPY_HEADERS    := include/mm-audio/audio-src/QCT_Resampler.h
include $(BUILD_COPY_HEADERS)
endif

ifeq ($(strip $(TARGET_USES_QCOM_DISPLAY_PP)),true)
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := qdcm/inc
LOCAL_COPY_HEADERS    := include/qdcm/inc/mode_manager.h \
                         include/qdcm/inc/utility.h
include $(BUILD_COPY_HEADERS)

include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := pp/inc
LOCAL_COPY_HEADERS    := include/pp/inc/libmm-disp-apis.h
include $(BUILD_COPY_HEADERS)
endif

# audio-flac header files
ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTN_FLAC_DECODER)),true)
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := mm-audio/audio-flac
LOCAL_COPY_HEADERS    := include/mm-audio/audio-flac/FLACDec_API.h \
                         include/mm-audio/audio-flac/FLACDec_BitStream.h \
                         include/mm-audio/audio-flac/FLACDec_MetaData.h \
                         include/mm-audio/audio-flac/FLACDec_Struct.h \
                         include/mm-audio/audio-flac/FLACDec_typedefs.h \
                         include/mm-audio/audio-flac/FLACDec_Wrapper.h
include $(BUILD_COPY_HEADERS)
endif

# common headers
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := common/inc
LOCAL_COPY_HEADERS    := include/common/inc/armasm.h \
                         include/common/inc/comdef.h \
                         include/common/inc/common_log.h \
                         include/common/inc/customer.h \
                         include/common/inc/msm_ipc.h \
                         include/common/inc/qsocket.h \
                         include/common/inc/qsocket_ipcr.h \
                         include/common/inc/rex.h \
                         include/common/inc/stringl.h \
                         include/common/inc/target.h
include $(BUILD_COPY_HEADERS)

# mdmdetect header file
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := libmdmdetect/inc
LOCAL_COPY_HEADERS    := include/libmdmdetect/mdm_detect.h
include $(BUILD_COPY_HEADERS)

# qmi-framework header file
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := qmi-framework/inc
LOCAL_COPY_HEADERS    := include/qmi-framework/inc/qmi_idl_lib.h \
                         include/qmi-framework/inc/common_v01.h \
                         include/qmi-framework/inc/qmi_client.h \
                         include/qmi-framework/inc/qmi_cci_target_ext.h \
                         include/qmi-framework/inc/qmi_idl_lib_internal.h \
                         include/qcci/inc/qmi_cci_target.h \
                         include/qcci/inc/qmi_cci_common.h \
                         include/qmi-framework/common/inc/qmi_common.h
include $(BUILD_COPY_HEADERS)

# qmi-service
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := qmi/inc
LOCAL_COPY_HEADERS    := include/qmi/inc/wireless_data_service_v01.h \
                         include/qmi/inc/data_common_v01.h \
                         include/qmi/inc/qmi_atcop_srvc.h \
                         include/qmi/inc/qmi.h \
                         include/qmi/inc/qmi_port_defs.h \
                         include/qmi/inc/qmi_platform_config.h \
                         include/qmi/inc/qmi_qos_srvc.h \
                         include/qmi/inc/qmi_wds_srvc.h
include $(BUILD_COPY_HEADERS)

# dsi_netctrl
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := data/inc
LOCAL_COPY_HEADERS    := include/data/inc/dsi_netctrl.h \
                         include/data/inc/dsi_netctrl_qos.h
include $(BUILD_COPY_HEADERS)

#----------------------------------------------------------------------
# Compile (L)ittle (K)ernel bootloader and the nandwrite utility
#----------------------------------------------------------------------
ifneq ($(strip $(TARGET_NO_BOOTLOADER)),true)

# Compile
include bootable/bootloader/lk/AndroidBoot.mk

$(INSTALLED_BOOTLOADER_MODULE): $(TARGET_EMMC_BOOTLOADER) | $(ACP)
	$(transform-prebuilt-to-target)
$(BUILT_TARGET_FILES_PACKAGE): $(INSTALLED_BOOTLOADER_MODULE)

droidcore: $(INSTALLED_BOOTLOADER_MODULE)
endif #TARGET_NO_BOOTLOADER

#----------------------------------------------------------------------
# Copy additional target-specific files
#----------------------------------------------------------------------
include $(CLEAR_VARS)
LOCAL_MODULE       := vold.fstab
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.target.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.carrier.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.qcom
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qcom.modem_links.sh
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.qti.synaptics_dsx_qhd.sh
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gpio-keys.kl
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := synaptics_dsx.kl
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ft5x06_ts.kl
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := atmel_mxt_ts.kl
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

ifeq ($(strip $(BOARD_HAS_QCOM_WLAN)),true)
include $(CLEAR_VARS)
LOCAL_MODULE       := wpa_supplicant_overlay.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := p2p_supplicant_overlay.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := hostapd_default.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/hostapd
LOCAL_SRC_FILES    := hostapd.conf
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := hostapd.accept
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/hostapd
LOCAL_SRC_FILES    := hostapd.accept
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := hostapd.deny
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/hostapd
LOCAL_SRC_FILES    := hostapd.deny
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := msg2xxx.kl
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := configs/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := qpnp_pon.kl
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := configs/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_KEYLAYOUT)
include $(BUILD_PREBUILT)

#Create symbolic links
$(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wlan/prima; \
        ln -sf /persist/WCNSS_qcom_wlan_nv.bin \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin; \
        ln -sf /persist/WCNSS_wlan_dictionary.dat \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_wlan_dictionary.dat; \
        ln -sf /data/misc/wifi/WCNSS_qcom_cfg.ini \
        $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini)
endif

#----------------------------------------------------------------------
# Radio image
#----------------------------------------------------------------------
ifeq ($(ADD_RADIO_FILES), true)
radio_dir := $(LOCAL_PATH)/radio
RADIO_FILES := $(shell cd $(radio_dir) ; ls)
$(foreach f, $(RADIO_FILES), \
    $(call add-radio-file,radio/$(f)))
endif

#----------------------------------------------------------------------
# extra images
#----------------------------------------------------------------------
-include device/qcom/common/generate_extra_images.mk

#----------------------------------------------------------------------
# pick up additional files for Tiny Android builds
#----------------------------------------------------------------------
ifeq ($(BUILD_TINY_ANDROID), true)
-include device/qcom/common/rootdir/Android.mk
endif

# include the non-open-source counterpart to this file
-include vendor/haier/A16C3H/AndroidBoardVendor.mk
