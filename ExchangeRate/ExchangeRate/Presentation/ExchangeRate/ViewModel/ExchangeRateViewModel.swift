//
//  ExchangeRateViewModel.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

import RxCocoa
import RxSwift
import CoreData

protocol ExchangeRateViewModelInput {
    var searchText: BehaviorRelay<String> { get }
    func fetchRates()
}

protocol ExchangeRateViewModelOutput {
    var filteredItems: Driver<[ExchangeRateItem]> { get }
    var isLoading: Driver<Bool> { get }
    var errorMessage: Driver<String?> { get }
}

protocol ExchangeRateViewModelType {
    var inputs: ExchangeRateViewModelInput { get }
    var outputs: ExchangeRateViewModelOutput { get }
}

final class ExchangeRateViewModel: ExchangeRateViewModelInput, ExchangeRateViewModelOutput, ExchangeRateViewModelType {

    // MARK: - Input / Output
    var inputs: ExchangeRateViewModelInput { return self }
    var outputs: ExchangeRateViewModelOutput { return self }

    // MARK: - Dependencies
    private let exchangeRateService = ExchangeRateService()
    private let disposeBag = DisposeBag()

    // MARK: - Relays
    let searchText = BehaviorRelay<String>(value: "")
    private let itemsRelay = BehaviorRelay<[ExchangeRateItem]>(value: [])
    private let isLoadingRelay = BehaviorRelay<Bool>(value: false)
    private let errorMessageRelay = BehaviorRelay<String?>(value: nil)

    // MARK: - Outputs
    lazy var filteredItems: Driver<[ExchangeRateItem]> = {
        Observable.combineLatest(searchText, itemsRelay)
            .map { query, items in
                guard !query.isEmpty else { return items }
                return items.filter {
                    $0.currencyCode.lowercased().contains(query.lowercased()) ||
                    CurrencyCountryMapper.shared.countryName(for: $0.currencyCode).contains(query)
                }
            }
            .asDriver(onErrorJustReturn: [])
    }()

    var isLoading: Driver<Bool> {
        return isLoadingRelay.asDriver(onErrorJustReturn: false)
    }

    var errorMessage: Driver<String?> {
        return errorMessageRelay.asDriver(onErrorJustReturn: "Unknown Error")
    }

    // MARK: - Init
    init() {
        fetchRates()
    }

    // MARK: - Input Method
    func fetchRates() {
        isLoadingRelay.accept(true)
        exchangeRateService.fetchExchangeRates()
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] response in
                let mapped = response.rates.map { ExchangeRateItem(currencyCode: $0.key, rate: $0.value) }
                    .sorted { $0.currencyCode < $1.currencyCode }
                self?.itemsRelay.accept(mapped)
                self?.isLoadingRelay.accept(false)
            } onFailure: { [weak self] error in
                self?.errorMessageRelay.accept(error.localizedDescription)
                self?.isLoadingRelay.accept(false)
            }
            .disposed(by: disposeBag)
    }
}
