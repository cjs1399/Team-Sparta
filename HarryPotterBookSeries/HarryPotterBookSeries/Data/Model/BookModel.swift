//
//  BookModel.swift
//  HarryPotterBookSeries
//
//  Created by 천성우 on 3/26/25.
//

import Foundation

// MARK: - BookResponse
struct BookResponse: Codable {
    let data: [BookData]
}

// MARK: - BookData
struct BookData: Codable {
    let attributes: BookModel
}

// MARK: - BookModel
struct BookModel: Codable {
    let title: String
    let author: String
    let pages: Int
    let releaseDate: String
    let dedication: String
    let summary: String
    let wiki: String
    let chapters: [Chapter]

    enum CodingKeys: String, CodingKey {
        case title, author, pages
        case releaseDate = "release_date"
        case dedication, summary, wiki, chapters
    }
}

// MARK: - Chapter
struct Chapter: Codable {
    let title: String
}
