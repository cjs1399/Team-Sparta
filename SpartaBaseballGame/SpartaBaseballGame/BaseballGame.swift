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
        // baseballGameLV3
        // 조건1: 0에서 9까지의 서로 다른 임의의 수 3개를 정한다.
        // 조건2: 맨 앞자리에 0이 오는 것은 불가능합니다.
        let firstRandomNumber = Array(1...9).shuffled().first!
        let randomNumber = Array(0...9).filter { $0 != firstRandomNumber }.shuffled().prefix(2)
        return [firstRandomNumber] + randomNumber
    
        // 조건 1을 충족하기 위해 첫 번째 숫자는 1에서 9까지의 임의의 숫자 1개를 생성합니다.
        // filter를 사용해 0에서 9까지의 숫자 중 firstRandomNumber와 같은 수를 제거합니다
        // shuffled 남은 숫자를 랜덤하게 섞고 앞의 2개의 숫자를 선택한다
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
