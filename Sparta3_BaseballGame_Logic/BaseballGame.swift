//
//  BaseballGame.swift
//  Sparta3_BaseballGame_Logic
//
//  Created by seohuibaek on 11/7/24.
//

import Foundation

class BaseballGame {

    var input : [Int] = [] //사용자가 입력할 숫자 3자리를 담는 배열
    var randomNums : [Int] = [1,2,3] // 정답 숫자 3자리를 담는 배열
        
    var record = 0 // 각 게임 회차마다 횟수를 담을 배열
    let recordManager = RecordManager() // RecordManager의 인스턴스 생성
    
    func start() {
        while true {
            print("환영합니다! 원하는 번호를 입력해주세요.")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            let insertNum = readLine()
            
            switch insertNum {
            case "1":
                gameMode() // 게임 실행
                recordManager.add(record: record) // 게임이 끝난 후, 총 시도 횟수를 add함수로 전달
            case "2":
                recordManager.showRecords() // 게임 진행 상황 호출
            case "3":
                print("< 숫자 야구 게임을 종료합니다. >")
                return  // 게임 종료 후 함수 종료
            default:
                print("올바르지 않은 입력입니다. 1, 2, 3 중에서 선택해주세요.")
            }
        }
    }
    
    //정답 생성 함수
    func makeAnswer() {
        var numArr = [0,1,2,3,4,5,6,7,8,9] // 정답 숫자를 만들 때 쓰이는 배열

        for i in 0...2 {
            if i == 0 { // 1번째 정답 숫자 생성
                // 0을 제외한 숫자에서 선택하도록 설정
                let nonZeroNumbers = numArr.filter { $0 != 0 }
                if let num = nonZeroNumbers.randomElement() {
                    randomNums.append(num)
                    numArr.remove(at: numArr.firstIndex(of: num)!)
                }
            } else { // 2,3 번째 정답 숫자 생성
                if let num = numArr.randomElement() {
                    randomNums.append(num)
                    numArr.remove(at: numArr.firstIndex(of: num)!)
                }
            }
        }
    }
    
    func gameMode() {
        //makeAnswer()
        record = 0

        while true {
            var strike = 0
            var ball = 0
            
            record = record + 1
            
            print("숫자를 입력하세요.")
            
            // 숫자 입력 및 유효성 검사
            if let line = readLine() {
                // 입력된 문자열을 숫자 배열로 변환
                input = line.split(separator: "").compactMap { Int($0) }
                
                // 조건: 세 자리 숫자, 첫 번째 숫자가 0이 아닌지, 중복 숫자가 없는지 확인
                guard input.count == 3, input[0] != 0, Set(input).count == 3 else {
                    print("올바르지 않은 입력 값 입니다.")
                    continue
                }
            }

            print(input)

            for i in 0..<input.count {
                //스트라이크 계산
                if input[i] == randomNums[i] {
                    strike += 1
                }
                
                //볼 계산
                if randomNums.contains(input[i]) {
                    ball += 1
                }
            }
            ball -= strike // 볼 카운트에서 스트라이크 값 제외
            
            //결과값 출력
            if strike == 0 && ball > 0 {
                print("\(ball) Ball")
                
            } else if strike > 0 && ball == 0 {
                print("\(strike) Strike")
                
            } else if strike == 0 && ball == 0 {
                print("Nothing")
                
            } else if strike == 3 {
                print("정답입니다!")
                return
            }
            
            print(input)
            print(randomNums)
            
            print(strike)
            print(ball)
            
            print("\(strike) Strike \(ball) Ball")
        }
    }
}
