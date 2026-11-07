import UIKit

class SubtitleOverlay: UIWindow {
    static let shared = SubtitleOverlay()
    private let label = UILabel()
    
    private override init() {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            super.init(windowScene: scene)
        } else {
            super.init(frame: UIScreen.main.bounds)
        }
        
        self.frame = UIScreen.main.bounds
        self.windowLevel = .alert + 100
        self.backgroundColor = .clear
        
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize:24, weight:.semibold)
        label.textAlignment = .center
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant:20),
            label.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant:-20),
            label.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant:-40),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show(text:String) {
        label.text = text
        self.isHidden = false
    }
}
