//
//  BaseballGame.swift
//  Sparta3_BaseballGame_Logic
//
//  Created by seohuibaek on 11/7/24.
//

import Foundation

class BaseballGame {
    // 숫자 입력
    //var input = readLine()!.split(separator: "").map {Int($0)!}
    var input : [Int] = []
    var numArr = [0,1,2,3,4,5,6,7,8,9]
    var randomNums : [Int] = [1,2,3]
    var recordArr : [Int] = []
    
    var strike = 0
    var ball = 0
    var record = 0
    
    
    func start() {
        print("환영합니다! 원하는 번호를 입력해주세요.")
        print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
        
        var insertNum = Int(readLine()!)!
        
        switch insertNum {
        case 1:
            game()
        case 2:
            let game = BaseballGame()
            game.start()
        case 3:
            let game = BaseballGame()
            game.start()
        default:
            let game = BaseballGame()
            game.start()
        }
    }
    
    func makeAnswer() {
        // 정답 생성
        /*for i in 0...2 {
         if let num = numArr.randomElement() {
         randomNums.append(num)
         numArr.remove(at: numArr.firstIndex(of: num)!)
         } else {
         print("nil")
         }
         }*/
    }
    
    func game() {
        makeAnswer()
        
        while true {
            record = record + 1
            
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
            
            for i in input {
                //스트라이크 계산
                if i == randomNums[i] {
                    strike = strike + 1
                }
                
                //볼 계산
                if randomNums.contains(i) == true {
                    ball = ball + 1
                }
            }
            ball = ball - strike // 볼 카운트에서 스트라이크 값 제외
            
            if strike == 3 {
                print("정답입니다!")
                break
            } else if strike == 0 && ball == 0 {
                print("Nothing")
            }
            
            print(input)
            print(randomNums)
            
            print(strike)
            print(ball)
            
            print("\(strike) Strike \(ball) Ball")
        }
        recordArr.append(record)
    }
}
