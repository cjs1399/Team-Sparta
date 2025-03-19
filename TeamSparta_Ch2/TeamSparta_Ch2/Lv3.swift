//
//  Lv3.swift
//  TeamSparta_Ch2
//
//  Created by 천성우 on 3/18/25.
//

import Foundation

final class Lv3 {
    // Int 배열의 짝수 번째 요소 제거
    func a(_ intArray: [Int]) -> [Int] {
        return intArray.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
    
    // String 배열의 짝수 번째 요소 제거
    func b(_ stringArray: [String]) -> [String] {
        return stringArray.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
    
    // 제네릭을 활용한 함수 c (모든 배열 타입 지원)
    func c<T>(_ array: [T]) -> [T] {
        return array.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
    
    // Numeric 프로토콜을 준수하는 타입의 배열만 받는 함수 d
    func d<T: Numeric>(_ array: [T]) -> [T] {
        return array.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
}
