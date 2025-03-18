//
//  Lv2.swift
//  TeamSparta_Ch2
//
//  Created by 천성우 on 3/18/25.
//

import Foundation


//let numbers = [1, 2, 3, 4, 5]
//
//var result = [String]()
//
//for number in numbers {
//  result.append(number)
//}

let numbers = [1, 2, 3, 4, 5]
var result: [String] = numbers.map { String($0) }

