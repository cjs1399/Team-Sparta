//
//  SceneDelegate.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = makeInitialViewController()
        self.window = window
        window.makeKeyAndVisible()
    }
    
    private func makeInitialViewController() -> UIViewController {
        let loadLastScreenUseCase = AppDependencyFactory.makeLoadLastScreenUseCase()
        let cachedRepo = AppDependencyFactory.makeCachedRateRepository()


        switch loadLastScreenUseCase.execute() {
        case .list, .none:
            // 기본 리스트 화면
            return UINavigationController(rootViewController: ExchangeRateViewController())

        case .calculator(let code):
            // ✅ CoreData에서 캐시된 환율 데이터 조회
            if let cachedRate = cachedRepo.fetchRate(for: code) {
                let displayModel = ExchangeRateItemDisplay(
                    code: code,
                    country: CurrencyCountryMapper.shared.countryName(for: code),
                    rate: cachedRate,
                    isFavorite: false,
                    direction: .none
                )

                let listVC = ExchangeRateViewController()
                let calculatorVC = ExchangeCalculatorViewController(
                    viewModel: AppDependencyFactory.makeExchangeCalculatorViewModel(item: displayModel)
                )

                let navigationController = UINavigationController()
                navigationController.viewControllers = [listVC]

                // push는 view layout timing 문제 해결용
                DispatchQueue.main.async {
                    navigationController.pushViewController(calculatorVC, animated: false)
                }

                return navigationController
            } else {
                print("❗️해당 code에 대한 캐시된 환율 없음. 리스트로 이동")
                return UINavigationController(rootViewController: ExchangeRateViewController())
            }
        }
    }
}

