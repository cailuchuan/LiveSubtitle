import Foundation
import Speech

class SpeechRecog: NSObject, SFSpeechRecognizerDelegate {
    static let shared = SpeechRecog()
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private let engine = AVAudioEngine()
    
    override init() {
        super.init()
        recognizer?.delegate = self
    }
    
    func startRecognition() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            guard authStatus == .authorized else { return }
            self.beginSession()
        }
    }
    
    private func beginSession() {
        guard !engine.isRunning else { return }
        let node = engine.inputNode
        request = SFSpeechAudioBufferRecognitionRequest()
        guard let req = request else { return }
        req.shouldReportPartialResults = true
        
        task = recognizer?.recognitionTask(with: req) { result, error in
            guard let res = result else { return }
            let japaneseText = res.bestTranscription.formattedString
            TranslateHelper.shared.translate(text: japaneseText) { cnText in
                DispatchQueue.main.async {
                    SubtitleOverlay.shared.show(text: cnText)
                }
            }
        }
        
        let format = node.inputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, time in
            req.append(buffer)
        }
        engine.prepare()
        try? engine.start()
    }
    
    func stopRecognition() {
        engine.stop()
        engine.inputNode.removeTap(onBus:0)
        task?.cancel()
        request = nil
    }
}
