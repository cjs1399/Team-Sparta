//
//  Lv1.swift
//  TeamSparta_Ch2
//
//  Created by 천성우 on 3/18/25.
//

import Foundation


//두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
//클로저 내부에서는 두 정수를 더한 후, "두 수의 합은 {합계} 입니다"라는 문자열을 반환합니다.
//이 클로저를 상수 sum에 저장하고, 정확한 타입을 명시해주세요.
//sum을 호출하는 코드를 작성해주세요. (파라미터로 전달하는 값은 임의로 선택)
//위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
//(조건) calculate 함수 구현 내에서는 파라미터로 전달받은 클로저를 호출하는 코드를 포함해야합니다.

let sum: (Int, Int) -> String = { a, b in
    return "두 수의 합은 \(a + b)입니다"
}
var num: Int = 3
//let result = sum(num, 3)

func calculate(total: (Int, Int) -> String) {
    let output = total(7, 2)
    print(output)
}
