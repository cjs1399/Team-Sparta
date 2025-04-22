//
//  ExchangeRateViewModel.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

import RxSwift
import RxRelay

final class ExchangeRateViewModel: ViewModelProtocol {
    
    enum Action {
        case fetch
        case search(String)
        case toggleFavorite(code: String, isFavorite: Bool)
    }
    
    struct State {
        var isLoading = BehaviorRelay<Bool>(value: false) // 로딩 상태 표시를 위해 선언 -> 예외처리 작업을 위해
        var errorMessage = BehaviorRelay<String?>(value: nil) // 데이터 오류 표시를 위해 선언
        var filteredItems = BehaviorRelay<[ExchangeRateItemDisplay]>(value: [])
    }

    // MARK: - Protocol conformance
    var actionRelay = PublishRelay<Action>()
    let state = State()

    // MARK: - Dependencies
    
    private let disposeBag = DisposeBag()
    private let fetchUseCase: FetchExchangeRateUseCase
    private let fetchFavoriteUseCase: FetchFavoriteCurrenciesUseCase
    private let toggleFavoriteUseCase: ToggleFavoriteCurrencyUseCase
    
    private var allItems = [ExchangeRateItem]()

    // MARK: - Init
    init(
        fetchUseCase: FetchExchangeRateUseCase,
        fetchFavoriteUseCase: FetchFavoriteCurrenciesUseCase,
        toggleFavoriteUseCase: ToggleFavoriteCurrencyUseCase
    ) {
        self.fetchUseCase = fetchUseCase
        self.fetchFavoriteUseCase = fetchFavoriteUseCase
        self.toggleFavoriteUseCase = toggleFavoriteUseCase
        bindActions()
    }

    // MARK: - Action Binding

    private func bindActions() {
        actionRelay
            .subscribe(onNext: { [weak self] action in
                guard let self else { return }
                switch action {
                case .fetch:
                    self.fetchRates()
                case .toggleFavorite(let code, let isFavorite):
                    toggleFavoriteUseCase.execute(code: code, isFavorite: isFavorite)
                    filterItems(query: "")
                case .search(let query):
                    self.filterItems(query: query)
                }
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Fetch
    private func fetchRates() {
        state.isLoading.accept(true)

        fetchUseCase.execute(base: "USD")
            .map { response in
                response.rates.map { ExchangeRateItem(currencyCode: $0.key, rate: $0.value) }
                    .sorted { $0.currencyCode < $1.currencyCode }
            }
            .observe(on: MainScheduler.instance)
            .subscribe(
                with: self,
                onSuccess: { owner, items in
                    owner.allItems = items
                    owner.state.isLoading.accept(false)
                    owner.filterItems(query: "")
                },
                onFailure: { owner, error in
                    owner.state.errorMessage.accept(error.localizedDescription)
                    owner.state.isLoading.accept(false)
                }
            )
            .disposed(by: disposeBag)
    }

    private func filterItems(query: String) {
        let favorites = fetchFavoriteUseCase.execute().map { $0.code }

        let filtered = allItems
            .filter {
                query.isEmpty ||
                $0.currencyCode.lowercased().contains(query.lowercased()) ||
                CurrencyCountryMapper.shared.countryName(for: $0.currencyCode).contains(query)
            }
            .map {
                ExchangeRateItemDisplay(
                    code: $0.currencyCode,
                    country: CurrencyCountryMapper.shared.countryName(for: $0.currencyCode),
                    rate: $0.rate,
                    isFavorite: favorites.contains($0.currencyCode)
                )
            }

        let sorted = filtered.sorted {
            if $0.isFavorite == $1.isFavorite {
                return $0.code < $1.code
            } else {
                return $0.isFavorite && !$1.isFavorite
            }
        }
        
        state.filteredItems.accept(sorted)
    }
}


