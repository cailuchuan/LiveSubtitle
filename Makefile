ARCHS = arm64 arm64e
TARGET = iphone:clang:15.0:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

APP_NAME = LiveSubtitle
LiveSubtitle_FILES = main.swift LiveSubtitleApp.swift AudioCapture.swift SpeechRecog.swift TranslateHelper.swift SubtitleOverlay.swift
LiveSubtitle_FRAMEWORKS = UIKit Foundation NaturalLanguage Speech AVFoundation
LiveSubtitle_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/app.mk
