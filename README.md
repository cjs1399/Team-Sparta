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

필수 기능: Issues: [Lv1](https://github.com/cjs1399/Team-Sparta/issues/1), [Lv2](https://github.com/cjs1399/Team-Sparta/issues/2)

도전 기능: Issues: [Lv3](https://github.com/cjs1399/Team-Sparta/issues/3), [Lv4](https://github.com/cjs1399/Team-Sparta/issues/4), [Lv5](https://github.com/cjs1399/Team-Sparta/issues/5), [Lv6](https://github.com/cjs1399/Team-Sparta/issues/6)

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
