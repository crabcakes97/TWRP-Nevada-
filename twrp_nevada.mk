

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from nevada device
$(call inherit-product, device/motorola/nevada/device.mk)

PRODUCT_DEVICE := nevada
PRODUCT_NAME := twrp_nevada
PRODUCT_BRAND := motorola
PRODUCT_MODEL := nevada
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="nevada_g_vext-user 13 W1WNS36.18-111-3 fd36ab release-keys"

BUILD_FINGERPRINT := motorola/nevada_g_vext/nevada:13/W1WNS36.18-111-3/fd36ab:user/release-keys
