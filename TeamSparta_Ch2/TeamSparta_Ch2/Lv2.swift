//
//  Lv2.swift
//  TeamSparta_Ch2
//
//  Created by 천성우 on 3/18/25.
//

import Foundation


final class Lv2 {
    
    func ch2_1() {
        //let numbers = [1, 2, 3, 4, 5]
        //
        //var result = [String]()
        //
        //for number in numbers {
        //  result.append(number)
        //}
        
        let numbers = [1, 2, 3, 4, 5]
        let result: [String] = numbers.map { String($0) }
        print(result)
    }
    
    func ch2_2() {
        //주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
        //입력: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - 타입: Array
        //출력: [”2”, “4”, “6”, “8”, “10”] - 타입: Array

        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let output = input
            .filter { $0 % 2 == 0 }
            .map { String($0) }

        print("입력: \(input) - 타입 \(type(of: input))")
        print("출력: \(output) - 타입 \(type(of: output))")
    }
    
    func myMap(_ array: [Int], transType: (Int) -> String) -> [String] {
        var result: [String] = []
        for i in array {
            result.append(transType(i))
        }
        return result
    }
}









