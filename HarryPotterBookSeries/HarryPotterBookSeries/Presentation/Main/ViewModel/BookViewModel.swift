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
}

protocol BookViewModelOutput {
    var bookData: BehaviorRelay<[BookModel]> { get }
}

protocol BookViewModelType {
    var inputs: BookViewModelInput { get }
    var outputs: BookViewModelOutput { get }
}

final class BookViewModel: BookViewModelInput, BookViewModelOutput, BookViewModelType {
    
    var bookData: BehaviorRelay<[BookModel]> = BehaviorRelay(value: [])
    
    var inputs: BookViewModelInput { return self }
    var outputs: BookViewModelOutput { return self }
    
    private let bookService = BookService()
    
    init() {
        getBookInformation()
    }
    
    
    func getBookInformation() {
        bookService.fetchBooks { result in
            switch result {
            case .success(let books):
                self.bookData.accept(books)
//                print("------")
//                print(self.bookData.value[0].title)
//                print("------")
                print("📚 불러온 책 목록:")
                books.forEach { book in
                    print("- \(book.title) by \(book.author)")
        
                }
            case .failure(let error):
                print("🚨 오류 발생: \(error)")
            }
        }
    }
}
