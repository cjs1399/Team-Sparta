//
//  PublisherViewController.swift
//  Layout
//
//  Created by 천성우 on 3/13/25.
//

import UIKit

import Then
import SnapKit

extension Notification.Name {
    static let myCustomNotification = Notification.Name("myCustomNotification")
}

class PublisherViewController: UIViewController {
    
    private let pushNotifyButton = UIButton()
    private let nameTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        pushNotifyButton.do {
            $0.setTitle("알림 보내기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .gray
            $0.layer.cornerRadius = 8
            $0.addTarget(self, action: #selector(pushToObserverViewController), for: .touchUpInside)
        }
        
        nameTextField.do {
            $0.placeholder = "이름을 작성해주세요"
            $0.borderStyle = .roundedRect
        }
    }

    private func setLayout() {
        view.addSubview(nameTextField)
        view.addSubview(pushNotifyButton)
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
        
        pushNotifyButton.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func pushToObserverViewController() {
        let name = nameTextField.text ?? ""

        // NotificationCenter를 통해 이름 전달
        NotificationCenter.default.post(
            name: .myCustomNotification, // ✅ 올바르게 사용
            object: nil,
            userInfo: ["name": name]
        )
        let pushVC = ObserverViewController()
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
}
