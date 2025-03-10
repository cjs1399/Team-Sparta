//
//  BaseballGameLv2.swift
//  SpartaBaseballGame
//
//  Created by 천성우 on 3/10/25.
//

import Foundation

func baseballGameLV2() {
    // 조건1: 서로 다른 임의의수 3개가 랜덤으로 만들어진다.
    // 조건2: 게임의 사용자는 3자리수를 입력하고 힌트를 받는다.
    // 조건3: 같은 자리에 같은 수가 있는 경우 스트라이크, 다른 자리에 숫자가 있는 경우 볼이라고 안내를 받는다.
    // 조건4: 입력한 숫자가 아무것도 일치하지 않는 경우 'Nothing'이란 안내문을 받는다.
    // 조건5: 1 ~ 9 사이의 값 외의 값을 입력할 경우 '올바르지 않은 입력값입니다'라는 안내문을 받는다.
    // 조건6: 같은 숫자를 반복해서 입력할 경우에도 조건5와 같은 안내문을 받는다.
    // 조건7: 숫자 입력은 모든 자리의 수를 올바르게 입력할 경우 종료되며 종료시 '정답입니다!'라는 안내문을 받는다.
    let randomNumbers: [Int] = makeRandomNumbers()
    var answerNumbers: [Int] = []
    var playGame: Bool = true
    
    print("<게임을 시작합니다>")
    while playGame {
        guard let input = readLine(), checkValue(input) else { continue }
        answerNumbers = input.map { Int(String($0))! }
        let result = checkBallCount(answerNumbers, randomNumbers)
        if result[0] == 3 {
            print("정답입니다!")
            playGame = false
        } else if result[0] == 0 && result[1] == 0 {
            print("Nothing")
        } else {
            print("\(result[0])스트라이크 \(result[1])볼")
        }
    }
}

func checkValue(_ input: String) -> Bool {
    if input.allSatisfy({ $0.isNumber }) {
        if input.count != 3 {
            print("현재 입력값은 3자리 값이 아닙니다.")
        } else if input.count != Set(input).count {
            print("현재 입력 값은 중복 값이 있습니다")
        } else if input.contains("0") {
            print("현재 입력 값은 0이 있습니다.")
        } else {
            return true
        }
    } else {
        print("세자리 숫자를 입력해주세요")
        return false
    }
    return false
}


func checkBallCount(_ input: [Int], _ randomNumbers: [Int]) -> [Int] {
    var strikes: Int = 0
    var balls: Int = 0
    for i in 0..<input.count {
        if input[i] == randomNumbers[i] { strikes += 1 }
        else if randomNumbers.contains(input[i]) { balls += 1 }
    }
    
    return [strikes, balls]
}



