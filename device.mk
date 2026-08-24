

LOCAL_PATH := device/motorola/nevada
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

PRODUCT_PACKAGES += \
    bootctrl.mt6835

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
PRODUCT_PACKAGES += android.hardware.fastboot@1.0-impl-mock
PRODUCT_PACKAGES += fastbootd

# Boot control HAL - Bootctrl
PRODUCT_PACKAGES += android.hardware.boot@1.2-mtkimpl
PRODUCT_PACKAGES += android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES += bootctrl
PRODUCT_PACKAGES += bootctrl.recovery

PRODUCT_PACKAGES_DEBUG += bootctrl

TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
ENABLE_VIRTUAL_AB := true
