//
//  ViewModel.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/17/25.
//

import Foundation

import RxSwift
import RxRelay

protocol ViewModelProtocol {
    associatedtype Action
    associatedtype State
    
    /// UI에서 방생한 이벤트를 안전하게 ViewModel로 전달하기 위해 PublishRelay로 선언, Relay는 Subject 처럼 동작하지만 에러와 종료 없이 동작하기 때문에 채용
    var actionRelay: PublishRelay<Action> { get }
    var state: State { get }
}
