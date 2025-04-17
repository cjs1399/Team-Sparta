//
//  ExchangeCalculatorViewModel.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import UIKit

import RxCocoa
import RxSwift

enum ExchangeCalculatorAction {
    case setItem(ExchangeRateItemDisplay)
    case calculate(Double)
}

struct ExchangeCalculatorState {
    var code = BehaviorRelay<String>(value: "")
    var country = BehaviorRelay<String>(value: "")
    var result = BehaviorRelay<String>(value: "")
}

final class ExchangeCalculatorViewModel: ViewModelProtocol {

    typealias Action = ExchangeCalculatorAction
    typealias State = ExchangeCalculatorState

    var action: ((Action) -> Void)?
    let state = State()

    private let selectedItem: ExchangeRateItemDisplay
    private let disposeBag = DisposeBag()

    init(selectedItem: ExchangeRateItemDisplay) {
        self.selectedItem = selectedItem
        bind()
        state.code.accept(selectedItem.code)
        state.country.accept(selectedItem.country)
    }

    private func bind() {
        action = { [weak self] action in
            guard let self else { return }
            switch action {
            case .calculate(let input):
                self.performCalculation(amount: input)
            case .setItem:
                break
            }
        }
    }

    private func performCalculation(amount: Double) {
        let total = selectedItem.rate * amount
        let resultText = String(format: "$%.2f → %.2f %@", amount, total, selectedItem.code)
        state.result.accept(resultText)
    }
}

