#
# Copyright (C) 2022 The Android Open Source Project
# Copyright (C) 2022 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from KG5j device
$(call inherit-product, device/tecno/KG5j/device.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := KG5j
PRODUCT_NAME := twrp_KG5j
PRODUCT_BRAND := tecno
PRODUCT_MODEL := KG5j
PRODUCT_MANUFACTURER := Tecno Mobility Limited
PRODUCT_RELEASE_NAME := Tecno Spark 8C

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
  ro.vendor.build.security_patch=2099-12-31 \
  ro.bootimage.build.date.utc=0 \
  ro.bootimage.builder=kelexine

# Fastbootd
  PRODUCT_PACKAGES += \
  android.hardware.fastboot@1.0-impl-mock
