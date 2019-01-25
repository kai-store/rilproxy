LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_SRC_FILES:= src/rilproxy.c
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_MODULE:= rilproxy
LOCAL_MODULE_PATH := $(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE_TAGS := eng

# Enable ROOT_PID_ON_GECKO_TELEPHONY macro to skip setuid to 1001 (radio) for
# rilproxy if ROOT_PID_ON_GECKO_TELEPHONY is defined to a value other than 0
ifneq (0,$(or $(strip $(ROOT_PID_ON_GECKO_TELEPHONY)),0))
LOCAL_CFLAGS += -DROOT_PID_ON_GECKO_TELEPHONY
endif

include $(BUILD_EXECUTABLE)
