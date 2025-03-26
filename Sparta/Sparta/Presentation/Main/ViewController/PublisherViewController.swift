//
//  PublisherViewController.swift
//  Layout
//
//  Created by 천성우 on 3/13/25.
//

import UIKit

import Then
import SnapKit


class PublisherViewController: UIViewController, UITextFieldDelegate {
    
    private let pushNotifyButton = UIButton()
    private let nameTextField = UITextField()
    
    private var nameString: String = ""
    
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
            $0.delegate = self
            $0.returnKeyType = .done
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
    
    func notificate(text: String) {
        NotificationCenter.default.post(name: Notification.Name("inputText"), object: nil, userInfo: ["text": text])
    }
    
    @objc
    func pushToObserverViewController() {
        let pushVC = ObserverViewController()

        if let text = nameTextField.text {
            NotificationCenter.default.post(name: Notification.Name("inputText"), object: nil, userInfo: ["text": text])
        }
        
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // 키보드 내리기
        return true
    }
}
