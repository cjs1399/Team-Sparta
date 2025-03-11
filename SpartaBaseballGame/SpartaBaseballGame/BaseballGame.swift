//
//  BaseballGame.swift
//  SpartaBaseballGame
//
//  Created by 천성우 on 3/10/25.
//

import Foundation

final class BaseballGame {
    var randomNumbers: [Int] = []
    var inputNumbers: [Int] = []

    func start() {
        randomNumbers = [5, 0, 2]/*makeRandomNumbers()*/
        var playGame: Bool = true
        print("<게임을 시작합니다>")
        while playGame {
            guard let input = readLine(), checkValue(input) else { continue }
            inputNumbers = input.map { Int(String($0))! }
            let result = checkBallCount(inputNumbers, randomNumbers)
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
    
}

extension BaseballGame {
    func makeRandomNumbers() -> [Int] {
        // baseballGameLV1
        // 조건1: 1에서 9까지의 서로 다른 임의의 수 3개를 정한다.
        // 조건2: 랜덤으로 만들어진다
        return Array(1...9).shuffled().prefix(3).map { $0 }
        
        // Array(1...9).shuffled()를 사용하면 1~9까지의 숫자를 무작위로 섞어 배열 반환
        // prefix(3)을 이용해 위에서 만들어진 배열에서 앞에서 3개의 숫자를 추출
    }

    func checkValue(_ input: String) -> Bool {
        guard input.allSatisfy({ $0.isNumber }) else {
            print("세 자리 숫자를 입력해주세요.")
            return false
        }
        guard input.count == 3 else {
            print("현재 입력값은 3자리 값이 아닙니다.")
            return false
        }
        guard Set(input).count == 3 else {
            print("현재 입력 값은 중복 값이 있습니다.")
            return false
        }
        return true
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


}
