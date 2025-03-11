# Team-Sparta

## Ch.1 Onboarding
[다짐 기록 앱 만들기](https://github.com/cjs1399/Team-Sparta/tree/main/Sparta)

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

필수 기능: Issues: https://github.com/cjs1399/Team-Sparta/issues/1, https://github.com/cjs1399/Team-Sparta/issues/2

도전 기능: Issues:

### 필수 기능
1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다.
정답은 랜덤으로 만들어지며, 정답을 맞추기 위해 3자리수를 입력하고 힌트를 받습니다.
힌트는 야구용어인 볼과 스트라이크입니다.
같은 자리에 같은 숫자가 있는 경우 스트라이크, 다른 자리에 있는 경우 볼입니다.

만약 올바르지 않은 입력값 (중복, 숫자 외의 다른 값, 3자리에 충족하지 않는 입력)을 입력할 경우 오류 문구를 나타냅니다.
