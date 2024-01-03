#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/raviole/aosp_raven.mk)
$(call inherit-product, device/google/gs101/lineage_common.mk)

include device/google/raviole/raven/device-lineage.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 6 Pro
PRODUCT_NAME := lineage_raven

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=raven \
    PRIVATE_BUILD_DESC="raven-user 13 TQ3A.230901.001 10750268 release-keys"

BUILD_FINGERPRINT := google/raven/raven:13/TQ3A.230901.001/10750268:user/release-keys

# Device config
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_FACE_UNLOCK_SUPPORTED := true

# GAPPS
WITH_GAPPS := false
TARGET_INCLUDE_GOOGLE_TELEPHONY := false
TARGET_INCLUDE_PIXEL_FRAMEWORK := false
TARGET_INCLUDE_GOOGLE_CAMERA := false
TARGET_SUPPORTS_GOOGLE_RECORDER := false
TARGET_SUPPORTS_QUICK_TAP := false
TARGET_INCLUDE_GMAIL := false
TARGET_INCLUDE_GOOGLE_MAPS := false

# Debugging
TARGET_INCLUDE_MATLOG := false
TARGET_DEFAULT_ADB_ENABLED := false

# Maintainer
ALPHA_BUILD_TYPE := Unoficcial
ALPHA_MAINTAINER := opensourcefreak

# Artifact path requirement fix
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST +=                               \
system/etc/permissions/android.hardware.biometrics.face.xml             \
system/etc/permissions/privapp-permissions-com.crdroid.faceunlock.xml   \
system/etc/sysconfig/hiddenapi-whitelist-com.crdroid.faceunlock.xml     \
system/lib64/faceunlock_vendor_dependencies.so                          \
system/lib64/libFaceDetectCA.so                                         \
system/lib64/libMegviiUnlock-jni-1.2.so                                 \
system/lib64/libMegviiUnlock.so                                         \
system/lib64/libarcsoft-lib.so                                          \
system/lib64/libarcsoft_faceid.so                                       \
system/lib64/libarcsoftbase.so                                          \
system/lib64/libmegface.so                                              \
system/lib64/libmpbase.so                                               \
system/priv-app/FaceUnlockService/FaceUnlockService.apk

$(call inherit-product, vendor/google/raven/raven-vendor.mk)
