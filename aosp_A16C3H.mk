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

$(call inherit-product, device/haier/A16C3H/full_A16C3H.mk)

#MULTI_LANG_ENGINE := REVERIE
MSM_VIDC_TARGET_LIST := msm8909
QCOM_BOARD_PLATFORMS += msm8909

PRODUCT_BOOT_JARS += \
    qcmediaplayer \
    WfdCommon \
    oem-services \
    qcom.fmradio \
    org.codeaurora.Performance \
    vcard \
    tcmiface

#OEM Services library
PRODUCT_PACKAGES += oem-services
PRODUCT_PACKAGES += libsubsystem_control
PRODUCT_PACKAGES += libSubSystemShutdown

# brctl
PRODUCT_PACKAGES += \
    brctl \
    libbridge

#BSON
PRODUCT_PACKAGES += \
    libbson

PRODUCT_PACKAGES += \
    javax.btobex \
    libbt-vendor \
    libattrib_static

PRODUCT_PACKAGES += \
    tcmiface

PRODUCT_PACKAGES += \
    okhttp

# LIBPERFLOCK
PRODUCT_PACKAGES += \
    org.codeaurora.Performance

PRODUCT_PACKAGES += \
    gps.default

PRODUCT_PACKAGES += \
    keystore.qcom

PRODUCT_PACKAGES += \
    power.qcom

#LLVM for RenderScript
#use qcom LLVM
$(call inherit-product-if-exists, external/llvm/llvm-select.mk)

#RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_aidl_static \
    rcs_service_api \
    rcs_service_api.xml

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default

SKIP_BOOT_JARS_CHECK := true

# dm-verity definitions
PRODUCT_VERITY_PARTITION=/dev/block/bootdevice/by-name/system
$(call inherit-product, build/target/product/verity.mk)

PRODUCT_NAME := aosp_A16C3H
