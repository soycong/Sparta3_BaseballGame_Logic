//
//  RecordManager.swift
//  Sparta3_BaseballGame_Logic
//
//  Created by seohuibaek on 11/7/24.
//

class RecordManager {
    var records: [Int] = [] // 게임 기록을 저장할 배열
    
    // 게임 기록 추가
    func add(record: Int) {
        records.append(record)
    }
    
    // 저장된 게임 기록 출력
    func showRecords() {
        if records.isEmpty {
            print("저장된 게임 기록이 없습니다.")
        } else {
            print("게임 기록:")
            for (index, record) in records.enumerated() {
                print("게임 \(index + 1): \(record)회")
            }
        }
    }
}

