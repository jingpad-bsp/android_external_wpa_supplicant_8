LOCAL_PATH:= $(call my-dir)
# Save supplicant's root dir(LOCAL_PATH may be modified by other makefiles)
WPA_SUPPL_DIR := $(LOCAL_PATH)
ifneq ($(filter VER_0_8_X VER_2_1_DEVEL,$(WPA_SUPPLICANT_VERSION)),)
# The order of the 2 Android.mks does matter!
# TODO: Clean up the Android.mks, reset all the temporary variables at the
# end of each Android.mk, so that one Android.mk doesn't depend on variables
# set up in the other Android.mk.
include $(LOCAL_PATH)/hostapd/Android.mk \
        $(LOCAL_PATH)/wpa_supplicant/Android.mk
# HS2 osu client
include $(WPA_SUPPL_DIR)/hs20/client/Android.mk
endif
