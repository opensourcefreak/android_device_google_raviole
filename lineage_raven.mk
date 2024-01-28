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
    PRIVATE_BUILD_DESC="raven-user 14 UQ1A.240105.002 11129216 release-keys"

BUILD_FINGERPRINT := google/raven/raven:14/UQ1A.240105.002/11129216:user/release-keys

$(call inherit-product, vendor/google/raven/raven-vendor.mk)

# crDroid
EXTRA_UDFPS_ANIMATIONS := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true

# PixelParts
include packages/apps/PixelParts/device.mk

#Device has UDFPS:
TARGET_HAS_UDFPS := true

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST +=	\
system/etc/default-permissions/default_permissions_co.aospa.sense.xml	\
system/etc/permissions/android.hardware.biometrics.face.xml \
system/etc/permissions/privapp_whitelist_co.aospa.sense.xml \
system/etc/sysconfig/hiddenapi-whitelist-co.aospa.sense.xml \
system/lib64/libFaceDetectCA.so \
system/lib64/libMegviiUnlock-jni-1.2.so \
system/lib64/libMegviiUnlock.so \
system/lib64/libmegface.so \
system/priv-app/FaceUnlock/FaceUnlock.apk
