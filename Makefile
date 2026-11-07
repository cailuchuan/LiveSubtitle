ARCHS = arm64 arm64e
TARGET = iphone:clang:15.0:15.0

include $(THEOS)/makefiles/common.mk

APP_NAME = LiveSubtitle
LiveSubtitle_FILES = main.swift AudioCapture.swift SpeechRecog.swift SubtitleOverlay.swift TranslateHelper.swift
LiveSubtitle_FRAMEWORKS = UIKit Foundation AVKit
LiveSubtitle_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/app.mk
