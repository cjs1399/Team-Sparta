//
//  Lv3.swift
//  TeamSparta_Ch2
//
//  Created by 천성우 on 3/18/25.
//

import Foundation

final class Lv3 {
    func a(_ intArray: [Int]) -> [Int] {
        return intArray.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
    
    func b(_ stringArray: [String]) -> [String] {
        return stringArray.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
    
    func c<T>(_ array: [T]) -> [T] {
        return array.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
    
    func d<T: Numeric>(_ array: [T]) -> [T] {
        return array.enumerated().compactMap { index, value in
            index.isMultiple(of: 2) ? value : nil
        }
    }
}
