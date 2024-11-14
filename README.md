# 내배캠 개인과제3: 야구 게임 로직 구현하기

## 필수 구현 기능
- Lv.1: 3자리 랜덤 숫자 생성(1에서 9까지의 서로 다른 임의의 수 3자리)
- Lv.2: 사용자가 3자리 수를 입력하고 힌트 받기 (n Strike, n Ball)
- Lv.3:  3자리 랜덤 숫자 생성(1에서 9까지의 서로 다른 임의의 수 3자리, 맨 앞 0 불가능)
- Lv.4: 프로그램을 시 안내문구 생성 (1. 게임 시작, 2. 게임 기록 , 3. 종료)
- Lv.5: 게임 기록 보여주기
- Lv.6: 프로그램 종료하기
- *모든 예외 처리 필수!

## 규칙
게임에 들어가면 게임 모드(A), 기록 보기(B), 종료하기(C) 3가지 모드를 선택할 수있다.

### A. 게임 모드
#### 1) 사용자 입력 및 정답 생성
0~9까지의 3자리수 랜덤 숫자가 정답으로 생성되며, 사용자도 3자리 수를 입력한다.
단, 숫자는 중복 불가, 맨 앞에 0이 오는 것이 불가 하다. (정답, 사용자 입력 모두 해당)

#### 2) 결과 출력: 
같은 자리, 같은 수 -> Strike
다른 자리, 같은 수 -> Ball
다 맞을 경우(3 Strike) -> 정답!
다 틀릴 경우 (0 Strike, 0 Ball) -> Nothing
맨 앞에 0, 중복 숫자, 문자 입력할 경우 -> Error 문구 출력
*정답일 때까지 반복(정답 일 경우, 종료 후 모드 선택으로 돌아감)

### B. 기록 보기
이전 게임들에 대한 시도 횟수를 보여준다.
프로그램이 종료(C)되면 기록도 전체 리셋 된다.
ex) n번째 게임: 시도 횟수 - N

기록 출력 후, 모드 선택으로 돌아감

### C. 종료하기
이전 기록 초기화 및 게임 종료가 진행된다.

## 작업 기간
- 2024.11.06~2024.11.08

## Stacks
<img src="https://img.shields.io/badge/Swift-F05138?style=flat&logo=swift&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white"/></a>
<img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white"/></a>

## Commit Convention
- Feat: 새로운 기능 추가
- Fix: 버그 수정
- Ci: CI관련 설정 수정
- Docs:	문서 (문서 추가, 수정, 삭제)
- Style:	스타일 (코드 형식, 세미콜론 추가: 비즈니스 로직에 변경 없는 경우)
- Refactor:	코드 리팩토링
- Test:	테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없는 경우)
- Chore:	기타 변경사항 (빌드 스크립트 수정 등)

## Troubleshooting
[과제 구현 과정 및 트러블 슈팅](https://velog.io/@soycong/%EB%82%B4%EB%B0%B0%EC%BA%A0-Task-3-%EC%95%BC%EA%B5%AC-%EA%B2%8C%EC%9E%84-%EB%A1%9C%EC%A7%81-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0)
