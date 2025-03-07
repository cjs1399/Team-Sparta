//
//  SpartaViewModel.swift
//  sparta
//
//  Created by 천성우 on 3/6/25.
//

import UIKit

import RxCocoa
import RxSwift
import CoreData

protocol SpartaViewModelInput {
    func didTapPlustButton()
    func didTapSaveButton(with image: UIImage, text: String)
    func setTextView(with value: String)
    func didTapCollectionViewCell(with text: String, date: Date)
}

protocol SpartaViewModelOutput {
    var presentToDrawupViewController: BehaviorRelay<Bool> { get }
    var dismissToDrawupViewController: BehaviorRelay<Bool> { get }
    var isSaveButtonEnabled: BehaviorRelay<Bool> { get }
    var drawupDataList: BehaviorRelay<[DrawupData]> { get }
    var cardSubTitleText: BehaviorRelay<String> { get }
    var careCreatedAt: BehaviorRelay<Date> { get }
}

protocol SpartaViewModelType {
    var inputs: SpartaViewModelInput { get }
    var outputs: SpartaViewModelOutput { get }
}

final class SpartaViewModel: SpartaViewModelInput, SpartaViewModelOutput, SpartaViewModelType {
    
    var presentToDrawupViewController = BehaviorRelay<Bool>(value: false)
    var dismissToDrawupViewController = BehaviorRelay<Bool>(value: false)
    var isSaveButtonEnabled = BehaviorRelay<Bool>(value: false)
    var cardSubTitleText: BehaviorRelay<String> = BehaviorRelay(value: "")
    var careCreatedAt: BehaviorRelay<Date> = BehaviorRelay(value: Date())
    
    var drawupDataList = BehaviorRelay<[DrawupData]>(value: [])
    
    
    var inputs: SpartaViewModelInput { return self }
    var outputs: SpartaViewModelOutput { return self }
    
    init() {
        fetchDrawupData()
    }
    
    func didTapPlustButton() {
        presentToDrawupViewController.accept(true)
    }
    
    func didTapSaveButton(with image: UIImage, text: String) {
        CoreDataManager.shared.saveDrawupData(image: image, text: text)
        dismissToDrawupViewController.accept(true)
        fetchDrawupData()
    }
    
    func setTextView(with value: String) {
        isSaveButtonEnabled.accept(!(value.isEmpty || value == "오늘 내가 공부할 내용을 작성해주세요!"))
    }
    
    func didTapCollectionViewCell(with text: String, date: Date) {
        cardSubTitleText.accept(text)
        careCreatedAt.accept(date)
    }
    
    func fetchDrawupData() {
        var data = CoreDataManager.shared.fetchDrawupData()
        data.sort { (first, second) -> Bool in
            guard let firstDate = first.createdAt, let secondDate = second.createdAt else {
                return false
            }
            return firstDate > secondDate
        }
        drawupDataList.accept(data)
    }
}
