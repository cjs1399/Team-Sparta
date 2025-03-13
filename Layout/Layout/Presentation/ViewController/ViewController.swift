//
//  TeamSpartaiOSViewController.swift
//  Layout
//
//  Created by 천성우 on 3/13/25.
//

import UIKit

import Then
import FlexLayout
import PinLayout

class TeamSpartaiOSViewController: UIViewController {
    
    private let rootFlexContainer = UIView()
    private let flexItemView1 = UIView()
    private let flexItemView2 = UIView()
    private let flexItemView3 = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rootFlexContainer.pin.all(view.pin.safeArea)
        rootFlexContainer.flex.layout()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        flexItemView1.do {
            $0.backgroundColor = .green
        }
        flexItemView2.do {
            $0.backgroundColor = .blue
        }
        flexItemView3.do {
            $0.backgroundColor = .red
        }
    }

    private func setLayout() {
        view.addSubview(rootFlexContainer)
        
        rootFlexContainer.flex.direction(.row).padding(10).define { flex in
            flex.addItem(flexItemView1).width(50)
            flex.addItem(flexItemView2).width(50)
            flex.addItem(flexItemView3).width(50)
        }
    }
}
