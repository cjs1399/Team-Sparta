//
//  BaseballGame.swift
//  SpartaBaseballGame
//
//  Created by 천성우 on 3/10/25.
//

import Foundation

// 사용자가 선택할 수 있는 업션 타입을 정의
enum selectOptionType: String {
    case play = "1"
    case history = "2"
    case end = "3"
}

final class BaseballGame {
    private var randomNumbers: [Int] = []
    private var inputNumbers: [Int] = []
    private var gameHistory: [Int: Int] = [:]
    private var gameCount: Int = 0
    private var tryCount: Int = 0
    
    func start() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요\n1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
        
            guard let input = readLine(), let option = selectOptionType(rawValue: input) else {
                print("올바른 숫자를 입력해주세요!")
                continue
            }
            
            switch option {
            case .play:
                playGame()
            case .history:
                printHistory()
            case .end:
                print("< 숫자 야구 게임을 종료합니다 >")
                return
            }
        }
    }
}


extension BaseballGame {
    
    private func playGame() {
        randomNumbers = makeRandomNumbers()
        var playGame: Bool = true
        print("<게임을 시작합니다>\n숫자를 입력하세요")
        while playGame {
            // guard let을 통해 사용자의 입력 값을 검증
            guard let input = readLine(), checkValue(input) else { continue }
            inputNumbers = input.map { Int(String($0))! }
            tryCount += 1
            let result = checkBallCount(inputNumbers, randomNumbers)
            if result[0] == 3 {
                print("정답입니다!")
                playGame = false
                gameHistory[gameCount] = tryCount
                gameCount += 1
            } else {
                switch (result[0], result[1]) {
                case (0, 0):
                    print("Nothing")
                case (0, _):
                    print("\(result[1])볼")
                case (_, 0):
                    print("\(result[0])스트라이크")
                default:
                    print("\(result[0])스트라이크 \(result[1])볼")
                }
            }
        }
        tryCount = 0
    }

    
    private func makeRandomNumbers() -> [Int] {
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
    
    // 사용자의 입력한 숫자가 올바른지 검증하는 함수입니다.
    // 조건1: 3자리 숫자
    // 조건2: 중복된 숫자가 없어야 함
    private func checkValue(_ input: String) -> Bool {
        guard !input.contains(" ") else {
            print("현재 입력값은 공백이 포함되어 있습니다.")
            return false
        }
        
        guard input.allSatisfy({ $0.isNumber }) else {
            print("현재 입력값은 3자리 숫자가 아닙니다.")
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
    
    // 사용자의 입력과 랜덤 숫자를 비교하여 스트라이크 / 볼 개수를 반환하는 함수입니다.
    private func checkBallCount(_ input: [Int], _ randomNumbers: [Int]) -> [Int] {
        var strikes: Int = 0
        var balls: Int = 0
        for i in 0..<input.count {
            if input[i] == randomNumbers[i] { strikes += 1 }
            else if randomNumbers.contains(input[i]) { balls += 1 }
        }
        return [strikes, balls]
    }
    
    private func printHistory() {
        if gameHistory.isEmpty {
            print("게임을 플레이한 기록이 없습니다")
        } else {
            print("< 게임 기록 보기 >")
            for (game, attempts) in gameHistory.sorted(by: { $0.key < $1.key }) {
                print("\(game)번째 게임: 시도 횟수 - \(attempts)")
            }
        }
    }
}
