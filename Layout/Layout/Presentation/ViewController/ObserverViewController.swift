//
//  ObserverViewController.swift
//  Layout
//
//  Created by 천성우 on 3/25/25.
//

import UIKit

import Then
import SnapKit

class ObserverViewController: UIViewController {
    
    private let nameLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateNameLabel(_:)), name: .myCustomNotification, object: nil)

    }

    private func setStyle() {
        view.backgroundColor = .white
        
        nameLabel.do {
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            $0.textAlignment = .center
        }
    }

    private func setLayout() {
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
        }
    }
    
    @objc
    func updateNameLabel(_ notification: Notification) {
        if let userInfo = notification.userInfo, let text = userInfo["name"] as? String {
            nameLabel.text = text
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("🔕 NotificationCenter Observer 해제 완료")
    }
}
