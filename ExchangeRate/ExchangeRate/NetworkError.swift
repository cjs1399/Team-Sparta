//
//  NetworkError.swift
//  ExchangeRate
//
//  Created by 천성우 on 4/16/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case emptyData
    case decodingError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL이 잘못되었습니다."
        case .emptyData:
            return "서버로부터 데이터를 받지 못했습니다."
        case .decodingError:
            return "데이터 파싱에 실패했습니다."
        case .unknown:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}
