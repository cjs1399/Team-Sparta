//
//  ExchangeCalculatorViewModel.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import UIKit

import RxCocoa
import RxSwift

final class ExchangeCalculatorViewModel: ViewModelProtocol {
    
    enum Action {
        case setItem(ExchangeRateItemDisplay)
        case calculate(Double)
    }

    struct State {
        let code = BehaviorRelay<String>(value: "")
        let country = BehaviorRelay<String>(value: "")
        let result = BehaviorRelay<String>(value: "계산 결과가 여기에 표시됩니다")
    }

    let actionRelay = PublishRelay<Action>()
    let state = State()

    private let disposeBag = DisposeBag()
    private let selectedItem: ExchangeRateItemDisplay

    init(selectedItem: ExchangeRateItemDisplay) {
        self.selectedItem = selectedItem
        bind()
        actionRelay.accept(.setItem(selectedItem))
    }

    private func bind() {
        actionRelay
            .subscribe(onNext: { [weak self] action in
                guard let self else { return }
                switch action {
                case .calculate(let amount):
                    self.performCalculation(amount: amount)
                case .setItem(let item):
                    self.state.code.accept(item.code)
                    self.state.country.accept(item.country)
                }
            })
            .disposed(by: disposeBag)
    }

    private func performCalculation(amount: Double) {
        let total = selectedItem.rate * amount
        let resultText = String(format: "$%.2f → %.2f %@", amount, total, selectedItem.code)
        state.result.accept(resultText)
    }
}

