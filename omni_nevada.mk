# Inherit from the TWRP product
$(call inherit-product, $(LOCAL_PATH)/twrp_nevada.mk)

# Override product name for OrangeFox
PRODUCT_NAME := omni_nevada
