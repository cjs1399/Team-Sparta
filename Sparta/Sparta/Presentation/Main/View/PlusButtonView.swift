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
    
    override func setStyles() {
        plusButton.do {
            $0.setImage(ImageLiterals.plus_ic, for: .normal)
            $0.layer.cornerRadius = 8
            $0.layer.masksToBounds = true
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawDashedBorder()
    }
    
    // MARK: - Methods
    
    func getPlusButton() -> UIButton {
        return plusButton
    }
    
    private func drawDashedBorder() {
        let borderLayer = CAShapeLayer()
        borderLayer.strokeColor = UIColor(hex: "#000000").cgColor
        borderLayer.lineDashPattern = [6, 3]
        borderLayer.frame = plusButton.bounds
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(roundedRect: plusButton.bounds, cornerRadius: 8).cgPath
        borderLayer.lineWidth = 2

        plusButton.layer.sublayers?.removeAll(where: { $0 is CAShapeLayer })
        plusButton.layer.addSublayer(borderLayer)
    }
}
