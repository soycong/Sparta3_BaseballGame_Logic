//
//  BaseballGame.swift
//  Sparta3_BaseballGame_Logic
//
//  Created by seohuibaek on 11/7/24.
//

import Foundation

enum Mode: String {
    case gameStart = "1"
    case gameRecord = "2"
    case gameExit = "3"
}

class BaseballGame {
    var input : [Int] = [] //사용자가 입력할 숫자 3자리를 담는 배열
    var randomNums : [Int] = [] // 정답 숫자 3자리를 담는 배열
    
    let strikeCount = 3 //스트라이크 3개면 정답
    let minCount = 0
        
    var record = 0 // 각 게임 회차마다 횟수를 담을 배열
    let recordManager = RecordManager() // RecordManager의 인스턴스 생성
    
    func start() {
        while true {
            print("환영합니다! 원하는 번호를 입력해주세요.")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            
            guard let insertNum = readLine() else {
                print("프로그램이 종료되었습니다")
                exit(0)
            }
            
            switch Mode(rawValue: insertNum) {
            case .gameStart:
                gameMode() // 게임 실행
                recordManager.add(record: record) // 게임이 끝난 후, 총 시도 횟수를 add함수로 전달
                
            case .gameRecord:
                print("<게임 기록>")
                print(recordManager.showRecords()) // 게임 진행 상황 호출
                
            case .gameExit:
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
        randomNums = [] //초기화

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
        makeAnswer()
        record = 0

        while true {
            record = record + 1 // 시도 횟수 증가
            
            print("숫자를 입력하세요.")
            
            // 숫자 입력 및 유효성 검사
            if let line = readLine() {
                // 입력된 문자열을 숫자 배열로 변환
                input = line.split(separator: "").compactMap { Int($0) }

                guard input.count == 3 else {
                    print("올바르지 않은 입력 값 입니다. 3자리 숫자를 입력하세요.")
                    continue
                }

                guard input[0] != 0 else {
                    print("올바르지 않은 입력 값 입니다. 첫번째 숫자는 0이 될 수 없습니다.")
                    continue
                }

                guard Set(input).count == 3 else {
                    print("올바르지 않은 입력 값 입니다. 중복된 숫자는 입력될 수 없습니다.")
                    continue
                }
            }
            
            let (strike, ball) = makeHintNumber() //스트라이크, 볼 계산
            
            print(printHint(strike: strike, ball: ball)) //결과 출력
            
            if strike == strikeCount { // 게임 종료 조건
                return
            }
        }
    }
    
    func makeHintNumber() -> (Int, Int) {
        var strike = 0
        var ball = 0

        for i in 0..<input.count {
            if input[i] == randomNums[i] { //스트라이크 계산
                strike += 1
            } else if randomNums.contains(input[i]) { //볼 계산
                ball += 1
            }
        }
        
        return (strike, ball)
    }
    
    func printHint(strike: Int, ball: Int) -> String {
        var hint: String = ""
        
        //힌트 출력
        if strike == strikeCount {
            hint = "정답입니다!"
        } else if strike == minCount && ball == minCount {
            hint = "Nothing"
        } else {
            hint = "\(strike) Strike \(ball) Ball"
        }
        return hint
    }
}
