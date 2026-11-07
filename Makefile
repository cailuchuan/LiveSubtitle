ARCHS = arm64
TARGET = iphone:clang:15.0:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

APP_NAME = LiveSubtitle

LiveSubtitle_FILES = main.swift AudioCapture.swift SpeechRecog.swift SubtitleOverlay.swift TranslateHelper.swift
LiveSubtitle_FRAMEWORKS = UIKit AVFoundation
LiveSubtitle_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/app.mk
