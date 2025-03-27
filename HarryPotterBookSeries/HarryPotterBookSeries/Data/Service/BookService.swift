//
//  BookService.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/27/25.
//

import Foundation

class BookService {
    
    enum BookError: Error {
        case fileNotFound
        case parsingFailed
    }
    
    func fetchBooks(completion: @escaping (Result<[BookModel], Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            completion(.failure(BookError.fileNotFound))
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
            let books = bookResponse.data.map { $0.attributes }
            completion(.success(books))
        } catch {
            print("🚨 JSON 파싱 에러 : \(error)")
            completion(.failure(BookError.parsingFailed))
        }
    }
}
