#
# Copyright (C) 2021 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/pissarro

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := NONE
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Assertation
TARGET_OTA_ASSERT_DEVICE := pissarro,pissarroin,pissarroinpro,pissarropro

# Bootloader
TARGET_BOARD_PLATFORM := mt6877
TARGET_BOOTLOADER_BOARD_NAME := mt6877
TARGET_NO_BOOTLOADER := true
PRODUCT_PLATFORM := mt6877

# Build system
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_DTBOIMG_PARTITION_SIZE := 77824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 115234275328

BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_ODMIMAGE_EXTFS_INODE_COUNT := -1

FRAMEWORK_PARTITIONS_RESERVED_SIZE := 536870912
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1048576000
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1572864000
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := $(FRAMEWORK_PARTITIONS_RESERVED_SIZE)
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := $(FRAMEWORK_PARTITIONS_RESERVED_SIZE)
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := $(FRAMEWORK_PARTITIONS_RESERVED_SIZE)

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BUILD_WITHOUT_VENDOR := true

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_ODM := odm

BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs

BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_MAIN_SIZE := 9124708352
BOARD_MAIN_PARTITION_LIST := system system_ext product vendor odm
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_ERROR_LIMIT := 9126805504
BOARD_SUPER_PARTITION_GROUPS := main

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Prebuilt vendor because AB OTA kills the entire partition group
BOARD_PREBUILT_VENDORIMAGE := device/xiaomi/pissarro/prebuilt/vendor.img
BOARD_PREBUILT_ODMIMAGE := device/xiaomi/pissarro/prebuilt/odm.img

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_RECOVERY_UI_BLANK_UNBLANK_ON_INIT := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TARGET_NO_RECOVERY := true

# Sepolicy
SELINUX_IGNORE_NEVERALLOWS := true
TARGET_USES_PREBUILT_VENDOR_SEPOLICY := true
TARGET_HAS_FUSEBLK_SEPOLICY_ON_VENDOR := true

# Treble
BOARD_VNDK_VERSION := current
