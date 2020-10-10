LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := librmnetctl.c
LOCAL_CFLAGS := -Wall -Werror

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../inc
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include


LOCAL_MODULE := librmnetctl
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
