//
//  ExchangeCalculatorViewController.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//


import UIKit

import RxCocoa
import RxSwift
import SnapKit
import Then

class ExchangeCalculatorViewController: BaseViewController {
    
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let contentView = ExchangeCalculatorView()

    // MARK: - View Life Cycle

    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }

        
    override func bindViewModel() {}

    // MARK: - Set UIComponents
    
    override func setStyles() {
        navigationItem.leftBarButtonItem = .customBack(title: "환율 정보", target: self, action: #selector(didTapBackButton))
        title = "환율 계산기"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

    }
    
    // MARK: - Layout Helper

    override func setLayout() {}
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }

}

