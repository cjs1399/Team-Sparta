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

// BallCount 구조체 추가
struct BallCount {
    let strikes: Int
    let balls: Int
    
    var isThreeStrikes: Bool {
        return strikes == 3
    }
}

// RandomNumberGenerator 클래스 분리
final class RandomNumberGenerator {
    func generate() -> [Int] {
        let firstRandomNumber = Array(1...9).shuffled().first!
        let randomNumber = Array(0...9).filter { $0 != firstRandomNumber }.shuffled().prefix(2)
        return [firstRandomNumber] + randomNumber
    }
}

// BallCountChecker 클래스 분리
final class BallCountChecker {
    func check(_ input: [Int], _ target: [Int]) -> BallCount {
        var strikes = 0
        var balls = 0
        
        for i in 0..<input.count {
            if input[i] == target[i] {
                strikes += 1
            } else if target.contains(input[i]) {
                balls += 1
            }
        }
        
        return BallCount(strikes: strikes, balls: balls)
    }
}

// BaseballGame 클래스에서 로직 분리 적용
final class BaseballGame {
    private let randomNumberGenerator = RandomNumberGenerator()
    private let ballCountChecker = BallCountChecker()
    
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
    
    private func playGame() {
        let randomNumbers = randomNumberGenerator.generate()
        var isPlaying = true
        print("<게임을 시작합니다>\n숫자를 입력하세요")
        
        while isPlaying {
            guard let input = readLine(), checkValue(input) else { continue }
            let inputNumbers = input.map { Int(String($0))! }
            tryCount += 1
            
            let result = ballCountChecker.check(inputNumbers, randomNumbers)
            
            if result.isThreeStrikes {
                print("정답입니다!")
                isPlaying = false
                gameHistory[gameCount] = tryCount
                gameCount += 1
            } else {
                print("\(result.strikes)스트라이크 \(result.balls)볼")
            }
        }
        tryCount = 0
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
    
    private func checkValue(_ input: String) -> Bool {
        let numbers = input.compactMap { Int(String($0)) }
        
        if numbers.count != 3 || Set(numbers).count != 3 {
            print("⚠️ 서로 다른 3자리 숫자를 입력해주세요!")
            return false
        }
        return true
    }
}
