//
//  BookViewModel.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/27/25.
//

import UIKit

import RxCocoa
import RxSwift

protocol BookViewModelInput {
    func didTapIndexButton(_ index: Int)
    func didTapMoreButton()
}

protocol BookViewModelOutput {
    var bookData: BehaviorRelay<[BookModel]> { get }
    var isTapMoreButton: BehaviorRelay<Bool> { get }
    var selectedBook: BehaviorRelay<(book: BookModel, index: Int)?> { get }
    var errorMessage: PublishRelay<String> { get }
}

protocol BookViewModelType {
    var inputs: BookViewModelInput { get }
    var outputs: BookViewModelOutput { get }
}

final class BookViewModel: BookViewModelInput, BookViewModelOutput, BookViewModelType {
    
    
    var bookData: BehaviorRelay<[BookModel]> = BehaviorRelay(value: [])
    var isTapMoreButton: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var selectedBook: BehaviorRelay<(book: BookModel, index: Int)?> = BehaviorRelay(value: nil)
    let errorMessage = PublishRelay<String>()
    
    var inputs: BookViewModelInput { return self }
    var outputs: BookViewModelOutput { return self }
    
    private let bookService = BookService()
    private var currentIndex: Int = 0

    
    init() {
        getBookInformation()
    }
    
    func didTapIndexButton(_ index: Int) {
        currentIndex = index
        let currentBooks = bookData.value
        guard index < currentBooks.count else { return }

        let book = currentBooks[index]
        selectedBook.accept((book: book, index: index))

        let saved = SummaryStateStorage.isExpanded(for: index)
        isTapMoreButton.accept(saved)
    }
    
    func didTapMoreButton() {
        let toggled = !isTapMoreButton.value
        isTapMoreButton.accept(toggled)
        SummaryStateStorage.setExpanded(toggled, for: currentIndex)
    }
    
    func getBookInformation() {
        bookService.fetchBooks { result in
            switch result {
            case .success(let books):

                self.bookData.accept(books)
                if let first = books.first {
                    self.currentIndex = 0
                    self.selectedBook.accept((book: first, index: 0))
                    let saved = SummaryStateStorage.isExpanded(for: 0)
                    self.isTapMoreButton.accept(saved)
                }
            case .failure(let error):
                print("🚨 오류 발생: \(error)")
                self.errorMessage.accept("책 정보를 불러오는데 실패했어요.\n잠시 후 다시 시도해주세요.")
            }
        }
    }}
