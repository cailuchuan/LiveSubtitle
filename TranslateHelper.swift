import Foundation
import NaturalLanguage

class TranslateHelper {
    static let shared = TranslateHelper()
    private let translator = NLTranslator()
    
    func translate(text:String, completion:@escaping (String)->Void) {
        guard !text.isEmpty else { return }
        let source = NLLanguage.japanese
        let target = NLLanguage.chineseSimplified
        
        NLTranslator.requestAssets(for: [source, target]) { ready in
            guard ready else {
                completion("（翻译模型未下载）\(text)")
                return
            }
            self.translator.translate(text, from: source, to: target) { result in
                switch result {
                case .success(let cnStr):
                    completion(cnStr)
                case .failure:
                    completion(text)
                }
            }
        }
    }
}
