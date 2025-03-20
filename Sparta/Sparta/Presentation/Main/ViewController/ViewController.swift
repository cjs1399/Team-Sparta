//
//  ViewController.swift
//  Sparta
//
//  Created by 천성우 on 3/20/25.
//

import UIKit

import Then
import SnapKit


final class ViewController: BaseViewController {
    
        
    // MARK: - UI Components
    
    private let containerView = UIView()
    private let layer1 = CALayer()
    private let layer2 = CALayer()
    private let layer3 = CALayer()
    
    
    // MARK: - Properties
    
    override func setStyles() {
        view.backgroundColor = .white
        
        containerView.do {
            $0.backgroundColor = .lightGray
        }
        
        layer1.do {
            $0.backgroundColor = UIColor.red.cgColor
            $0.frame = .init(x: 10, y: 10, width: 100, height: 100)
        }
        
        layer2.do {
            $0.backgroundColor = UIColor.yellow.cgColor
            $0.frame = .init(x: 120, y: 10, width: 100, height: 100)
        }
        
        layer3.do {
            $0.backgroundColor = UIColor.green.cgColor
            $0.frame = .init(x: 230, y: 10, width: 100, height: 100)
        }
    }
    
    override func setLayout() {
        view.addSubview(containerView)
        [layer1, layer2, layer3].forEach{containerView.layer.addSublayer($0)}
        
        containerView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview().inset(100)
        }
    }
}

