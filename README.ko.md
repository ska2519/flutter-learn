# Flutter Learn

Flutter 와 Firebase Firestore로 다중 플랫폼 커뮤니티 앱을 빌드합니다.  

완성 된 앱은 단일 Dart 코드베이스에서 Android, iOS 및 웹에서 실행됩니다.  

이 프로젝트는 Flutter에서 [Riverpod](https://riverpod.dev) 상태 관리 기술을 사용하여 커뮤니티 앱을 ([로플리](https://www.lawfully.com/)에서 영감을 받음) 구현합니다.  

이 프로젝트는 YouTube API를 사용하여 동영상 목록을 가져오고 가입 & 로그인과 Firebase Firestore 데이터 저장 기능을 포함합니다.  

*주소: [`https://flutter-learn.dev`](https://flutter-learn.dev)*

*Read this in other languages: [English](README.md), [한국어](README.ko.md)

## 앱 개요

애플리케이션은 **커뮤니티**, **비디오** 및 **프로필**의 세 가지 기본 화면으로 구성됩니다.  
처음 시작할 때 앱은 사용자에게 프로필 생성을 요청합니다.  

**커뮤니티** 페이지는 게시판을 제공합니다.  
게시판은 글작성, 이미지 첨부, 댓글, 추천, 필터링이 가능 합니다.  

**동영상** 페이지는 YouTube API에서 동영상 목록을 로드합니다.  

각 동영상은 API에서 검색된 썸네일 URL을 사용하여 이미지 링크로 표시됩니다. ❤️ 아이콘을 탭하여 동영상을 즐겨찾기로 추가 할 수 있으며 이 환경 설정은 **Firebase Firestore**에 유지됩니다.  

<!-- 현재 선택한 프로필의 즐겨찾기 목록을 보려면 **즐겨찾기** 페이지를 엽니다.
*Open the **Favorites** page to see the list of Favorites for the currently selected profile.* -->

**프로필** 페이지를 사용하여 현재 선택한 프로필을 업데이트합니다.

## 기능

- Community
- Videos (with pagination)
- Save Favorites to Favorites list
- Update profile
- Firebase Firestore data persistence (community, favorites, profile)

**Flutter, Firebase, Riverpod을 결합하여 재사용이 가능한 멀티 플랫폼 앱을 개발하고 있습니다.**  

## 앱 기능 구현

- [ ] 화면 사이즈에 따른 위젯 조정
- [ ] 하단 네비게이션 바
  - [ ] Desktop 사이즈 시 SideMenu로 변경
- [ ] 회원가입 & 로그인
  - [ ] Email 로 가입
  - [ ] Google 계정으로 가입
  - [ ] Apple 계정으로 가입
  - [ ] Github 계정으로 가입
  - [ ] Kakao 계정으로 가입
- [ ] 커뮤니티
  - [ ] 카테고리
  - [ ] 글쓰기
  - [ ] 삭제
  - [ ] 수정
  - [ ] 좋아요
  - [ ] 태그
    - [ ] 태그 추천
  - [ ] 댓글
    - [ ] 댓글 좋아요
    - [ ] 댓글 수정
- [ ] 유튜브

## Firebase 기능 구현

- [ ] Firebase Authentication 설정
- [ ] Firebase 호스팅에 웹 앱 배포
- [ ] GitHub workflows로 웹 호스팅 자동화
- [ ] Cloud Firestore 데이터 구조 설정
- [ ] Cloud Firestore 세분화 된 규칙 설정

## 앱 구조

이 앱은 단일 Dart 코드베이스에서 Android, iOS 및 웹에서 실행하기 위해 만들어졌습니다. 이를 가능하게 하기 위해 **재사용성이 높은** 아키텍처가 설계되었습니다.  

프로젝트 폴더는 다음과 같이 구성됩니다 :

``` dart
/android
/assets
/ios
/web
  ... and more
/lib
  /constants
  /controllers
  /models
  /routes
  /app
    /home
    /sign_in
```

## 사용중인 패키지

앱의 '핵심' 패키지는 다음과 같습니다 :

- [freezed](https://pub.dev/packages/freezed) for app state and [json_annotation](https://pub.dev/packages/json_annotation) for data serialization
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) for Firebase Cloud Firestore data persistence
- [firebase_auth](https://pub.dev/packages/firebase_auth) for authentication
- [dio](https://pub.dev/packages/dio) for the API client

### 추후 업데이트 예정
