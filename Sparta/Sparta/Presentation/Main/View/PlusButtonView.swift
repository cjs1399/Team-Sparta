//
//  AddButtonView.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

import Then
import SnapKit

class PlusButtonView: BaseView {
    
    // MARK: - UI Components
    
    private let plusButton = UIButton()
    private lazy var dashedBorderLayer =  CAShapeLayer()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawDashedBorder()
    }
    
    override func setStyles() {
        plusButton.do {
            $0.setImage(ImageLiterals.plus_ic, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.masksToBounds = true
        }
        
        dashedBorderLayer.do {
            $0.strokeColor = UIColor(hex: "#000000").cgColor
            $0.lineDashPattern = [6, 3]
            $0.fillColor = nil
            $0.lineWidth = 2
        }
    }
    
    // MARK: - Layout Helper
    
    override func setLayout() {
        addSubviews(plusButton)
        
        plusButton.snp.makeConstraints {
            $0.width.height.equalTo(SizeLiterals.Screen.screenHeight * 100 / 812)
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    func getPlusButton() -> UIButton {
        return plusButton
    }
    
    private func drawDashedBorder() {
        dashedBorderLayer.frame = plusButton.bounds
        dashedBorderLayer.path = UIBezierPath(roundedRect: plusButton.bounds, cornerRadius: 8).cgPath
        
        if dashedBorderLayer.superlayer == nil {
            plusButton.layer.addSublayer(dashedBorderLayer)
        }
    }
}
