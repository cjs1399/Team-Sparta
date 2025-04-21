//
//  ExchangeCalculatorViewModel.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import UIKit

import RxRelay
import RxSwift

final class ExchangeCalculatorViewModel: ViewModelProtocol {
    
    enum Action {
        case setItem(ExchangeRateItemDisplay)
        case calculate(String)
    }

    struct State {
        let code = BehaviorRelay<String>(value: "")
        let country = BehaviorRelay<String>(value: "")
        let result = BehaviorRelay<String>(value: "계산 결과가 여기에 표시됩니다")
        let errorMessage = PublishRelay<String>()
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
                case .calculate(let input):
                    /// .trimmingCharacters 문자열 양쪽 끝의 공백 문자들을 제거하는 메소드
                    let trimmed = input.trimmingCharacters(in: .whitespaces)

                    guard !trimmed.isEmpty else {
                        state.errorMessage.accept("금액을 입력해주세요")
                        return
                    }

                    guard let value = Double(trimmed) else {
                        state.errorMessage.accept("올바른 숫자를 입력해주세요")
                        return
                    }

                    performCalculation(amount: value)
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

