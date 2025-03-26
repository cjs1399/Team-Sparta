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
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(receiveNoti),
            name: Notification.Name("inputText"),
            object: nil
        )
    }
    
    
    
    private func setStyle() {
        view.backgroundColor = .white
        
        nameLabel.do {
            $0.textColor = .black
            $0.text = "??"
        }
        
    }
    
    private func setLayout() {
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func receiveNoti(notification: Notification) {
        guard let inputText = notification.userInfo?["text"] as? String else { return }
        nameLabel.text = inputText
        
        view.backgroundColor = .red
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("🔕 NotificationCenter Observer 해제 완료")
    }
}
