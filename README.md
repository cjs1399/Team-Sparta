# Team-Sparta

## Ch.1 Onboarding
[다짐 기록 앱 만들기](https://github.com/cjs1399/Team-Sparta/tree/main/Sparta)

과제 피드백 반영 Issues: [Ch.1 과제 코드리뷰 반영 기록](https://github.com/cjs1399/Team-Sparta/issues/15) 



<details>
<summary><b>필수 기능</b></summary>
<div markdown="1">
배경 이미지를 변경합니다.
앨범 이미지, 제목, 내용을 원하는 형태로 변경합니다.
저장하는 버튼을 만들고 카드의 형태로 저장되어 볼 수 있게 만듭니다.
저장한 카드를 자체적으로 저장하며 따로 열어볼 수 있도록 합니다.
</aside>
</div>
</details>


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

<details>
<summary><b>필수 기능</b></summary>
<div markdown="1">
1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다.
정답은 랜덤으로 만들어지며, 정답을 맞히기 위해 3자릿수를 입력하고 힌트를 받습니다.
힌트는 야구 용어인 볼과 스트라이크입니다.
같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 있는 경우 볼입니다.
만약 올바르지 않은 입력값 (중복, 숫자 외의 다른 값, 3자리에 충족하지 않는 입력)을 입력할 경우 오류 문구를 나타냅니다.
</aside>
</div>
</details>

<details>
<summary><b>도전 기능</b></summary>
<div markdown="1">
정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 변경합니다 (단, 0이 맨 앞자리에 오는 것은 불가능합니다)
프로그램을 시작할 때 안내 문구를 보여주고, 선택할 수 있는 옵션을 만들어주세요.
옵션 중 게임 기록 보기의 기능은 완료한 게임들에 대해 시도 횟수를 보여줍니다.
게임을 종료할 경우 이전의 게임 기록들도 초기화해주세요
</aside>
</div>
</details>


## Ch.2 프로그래밍 심화 주차 과제

필수 구현: Issues: [필수 구현1](https://github.com/cjs1399/Team-Sparta/issues/7), [필수 구현2](https://github.com/cjs1399/Team-Sparta/issues/8), [필수 구현3](https://github.com/cjs1399/Team-Sparta/issues/9)

TIL & 트러블슈팅: Issues: [Ch.2 심화 주차 과제, 필수 문제 TIL 및 트러블 슈팅](https://github.com/cjs1399/Team-Sparta/issues/10) 

<details>
<summary><b>필수 구현</b></summary>
<div markdown="1">
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
</aside>
</div>
</details>

## Ch.3 앱 개발 입문 주차 과제(HarryPotterBookSeries)


### 📖 Using Library

라이브러리 | 사용 목적 | Management Tool
:---------:|:----------:|:---------:
SnapKit | UI Layout | SPM
Then | UI 선언 | SPM
RxSwift | 비동기적 데이터 흐름 작업 | SPM

작업 Repositories: [CSWHarryPotterBookSeries](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries)

필수 기능: Issues: [Lv1](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries/issues/2), [Lv2](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries/issues/3), [Lv3](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries/issues/4), [Lv4](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries/issues/5), [Lv5](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries/issues/6), [Lv6](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries/issues/7)

도전 기능: Issues: [Lv7](https://github.com/nbcampMasterChapter3Team4/CSWHarryPotterBookSeries/issues/7)

TIL & 트러블슈팅: Issues: [Ch.3 앱 개발 입문 주차 과제, TIL 및 트러블 슈팅](https://github.com/cjs1399/Team-Sparta/issues/17) 

### 필수 기능
<details>
  <summary><b>Level 1</b></summary>
  <div markdown="1">
    <ul>
        <img width="100" src="https://github.com/user-attachments/assets/2fd59a87-e17b-4cf4-aa72-124c3b673b56" />
      <li>UILabel을 사용해서 책 제목을 표시하는 UILabel을 구현합니다.</li>
      <li>data.json파일에 있는 데이터 가져오기</li>
      <li>data.json에 있는 시리즈 전권에 대한 데이터 중 한 권 데이터를 UI에 표시합니다.</li>
      <li>전체 시리즈(총 7권) 중에 한 권의 데이터를 UI로 표시합니다.예를 들어 1권(시리즈 첫번째)인 경우 1, 3권(시리즈 세번째)인 경우 3을 표시합니다. </li>
      <li>Json 데이터에서 해리포터 시리즈 첫번째 제목인 Harry Potter and the Philosopher’s Stone 을 표시합니다.</li>
      <li>책 제목 밑에 시리즈 순서를 표시합니다. </li>
      <li>이후 도전 구현으로 해리포터 시리즈 7권의 책에 대해서 모두 확인할 수 있도록 구현합니다.</li>
      <li>지금 필수 구현에서는 하나의 숫자만 표시합니다.</li>
      <li>superView와 safeArea를 고려하여 제약 조건을 설정합니다.</li>
      <li>책 제목: leading, trailing = superView 로 부터 20 떨어지도록 세팅, top = safeArea 로 부터 10씩 떨어지도록 세팅</li>
      <li>시리즈 순서: leading, trailing = superView 로 부터 20 이상 떨어지도록 세팅, top = 책 제목으로부터 16 떨어지도록 세팅</li>
    </ul>
  </div>
</details>
<details>
  <summary><b>Level 2</b></summary>
  <div markdown="1">
    <ul>
      <img width="100" src="https://github.com/user-attachments/assets/625bafba-6053-4e97-a19d-c45ee0d113c2" />
      <li>책 정보 영역을UIStackView 를 최대한 사용해 이미지와 텍스트를 사진과 같이 구성해보세요.</li>
      <li>책 정보 영역은 이 영역을 의미합니다.</li>
      <img width="150" src="https://github.com/user-attachments/assets/103a6155-a68b-4db3-a638-17af4bd26e2b" />
      <li>DataService.loadBooks()를 통해 Json 데이터를 가지고 오기 실패한 경우 Alert 창으로 에러의 원인을 사용자에게 알립니다.</li>
      <li>책 표지 이미지 속성 width = 100, height : width 비율은 1:1.5, contentMode는 어떤걸로 하면 좋을지 고민해보세요.</li>
      <li>책 제목 속성 Font = 시스템 볼드체, 사이즈 20, 색상 black</li>
      <li>저자 속성 타이틀(*Author*) 속성, Font = 시스템 볼드체, 사이즈 16, 색상 black, 저자(*J. K. Rowling*) 속성, Font = 사이즈 18, 색상 darkGray</li>
      <li>출간일 속성 타이틀(*Released*) 속성, Font = 시스템 볼드체, 사이즈 14, 색상 black, 출간일(June 26, 1997) 속성, Font = 사이즈 14, 색상 gray, `1998-07-02` 형태로 되어있는 Json 데이터를 변형하여 `June 26, 1997` 형태로 표시</li>
      <li>페이지 속성 타이틀(Pages) 속성, Font = 시스템 볼드체, 사이즈 14, 색상 black, 페이지 수(223) 속성, Font = 사이즈 14, 색상 gray.</li>
      <li>저자, 출간일, 페이지 수 속성 타이틀(Author)과 저자(J. K. Rowling) 사이 간격 8, 타이틀(Released)과 출간일(June 26, 1997) 사이 간격 8, 타이틀(Pages)과 페이지 수(*223*) 사이 간격 8</li>
      <li>AutoLayout  leading, trailing = safeArea에서 5만큼씩 떨어지도록 세팅, 책 정보 영역이 시리즈 순서 영역 하단에 위치, 시리즈 순서는 하기의 사진을 의미합니다. 이 외의 다른 부분은 자유롭게 구현합니다.</li>
      <img width="65"src="https://github.com/user-attachments/assets/0fd20e2b-c99e-4216-ac7e-4f19e2d8a96f" />
    </ul>
  </div>
</details>

<details>
  <summary><b>Level 3</b></summary>
  <div markdown="1">
    <ul>
      <img width="100" src="https://github.com/user-attachments/assets/59f46511-30a1-460f-88b6-04fafb51e422" />
      <li>UIStackView 와 UILabel을 사용해서 Dedication과 Summary 를 우외 같이 구성해보세요.</li>
      <li>Dedication과 Summary 영역은 이 부분을 의미합니다.</li>
      <img width="150" src="https://github.com/user-attachments/assets/2e0150f3-a77f-41c8-8fa7-2feb7fa32fff" />
      <li>Dedication 속성: 타이틀(Dedication) 속성, Font = 시스템 볼드체, 사이즈 18, 색상 black, 헌정사 내용 속성 Font = 사이즈 14, 색상 darkGray</li>
      <li>Summary 속성 타이틀(Summary) 속성 Font = 시스템 볼드체, 사이즈 18, 색상 black, 요약 속성, Font = 사이즈 14, 색상 darkGray</li>
      <li>Autolayout: Dedication 영역 top = 책 정보 영역과 24 떨어져 있도록 세팅 leading, trailing = superView와 20씩 떨어지도록 세팅 타이틀(Dedication)과 헌정사(내용) 사이 간격 8</li>
      <li>Summary 영역 top = Dedication 영역과 24만큼 떨어져 있도록 세팅 leading, trailing = superView와 20씩 떨어지도록 세팅, 타이틀(Summary)과 요약(내용) 사이 간격 8</li>
    </ul>
  </div>
</details>

<details>
  <summary><b>Level 4</b></summary>
  <div markdown="1">
<aside>
🧑🏻‍💻 `UIScrollView` 를 추가하여 스크롤할 수 있도록 구현한 후 목차(Chapters)를 왼쪽과 같이 구성해보세요.

- **스크롤 속성**
    - 책 제목과 시리즈 순서는 화면 상단에 고정
        - ‘책 제목과 시리즈 순서’는 이 부분을 의미합니다.
            

![Image](https://github.com/user-attachments/assets/030686bf-8439-4395-a53f-b527703054e3)
            
   - 책 정보(책 표지, 책 제목, 저자, 출간일, 페이지수) 영역부터 목차(Chapters)까지 스크롤 가능하도록 구현
   - 스크롤 바가 보이지 않도록 구현
- 목차 속성
    - `UIScrollView` 안에 `UIStackView`를 추가하고 해당 `UIStackView`안에`UILabel` 추가하여 구현
        - 전체적인 포함 관계:
        `UIScrollView` 안에 `UIStackView` 안에 `UILabel`들어 있는 구조
    - 각 챕터 사이 간격은 8
    - 타이틀(*Chapters*) 속성
        - Font = 시스템 볼드체, 사이즈 18, 색상 black
    - 목차 속성
        - Font = 사이즈 14, 색상 darkGray
- **Autolayout**
    - 목차 영역의 `top` = Summary 영역과 24만큼 떨어져 있도록 세팅
    - `leading`, `trailing` = superView와 20씩 떨어지도록 세팅
    - 타이틀(*Chapters*)과 첫번째 챕터 사이 간격 8
</aside>
  </div>
</details>

<details>
  <summary><b>Level 5</b></summary>
  <div markdown="1">
<aside>
🧑🏻‍💻 Summary 접기/더보기 기능을 구현해보세요.

- 글자수가 450자 이상인 경우 `…` 말줄임표 표시 및 `더보기` 버튼 표시
    - 참고로, 2권(시리즈 두번째)의 요약 내용은 글자수가 450자 미만이므로 더보기 버튼이 표시되지 않아야 합니다.
- `더보기` 버튼을 누르면 요약 텍스트 전체가 표시되고 `더보기` 버튼은 `접기` 버튼으로 변경
- 더보기/접기 상태를 저장해 앱을 종료했다가 다시 실행했을 때에도 마지막 상태를 기억하여 표시
    - `더보기` 버튼을 눌러 Summary를 펼친 상태로 앱을 종료했다면, 앱을 다시 실행했을 때 펼쳐진 상태로 표시되어 있습니다.
    반대로 `접기`버튼을 눌러 접은 상태로 종료했다면 앱 종료 후 다시 실행했을 때 접은 상태로 표시되어 있습니다.
</aside>
  </div>
</details>

<details>
  <summary><b>Level 6</b></summary>
  <div markdown="1">
<aside>
🧑🏻‍💻 시리즈 전체(7권) 순서 중 원하는 권수의 책 정보를 볼 수 있도록 왼쪽과 같이 구현해보세요.

- 전체 데이터는 `data.json`에 있으며 시리즈 순서대로 데이터가 제공됩니다.
- 시리즈 순서 버튼을 누르면 아래 부분의 데이터가 업데이트 되어야 합니다.
    - 화면 상단에 있는 책 제목도 함께 변경
        
        ![Image](https://github.com/user-attachments/assets/07dd6b89-92c0-47ca-bfbd-6117de4cff18)
        
    - 책 정보 영역: 책표지 이미지, 책제목, 저자, 출간일, 페이지수
        

        ![Image](https://github.com/user-attachments/assets/b1f66b02-0551-426c-86d7-4f60712de4af)

        
    - 헌정사(Dedication)
        

        ![Image](https://github.com/user-attachments/assets/4c971356-d10f-4e6b-b307-1208fe9bed0c)

        
    - 요약(Summary)
        

        ![Image](https://github.com/user-attachments/assets/de1f7954-12cb-4eac-bc96-ffaede620a24)

        
    - 목차(Chapters)
        

        ![Image](https://github.com/user-attachments/assets/49cad509-f1b2-4701-9d97-ea87633482f2)

        
- level 5에서 시리즈 권별로 더보기/접기 상태를 저장하는 기능을 잘 구현했다면, 각 시리즈 권별 마지막 더보기/접기 상태를 기억하고 있어야 합니다.
    - ‘시리즈 순서’는 이 view를 의미합니다.

        ![Image](https://github.com/user-attachments/assets/e7ae78a5-05e7-44c1-bae9-b00fea479c84)

</aside>

  </div>
</details>

### 도전 기능

<details>
  <summary><b>Level 7</b></summary>
  <div markdown="1">
<aside>
🧑🏻‍💻 iOS 16.0과 호환 가능한 iPhone 모델(SE 2세대, 16 Pro Max 등)의 다양한 디바이스 지원과 Portrait 모드/ Landscape 모드를 대응하여 왼쪽과 같이 구현해보세요.

- iOS 16.0 호환 모델 확인: [https://support.apple.com/ko-kr/guide/iphone/iphe3fa5df43/16.0/ios/16.0](https://support.apple.com/ko-kr/guide/iphone/iphe3fa5df43/18.0/ios/18.0)
- iOS 16 이상 모든 버전을 지원할 수 있도록 구현
- Portrait 모드와 Landscape 모드 대응
- 콘텐츠가 노치나 다이나믹 아일랜드 영역에 가려지지 않도록 구현해보세요.
- Autolayout이 제대로 구현되어있지 않다면 콘솔창에 Autolayout 관련 경고 메시지가 출력됩니다. 디바이스 방향을 바꾸더라도 (Portrait 모드 ↔ Landscape 모드) 콘솔창에 Autolayout 관련 경고 메시지가 뜨지 않도록 구현해보세요.
</aside>
</div>
</details>



## 앱 개발 입문 주차
간단한 사용으로 Apple 기기를 구매할 수 있는 서비스, 과수원 🍎

[ReadMe](https://github.com/nbcampMasterChapter3Team4/TeamProject/edit/main/README.md)

## 💻 Development Environment

<img src ="https://img.shields.io/badge/Xcode-16.2-blue?logo=xcode" height="30"> <img src ="https://img.shields.io/badge/iOS-16.0-white.svg" height="30">

<br>

## 📖 Using Library

라이브러리 | 사용 목적 | Management Tool
:---------:|:----------:|:---------:
SnapKit | UI Layout | SPM
Then | UI 선언 | SPM

<br>



## Ch 3.앱 개발 입문 주차 (개인 과제)

Issues: [Ch 3. 앱개발 숙련 주차 과제](https://github.com/cjs1399/Team-Sparta/issues/18)
PR: [Ch 3. 앱개발 숙련 주차 과제 및 트러블 슈팅](https://github.com/cjs1399/Team-Sparta/pull/19)

### 📖 Using Library

라이브러리 | 사용 목적 | Management Tool
:---------:|:----------:|:---------:
CoreData | 자체 저장 |
SnapKit | UI Layout | SPM
Then | UI 선언 | SPM
RxSwift | 비동기적 데이터 흐름 작업 | SPM


<details>
<summary><b>Lv 1</b></summary>
<div markdown="1">
🧑🏻‍💻 Level 1 - 메인 UI 기초 작업 + 데이터 불러오기

- `UILabel`, `UITableView`, 을 이용해서 기본적인 UI 를 구성합니다.
- Cell 의 높이는 자유롭게 지정합니다.
- 외부 Open API를 통해 실시간 환율 데이터를 불러오고 UI(테이블 뷰)에 반영해보세요.
- 사용 API: GET https://open.er-api.com/v6/latest/USD
    - url의 마지막 경로가 기준이 되는 통화. /USD 로 조회시 1달러 기준으로 다른 통화 환율이 표시됨.
    KRW로 바꾸어서 요청을 보내면 1원 기준으로 다른 통화 환율이 표시됨
- 응답 데이터를 `Codable`을 사용해 파싱하고, `ViewModel` 또는 `DataService`에서 관리합니다.
- 파싱한 데이터를 테이블 뷰에 표시합니다.
    - 소수점 4자리까지만 표시합니다
- 데이터가 없는 경우 "데이터를 불러올 수 없습니다" `Alert` 표시
</div>
</details>

<details>
<summary><b>Lv 2</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level2 - 메인 화면 구성

- 메인 화면을 구성하고 환율 데이터를 표시할 기본 UI를 구성해보세요.
- `UISearchBar`와 `UITableView`를 SnapKit을 활용해 구성합니다.
- 셀에는 다음 정보를 포함합니다:
    - 통화 코드 (예: KRW)
    - 국가명 (예: 대한민국)
    - 환율 값 (예: 1466.12)
- 오토레이아웃을 포함한 UI 디버깅 상황 중 Xcode 툴을 사용하여 문제 정의 + 문제 해결한 사례에 대해 그 해결 과정에 대해 기록합니다(1개 이상 필수)
</aside>
</div>
</details>
<details>
<summary><b>Lv 3</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level 3 - 필터링 기능 구현

- 통화 코드 또는 국가명을 검색할 수 있는 필터링 기능을 구현해보세요.
- 검색결과가 없을 경우 "검색 결과 없음" 표시
- 검색어가 비어있으면 전체 리스트 노출
</aside>
</div>
</details>
<details>
<summary><b>Lv 4</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level 4 - 환율 계산기로 이동

- 테이블 셀을 클릭했을 때, 환율 계산기로 이동하는 기능을 구현합니다.
- `UINavigationController.pushViewController()`를 사용하여 화면 전환
- 계산기 화면 구성 요소:
    - 통화 코드 및 국가 이름 레이블
    - 입력 필드 (`UITextField`)
    - 변환 버튼 (`UIButton`)
    - 결과 표시 (`UILabel`)
</aside>
</div>
</details>
<details>
<summary><b>Lv 5</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level 5 - 입력한 금액 실시간 반영

- 환율 계산기 화면에서 입력한 금액을 실시간으로 환산하는 기능을 구현해보세요.
    - 방법 1
        - https://open.er-api.com/v6/latest/USD api를 동일하게 사용해서 특정 currency의 환율을 가져와서 계산
    - 방법 2
        - 환율 정보 화면에서 이미 api를 호출했으므로, 셀에 있는 환율 정보를 가지고 계산기 화면에서 활용
- 잘못된 입력값(빈칸, 숫자 아님 등)은 `Alert` 처리
    - 빈칸일 경우 : 금액을 입력해주세요
    - 숫자 아닐 경우 : 올바른 숫자를 입력해주세요
- 결과값은 소수점 둘째자리로 반올림하여 표시
</aside>
</div>
</details>
<details>
<summary><b>Lv 6</b></summary>
<div markdown="1">
🧑🏻‍💻 Level 6 - MVVM 패턴을 도입하여 View와 로직을 분리

- ViewModel에서 API 호출, 필터링, 환율 계산 등의 로직 처리
- ViewController는 ViewModel의 데이터를 바인딩하고 UI만 담당
- ViewModel은 아래의 ViewModelProtocol을 채택하여 구현
- ViewController에서 ViewModel의 State를 클로저로 바인딩
</div>
</details>
<details>
<summary><b>Lv 7</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level 7 - 즐겨찾기 기능 상단 고정

- 즐겨찾기(⭐️) 기능을 추가해, 즐겨찾은 통화를 리스트 상단에 고정해보세요.
- 셀 우측에 ⭐ / ☆ 버튼 추가
    - 이미지 이름 : star.fill / star
- 클릭 시 해당 통화 코드가 `CoreData`에 저장/삭제됨
- 리스트 출력 시 즐겨찾기 데이터를 먼저 상단에 배치
    - 즐겨찾기된 데이터도 알파벳 오름차순 정렬이 되어야 함
- 즐겨찾기 상태에 따라 ⭐ / ☆ UI를 다르게 표시
</aside>
</div>
</details>
<details>
<summary><b>Lv 8</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level 8 - 상승 🔼 하락 🔽  여부 표시

- 환율 데이터를 캐싱하고, 이전 데이터와 비교해 상승 🔼 / 하락 🔽 여부를 표시해보세요.
- 앱 실행 시 이전 데이터를 `CoreData`에서 로드
- 새 데이터를 받아오면 이전 값과 비교 후 방향 아이콘 표시
- 아이콘 표시 기준:
    - `abs(new - old) > 0.01` 일때 상승/하락 아이콘 표시
    - `abs(new - old) <= 0.01` 일때는 아이콘 표시하지 않기(아이콘의 너비만큼 여백으로 처리하여 환율 숫자의 우측이 정렬되도록 함)
</aside>
</div>
</details>

<details>
<summary><b>Lv 9</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level 9 - 다크모드 구현

- 다크모드 UI를 구현해보세요.
- 시스템 색상`label`, `systemBackground`, `secondaryLabel`등을 사용하여 자동으로 다크모드에 대응합니다.
- 또는 Asset Catalog에서 Any/Dark 색상 설정을 활용할 수 있습니다.
</aside>
</div>
</details>
<details>
<summary><b>Lv 10</b></summary>
<div markdown="1">
<aside>
🧑🏻‍💻 Level 10 - 앱 상태 저장 및 복원

- 사용자가 마지막으로 본 화면 정보를 CoreData에 저장합니다.
- 앱을 재시작하면 환율 리스트 화면, 환율 계산기 화면 중 마지막으로 본 화면으로 이동합니다
    - 환율 계산기 화면은 어떤 통화에 대한 계산기 화면인지까지만 이동하고 입력 숫자, 결과값은 저장하지 않습니다
    - 환율 계산기 화면에서의 환율은 coreData에 저장된 환율을 가져옵니다
- `AppDelegate` 혹은 `SceneDelegate` 를 이용합니다
</aside>
</div>
</details>
<details>
<summary><b>Lv 11</b></summary>
<div markdown="1">
Level 11 -  메모리 이슈 디버깅 및 개선 경험 문서화
</div>
</details>
<details>
<summary><b>Lv 12</b></summary>
<div markdown="1">
Level 12 -  Clean Architecture 적용
</div>
</details>
