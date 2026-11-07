import AVFoundation
import Foundation

class AudioCapture {
    static let shared = AudioCapture()
    private let engine = AVAudioEngine()
    
    func start() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .default)
            try session.setActive(true)
        } catch {
            print("音频会话失败：\(error)")
        }
    }
    
    func stop() {
        if engine.isRunning {
            engine.stop()
        }
    }
}
