# Team-Sparta

## Ch.1 Onboarding
[다짐 기록 앱 만들기](https://github.com/cjs1399/Team-Sparta/tree/main/Sparta)

과제 피드백 반영 Issues: [Ch.1 과제 코드리뷰 반영 기록](https://github.com/cjs1399/Team-Sparta/issues/15) 


### 필수 기능
배경 이미지를 변경합니다.
앨범 이미지, 제목, 내용을 원하는 형태로 변경합니다.
저장하는 버튼을 만들고 카드의 형태로 저장되어 볼 수 있게 만듭니다.
저장한 카드를 자체적으로 저장하며 따로 열어볼 수 있도록 합니다.
<br>

### 📖 Using Library

라이브러리 | 사용 목적 | Management Tool
:---------:|:----------:|:---------:
CoreData | 자체 저장 |
SnapKit | UI Layout | SPM
Then | UI 선언 | SPM
RxSwift | 비동기적 데이터 흐름 작업 | SPM


## Ch.2 프로그래밍 기초 주차 과제

필수 기능: Issues: [Lv1](https://github.com/cjs1399/Team-Sparta/issues/1), [Lv2](https://github.com/cjs1399/Team-Sparta/issues/2)

도전 기능: Issues: [Lv3](https://github.com/cjs1399/Team-Sparta/issues/3), [Lv4](https://github.com/cjs1399/Team-Sparta/issues/4), [Lv5](https://github.com/cjs1399/Team-Sparta/issues/5), [Lv6](https://github.com/cjs1399/Team-Sparta/issues/6)

과제 피드백 반영 Issues: [피드백 반영](https://github.com/cjs1399/Team-Sparta/issues/14)

### 필수 기능
1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다.
정답은 랜덤으로 만들어지며, 정답을 맞히기 위해 3자릿수를 입력하고 힌트를 받습니다.
힌트는 야구 용어인 볼과 스트라이크입니다.
같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 있는 경우 볼입니다.
만약 올바르지 않은 입력값 (중복, 숫자 외의 다른 값, 3자리에 충족하지 않는 입력)을 입력할 경우 오류 문구를 나타냅니다.


### 도전 기능
정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 변경합니다 (단, 0이 맨 앞자리에 오는 것은 불가능합니다)
프로그램을 시작할 때 안내 문구를 보여주고, 선택할 수 있는 옵션을 만들어주세요.
옵션 중 게임 기록 보기의 기능은 완료한 게임들에 대해 시도 횟수를 보여줍니다.
게임을 종료할 경우 이전의 게임 기록들도 초기화해주세요


## Ch.2 프로그래밍 심화 주차 과제

필수 구현: Issues: [필수 구현1](https://github.com/cjs1399/Team-Sparta/issues/7), [필수 구현2](https://github.com/cjs1399/Team-Sparta/issues/8), [필수 구현3](https://github.com/cjs1399/Team-Sparta/issues/9)

TIL & 트러블슈팅: Issues: [Ch.2 심화 주차 과제, 필수 문제 TIL 및 트러블 슈팅](https://github.com/cjs1399/Team-Sparta/issues/10) 

### 필수 구현
두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
 - 클로저 내부에서는 두 정수를 더한 후, "두 수의 합은 {합계} 입니다"라는 문자열을 반환합니다.
이 클로저를 상수 sum에 저장하고, 정확한 타입을 명시해주세요.
sum을 호출하는 코드를 작성해주세요. (파라미터로 전달하는 값은 임의로 선택)
위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
 -  calculate 함수 구현 내에서는 파라미터로 전달받은 클로저를 호출하는 코드를 포함해야합니다.
아래 forEach 문을 map 을 사용하는 코드로 변환해주세요.
    ```swift
    let numbers = [1, 2, 3, 4, 5]
    
    var result = [String]()
    
    for number in numbers {
      result.append(number)
    }
    ```
주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
- 입력: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - 타입: Array<Int>
- 출력: [”2”, “4”, “6”, “8”, “10”] - 타입: Array<String>
위에서 구현한 고차함수를 직접 구현해보세요
- 함수명: myMap, 파라미터: 배열[Int], 변환 클로저(Int) -> String, 반환 값: [String]
- 완성된 myMap 호출 예시
    ```swift
    let result = myMap([1, 2, 3, 4, 5]) {
      	String($0)
    }
    print(result) // ["1", "2", "3", "4", "5"]
    ```
  
Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 `a` 를 작성해주세요.
- 테스트 입력: [1, 2, 3, 4, 5]
- 테스트 출력: [1, 3, 5]
String 배열의 짝수번째 요소를 제거해서 반환하는 함수 `b` 를 작성해주세요.
- 테스트 입력: [”가”, “나”, “다”, “라”, “마”]
- 테스트 출력: [”가”, “다”, ”마”]
위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 `c` 로 작성해주세요.
테스트 입력들을 넣고 호출하여 출력이 제대로 나오는지 작성해주세요.
- 테스트 입력: [1, 2, 3, 4, 5], [”가”, “나”, “다”, “라”, “마”]
- 테스트 출력: [1, 3, 5], [”가”, “다”, ”마”]
함수 `c` 를 기반으로 수정하여 함수 `d` 를 작성해주세요.
- 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경합니다.

