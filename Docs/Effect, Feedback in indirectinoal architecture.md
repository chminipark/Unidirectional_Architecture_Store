# Effect, Feedback in indirectinoal architecture

- MVVM의 개념에서 시작(데이터바인딩 기능, 뷰로직-비즈니스로직 분리)
- View is ViewModel에 대해 생각해보기
- 코드를 뷰에서 분리하려는 이유 → 테스트 하기 까다롭기 때문에, 적절한 위치 분리는 SOLID 원칙에도 맞음
- View Layer(뷰로직), Domain Layer(비즈니스로직) 관점에서 코드 분리하여 작성

## Store, State Container
- combine보다는 async await, asyncstream을 사용
- ObservableObject, MainActor 사용

#### State
- 앱전체의 단일 State (x)
- 나누어진 State (o)
-> child-parent간 결합도 있지만 일단 뷰 렌더링 문제 때문에
- view 렌더 전용 State, private state 두개로 분리

#### Action, Event, Message 
- 값타입인지, 함수인지에 따라 달라짐
- 값타입은 enum 사용시 간편하게 dot으로 접근가능, 구조화가능, 코드 직관성은 떨어짐, 코드간 jump가 많아짐
- 함수는 코드직관성은 좋음, dot접근 불가, 구조화 불가
- trade-off, 나는 값타입 사용

#### Effect, Feedback
- 로직분리(뷰로직, 비즈니스로직), 비동기처리
- 구현 방법 세가지 [참고](https://medium.com/better-programming/different-flavors-of-unidirectional-architectures-in-swift-781a01380ef6)
- Instead of “magically running” the effects based on the state change, let the reducer decide the effects to run.