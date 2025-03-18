//
//  main.swift
//  TeamSparta_Ch2
//
//  Created by 천성우 on 3/18/25.
//

import Foundation

let ch2_2 = Lv2()

let result = ch2_2.myMap([1, 2, 3, 4, 5]) {
    String($0)
}

print(result) // ["1", "2", "3", "4", "5"]
