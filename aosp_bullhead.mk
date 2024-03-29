#
# Copyright 2015 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

# Get the long list of APNs
PRODUCT_COPY_FILES := device/lge/bullhead/apns-full-conf.xml:system/etc/apns-conf.xml

# Device Properties
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bullhead \
    PRIVATE_BUILD_DESC="bullhead-user 8.1.0 OPM7.181105.004 5038062 release-keys"

# Device Fingerprint
BUILD_FINGERPRINT := google/bullhead/bullhead:8.1.0/OPM7.181105.004/5038062:user/release-keys


# Inherit some common AOSP stuff.
$(call inherit-product-if-exists, vendor/aosp/common.mk)


# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from Android Go product configuration
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/go_defaults.mk)

PRODUCT_NAME := aosp_bullhead
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

#PRODUCT_COPY_FILES += device/lge/bullhead/fstab.aosp_bullhead:root/fstab.bullhead

$(call inherit-product, device/lge/bullhead/device.mk)
$(call inherit-product-if-exists, vendor/lge/bullhead/device-vendor.mk)

PRODUCT_PACKAGES += \
    Launcher3 \
    WallpaperPicker

ifeq ($(TARGET_BUILD_VARIANT), eng)
    PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        ro.secure=0 \
        ro.allow.mock.location=1 \
        ro.debuggable=1 \
        persist.sys.usb.config=adb \
        ro.adb.secure=0
endif

# Optimization configs
ifeq ($(TARGET_PRODUCT), aosp_bullhead)
	
	# Remove delay before ring (prevents phone from lagging on incomming calls)
	PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
		ro.telephony.call_ring.delay=0 \
		ring.delay=0
	
	# Disable error report
	PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
		profiler.force_disable_err_rpt=1 \
		profiler.force_disable_ulog=1
	
	# Improve scrolling performances
	PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
		windowsmgr.max_events_per_sec=150 \
		ro.min_pointer_dur=8 ro.max.fling_velocity=12000 \
		ro.min.fling_velocity=8000
	
	# Improve power on speed
	PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
		ro.config.hw_quickpoweron=true
	
endif
