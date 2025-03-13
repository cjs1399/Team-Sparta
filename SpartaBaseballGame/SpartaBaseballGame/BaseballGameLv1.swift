//
//  BaseballGameLv1.swift
//  SpartaBaseballGame
//
//  Created by 천성우 on 3/10/25.
//

import Foundation

func makeRandomNumbers() -> [Int] {
    // baseballGameLV1
    // 조건1: 1에서 9까지의 서로 다른 임의의 수 3개를 정한다.
    // 조건2: 랜덤으로 만들어진다
    return Array(1...9).shuffled().prefix(3).map { $0 }
    
    // Array(1...9).shuffled()를 사용하면 1~9까지의 숫자를 무작위로 섞어 배열 반환
    // prefix(3)을 이용해 위에서 만들어진 배열에서 앞에서 3개의 숫자를 추출
    
    // 초기의 코드
    //        var randomNumbers: Set<Int> = []
    //
    //        while randomNumbers.count < 3 {
    //            let num = Int.random(in: 1...9)
    //            randomNumbers.insert(num)
    //        }
    //
    //        return Array(randomNumbers)
}
