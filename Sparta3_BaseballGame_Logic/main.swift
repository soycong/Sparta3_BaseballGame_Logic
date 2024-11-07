//
//  main.swift
//  Sparta3_BaseballGame_Logic
//
//  Created by seohuibaek on 11/6/24.
//

import Foundation

// 숫자 입력
//var input = readLine()!.split(separator: "").map {Int($0)!}
var input : [Int] = []
var numArr = [0,1,2,3,4,5,6,7,8,9]
var randomNums : [Int] = [1,2,3]

var strike = 0
var ball = 0

print("숫자를 입력하세요.")

// 숫자 입력 및 유효성 검사
if let line = readLine() {
    //compactMap{ Int($0) }를 통해 숫자만 입력되게 함
    input = line.split(separator: "").compactMap{ Int($0) }
    
    if Set(input).count < 3 { //중복 값 입력한 경우, 문자가 있어 compactMap을 통해 지워진 경우
        print("올바르지 않은 입력 값 입니다.")
    }
}
print(input)

// 정답 생성
/*for i in 0...2 {
    if let num = numArr.randomElement() {
        randomNums.append(num)
        numArr.remove(at: numArr.firstIndex(of: num)!)
    } else {
        print("nil")
    }
}*/


// 스트라이크 계산
for i in 0...2 {
    if input[i] == randomNums[i] {
        strike = strike + 1
    }
}

// 볼 계산
for i in 0...2 {
    if randomNums.contains(input[i]) == true {
        ball = ball + 1
    }
}

ball = ball - strike // 볼 카운트에서 스트라이크 값 제외

if strike == 3 {
    print("정답입니다!")
} else if strike == 0 && ball == 0 {
    print("Nothing")
}

print(input)
print(randomNums)

print(strike)
print(ball)

print("\(strike) Strike \(ball) Ball")
