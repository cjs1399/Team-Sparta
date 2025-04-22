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
    
    private let viewModel: ExchangeCalculatorViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - UI Components
    
    private let contentView = ExchangeCalculatorView()
    
    init(viewModel: ExchangeCalculatorViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - View Life Cycle

    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func bindViewModel() {
        contentView.convertButton.rx.tap
            .withLatestFrom(contentView.amountTextField.rx.text.orEmpty)
            .bind(onNext: { [weak viewModel] value in
                viewModel?.actionRelay.accept(.calculate(value))
            })
            .disposed(by: disposeBag)

        viewModel.state.result
            .bind(to: contentView.resultLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.state.code
            .bind(to: contentView.currencyLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.state.country
            .bind(to: contentView.countryLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.state.errorMessage
            .subscribe(onNext: { [weak self] message in
                self?.showAlert(message: message)
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Set UIComponents
    
    override func setStyles() {
        navigationItem.leftBarButtonItem = .customBack(title: "환율 정보", target: self, action: #selector(didTapBackButton))
        title = "환율 계산기"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc private func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }

    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}

