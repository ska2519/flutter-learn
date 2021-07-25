# 플러터 런 - Flutter Learn

Flutter와 Firebase Firestore, Cloud Functions으로 서버리스 다중 플랫폼 커뮤니티 앱을 빌드합니다.  

**완성 된 앱은 Dart 코드베이스에서 Android, iOS 및 웹에서 실행됩니다.**  
(Cloud Functions은 TypeScript)

이 프로젝트는 Flutter에서 [Riverpod](https://riverpod.dev) 상태 관리 기술을 사용하여 커뮤니티 앱을 ([로플리](https://www.lawfully.com/)에서 영감을 받음) 구현합니다.  

이 프로젝트는 게시판 기능과 YouTube API를 사용해 영상을 재생하며  
가입&로그인과 Firebase Firestore 데이터 저장, Cloud Functions으로 백엔드 기능을 포함합니다.

## 개발 진행도 - 70%

**Android 플러터 런 : [`구글 플레이 다운로드`](https://play.google.com/store/apps/details?id=dev.flutterlearn.flutter_learn)**

**Website 플러터 런 : [`https://flutter-learn.dev`](https://flutter-learn.dev)**

*Read this in other languages: [English](README.en.md)

## 앱 개요

애플리케이션은 **커뮤니티**, **유튜브**, **프로필**의 세 가지 기본 화면으로 구성됩니다.  

**커뮤니티** 페이지는 게시판을 제공합니다.  
게시판은 글작성, 좋아요, 댓글, 태그 필터링, 검색이 가능합니다.

**유튜브** 페이지는 YouTube API로 유튜브 플레이리스트를 가져와 재생합니다.  
각 동영상은 API에서 검색된 썸네일 URL을 사용하여 이미지 링크로 표시됩니다.   
동영상을 즐겨찾기로 추가 할 수 있으며 이 환경 설정은 **Firebase Firestore**에 유지됩니다.  

**프로필** 페이지에서 현재 선택한 프로필을 업데이트하고 작성 및 저장, 좋아요한 글을 확인합니다.
## 기능

- 게시판
- 유튜브 태그별 플레이 리스트 영상 재생
- 프로필 페이지
- Firebase Cloud Firestore 데이터 관리 (users, posts, tags, count, videos 컬렉션 분류)

**Flutter, Firebase, Cloud Functions, Riverpod을 결합하여 재사용이 가능한 서버리스 멀티 플랫폼 앱을 개발합니다.**

**앱의 구조는 MVVM(Model-View-ViewModel) 패턴을 따릅니다.**
# Front-end (Android, iOS, Web)
- ### 커뮤니티
  - [x] 게시판 로딩 애니메이션
  - [x] 글 쓰기
  - [x] 삭제
  - [x] 수정
  - [x] 좋아요
  - [x] 댓글
    - [x] 댓글 좋아요
    - [x] 댓글 수정
    - [x] 대댓글 작성
    - [x] 대댓글 좋아요
  - [x] 삭제 유저 글 삭제 시 댓글 남아 있을 시 안내
  - [x] 태그
  - [x] 태그로 카테고리 분류
######
- ### 유튜브
  - [x] YouTube API로 플레이리스트 가져오기
  - [x] 플레이리스트로 카테고리 탭 분류
  - [x] 유튜브 영상 재생
  - [ ] 영상별 태그 설정 및 다시보기 리스트에 저장
######
- ### 회원가입 & 로그인
  - [x] Email 로 가입
  - [x] Google 계정으로 가입
  - [x] Apple 계정으로 가입
  - [x] 로그 아웃
  - [x] 계정 삭제
######
- ### 설정
  - [x] 회원 정보 업데이트
  - [x] 앱 설정
  - [x] 내 게시글
  - [x] 내 댓글
  - [x] 좋아요 한 게시글
  - [x] 읽은 게시글
######
- ## Mobile
  - [x] 다중 언어 지원 - 영문 버전
  - [x] 시작(Splash) 스크린
  - [x] 화면 사이즈에 따른 위젯 사이즈 조정
  - [x] 네비게이션
  - [x] Desktop 사이즈 시 SideMenu 적용
######
- ## Web
  - [x] 페이지별 주소 설정
  - [x] 웹 브라우저 아이콘 적용 - Favicon
  - [x] 웹 브라우저 제목 적용
  - [x] Web App Icon
  - [x] 로딩 스크린
  - [ ] 잘못된 주소 처리
######
# Backend & Database
  - [x] 개발, 출시 프로젝트 분리
  - [x] Cloud Firestore 세분화 된 규칙 적용
  - [x] algolia 확장프로그램으로 글 검색 구현
######
- ### Firebase Authentication
  - [x] Anonymous Login
  - [x] Email Login
  - [x] Google Login
  - [x] Apple Login  
######
- ### Firebase Crashlytics
  - [x] Android, iOS 크래쉬 리포트
######
- ### Firestore Database
  - [x] Firestore 데이터 구조 설계
  - [x] Firestore Collection Group Queries
  ######
- ### Firebase Hosting
  - [x] 호스팅 웹사이트 
  - [x] GitHub Actions 웹사이트 빌드 & 배포
######
- ### Firebase Functions
  - [x] 유저 가입, 탈퇴 시 카운트
  - [x] 포스트 추가, 삭제 시 카운트
  - [x] 글 읽은 유저 수 카운트
  - [x] 댓글 추가, 삭제 시 총 댓글 카운트
  - [x] 태그 카운트
  - [x] 댓글 FCM 알림
  - [x] 대댓글 FCM 알림
  - [x] 좋아요 FCM 알림
  - [x] 댓글 좋아요 FCM 알림

##  CI/CD 출시 자동화 - Codemagic
- [x] Build for Android
- [x] Build for iOS
######
# 앱 구조
이 앱은 Dart 코드베이스에서 Android, iOS 및 Web에서 실행하기 위해 만들어졌습니다.  
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
  /models
  /routes
  /services
  /translations
  /utils
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
######
# 사용중인 패키지

앱의 '핵심' 패키지는 다음과 같습니다 :

- [hooks_riverpod](https://riverpod.dev/) 기존 provider를 개선한 유연하고 간편한 상태관리 라이브러리
- [freezed](https://pub.dev/packages/freezed) for app state and [json_annotation](https://pub.dev/packages/json_annotation) for data serialization
- [firebase_auth](https://pub.dev/packages/firebase_auth) 비밀번호, 전화번호, ID 제공업체(예: Google, Facebook, Twitter 등)를 통한 회원 가입
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) 유연하고 확장 가능한 NoSQL 클라우드 데이터베이스
- [cloud_firestore](https://pub.dev/packages/cloud_firestore)Google의 강력하고 단순하며 경제적인 객체 저장소 서비스
- [firebase_messaging](https://pub.dev/packages/firebase_messaging)Firebase 클라우드 메시징(FCM) 무료 앱 알림 메시지
- [firebase_crashlytics](https://pub.dev/packages/cloud_firestore) 오류 보고 솔루션으로 앱(iOS, Android) 문제에 대한 명확하고 활용 가능한 분석 정보를 확인
- [algolia](https://www.algolia.com) Cloud functions으로 결합하여 Firestore 글 검색 구현
- [dio](https://pub.dev/packages/dio) for the API client
- [youtube_player_iframe](https://pub.dev/packages/youtube_player_iframe) YouTube 동영상을 인라인으로 재생하거나 스트리밍 가능한 플러그인
- [easy_localization](https://pub.dev/packages/easy_localization) 국제화 앱(영문, 한글판) 구현
- [lint](https://pub.dev/packages/lint) Dart, Flutter 프로젝트에 대한 린트 규칙 - Effective Dart: Style Guide 적용
- 
사용하는 패키지 리스트
  - algolia: ^1.0.1
  - cached_network_image: ^3.0.0
  - cloud_firestore: ^2.3.0
  - cupertino_icons: ^1.0.2
  - dio: ^4.0.0
  - duration: ^3.0.6
  - easy_localization: ^3.0.0
  - equatable: ^2.0.2
  - file_picker: ^3.0.3
  - firebase_analytics: ^8.1.2
  - firebase_auth: ^2.0.0
  - firebase_core: ^1.3.0
  - firebase_crashlytics: ^2.0.7
  - firebase_messaging: ^10.0.3
  - firebase_storage: ^9.0.0
  - fl_chart: ^0.36.1
  - flutter_hooks: ^0.17.0
  - flutter_svg: ^0.22.0
  - freezed_annotation: ^0.14.2
  - google_fonts: ^2.1.0
  - google_sign_in: ^5.0.4
  - hooks_riverpod: ^0.14.0+4
  - image: ^3.0.2
  - image_picker: ^0.7.4
  - intl: ^0.17.0
  - lint: ^1.5.3
  - numeral: ^1.2.4
  - package_info_plus: ^1.0.3
  - pedantic: ^1.11.0
  - shimmer: ^2.0.0
  - sign_in_with_apple: ^3.0.0
  - textfield_tags: ^1.3.1
  - url_launcher: ^6.0.9
  - uuid: ^3.0.4
  - youtube_player_iframe: ^2.1.0

dev_dependencies:
  - build_runner: ^2.0.4
  - flutter_launcher_icons: ^0.9.0
  - flutter_native_splash: 1.1.8+4
  - freezed: ^0.14.2
  - json_serializable: ^4.1.3
