#
# Copyright 2016 The Android Open Source Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

#
# All components inherited here go to vendor image
#
# TODO(b/136525499): move *_vendor.mk into the vendor makefile later
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

# Inherit some common Havoc-OS stuff.
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
WITH_GAPPS := true
TARGET_INCLUDE_WIFI_EXT := true
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

# Inherit product specific makefiles
$(call inherit-product, device/google/walleye/device-walleye.mk)
$(call inherit-product, vendor/google/walleye/walleye-vendor.mk)

PRODUCT_COPY_FILES += \
    device/google/walleye/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := google
PRODUCT_NAME := havoc_walleye
PRODUCT_DEVICE := walleye
PRODUCT_MODEL := Pixel 2

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="walleye" \
    PRIVATE_BUILD_DESC="walleye-user 8.1.0 OPM1.171019.021 4565141 release-keys"
BUILD_FINGERPRINT := google/walleye/walleye:8.1.0/OPM1.171019.021/4565141:user/release-keys
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
