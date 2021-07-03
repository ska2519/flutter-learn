# Flutter Learn

Flutter 와 Firebase Firestore로 다중 플랫폼 커뮤니티 앱을 빌드합니다.  

완성 된 앱은 단일 Dart 코드베이스에서 Android, iOS 및 웹에서 실행됩니다.  

이 프로젝트는 Flutter에서 [Riverpod](https://riverpod.dev) 상태 관리 기술을 사용하여 커뮤니티 앱을 ([로플리](https://www.lawfully.com/)에서 영감을 받음) 구현합니다.  

이 프로젝트는 게시판 기능과 YouTube API를 사용하여 동영상 목록을 가져오고 가입 & 로그인과 Firebase Firestore 데이터 저장 기능을 포함합니다.  

*주소: [`https://flutter-learn.dev`](https://flutter-learn.dev)*

*Read this in other languages: [English](README.en.md)

## 앱 개요

애플리케이션은 **커뮤니티**, **유튜브** 및 **프로필**의 세 가지 기본 화면으로 구성됩니다.  
처음 시작할 때 앱은 사용자에게 프로필 생성을 요청합니다.  

**커뮤니티** 페이지는 게시판을 제공합니다.  
게시판은 글작성, 이미지 첨부, 댓글, 추천, 필터링이 가능 합니다.  

**유튜브** 페이지는 YouTube API에서 동영상 목록을 로드합니다.  

각 동영상은 API에서 검색된 썸네일 URL을 사용하여 이미지 링크로 표시됩니다. ❤️ 아이콘을 탭하여 동영상을 즐겨찾기로 추가 할 수 있으며 이 환경 설정은 **Firebase Firestore**에 유지됩니다.  

<!-- 현재 선택한 프로필의 즐겨찾기 목록을 보려면 **즐겨찾기** 페이지를 엽니다.
*Open the **Favorites** page to see the list of Favorites for the currently selected profile.* -->

**프로필** 페이지를 사용하여 현재 선택한 프로필을 업데이트합니다.

## 기능

- 게시판
- 유튜브 영상 리스트
- 프로필 페이지
- Firebase Cloud Firestore 데이터 관리 (게시판, 즐겨찾기, 프로필)

**Flutter, Firebase, Riverpod을 결합하여 재사용이 가능한 멀티 플랫폼 앱을 개발하고 있습니다.**  

## 앱 기능 구현

- [x] 다중 언어 지원 - 영문 버전

- [x] 화면 사이즈에 따른 위젯 사이즈 조정
- [x] 네비게이션 바
  - [x] Desktop 사이즈 시 SideMenu 적용

- [x] 커뮤니티
  - [x] 글 쓰기
  - [x] 삭제
  - [x] 수정
  - [x] 좋아요
  - [x] 댓글
    - [x] 댓글 좋아요
    - [x] 댓글 수정
    - [x] 대댓글 작성
    - [x] 대댓글 좋아요
  - [x] 삭제 유저 글 삭제 시 댓글 남아 있으면 작성자 삭제 안내
 
- [x] 회원가입 & 로그인
  - [x] Email 로 가입
  - [x] Google 계정으로 가입
  - [x] Apple 계정으로 가입
  - [x] 로그 아웃
  - [x] 계정 삭제
  - [x] 회원 정보 업데이트

  - [x] 앱설정
  - [x] 내 게시글
  - [x] 내 댓글
  - [x] 좋아요 한 게시글
  - [x] 읽은 게시글

 - [x] Shimmer Loading Animation
 - [x] Splash Screen
## 구현 예정
  - [ ] 카테고리
  - [ ] 태그
    - [ ] 태그 추천
- [ ] 유튜브
- [ ] SideMenu 클릭 시 화면 변경

## Web 기능 구현
- [x] Route
- [x] Favicon
- [x] Title
- [x] Web App Icon
- [x] 로딩 스크린
- [ ] 잘못된 주소 처리

## Firebase 기능 구현
- [x] 개발, 출시 프로젝트 분리
  - [x] 개발 Firestore Database
  - [x] 개발 Firebase Functions
  
- [x] Firebase Authentication
  - [x] Anonymous Login
  - [x] Email Login
  - [x] Google Login
  - [x] Apple Login
    
- [x] Firebase Crashlytics
  - [x] Android, iOS 크래쉬 리포트

- [x] Firestore Database
  - [x] Firestore 데이터 구조 설계
  - [x] Firestore Collection Group Queries
  
- [x] Firebase Hosting
  - [x] 호스팅 웹사이트 
  - [x] GitHub Actions 웹사이트 빌드 & 배포
  
- [x] Firebase Functions
  - [x] 유저 가입, 탈퇴 시 카운트
  - [x] 포스트 추가, 삭제 시 카운트
  - [x] 글 읽은 유저 수 카운트
  - [x] 댓글 추가, 삭제 시 총 댓글 카운트

- [x] Cloud Firestore 세분화 된 규칙

##  CI/CD Codemagic 적용
- [x] Build for Android
- [x] Build for iOS
## 앱 구조

이 앱은 단일 Dart 코드베이스에서 Android, iOS 및 웹에서 실행하기 위해 만들어졌습니다.  
이를 가능하게 하기 위해 **재사용이 높은** 아키텍처가 설계되었습니다.  

프로젝트 폴더는 다음과 같이 구성됩니다 :

``` dart
/android
/assets
/ios
/web
/functions
  ... and more
/lib
  /constants
  /controllers
  /exceptions
  /l10n
  /models
  /routes
  /services
  /app
    /home
      /account
      /community
      /desktop
      /youtube
    /sign_in
      /email
    /widgets
      /alert_dialogs
      /buttons
```

## 사용중인 패키지

앱의 '핵심' 패키지는 다음과 같습니다 :

- [freezed](https://pub.dev/packages/freezed) for app state and [json_annotation](https://pub.dev/packages/json_annotation) for data serialization
- [firebase_auth](https://pub.dev/packages/firebase_auth) for authentication
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) for Firebase Cloud Firestore data persistence
- [dio](https://pub.dev/packages/dio) for the API client

### 지속적인 업데이트 중
