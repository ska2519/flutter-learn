# Flutter Learn

Flutter 와 Firebase Firestore로 다중 플랫폼 커뮤니티 앱을 빌드하겠습니다.  
*I'll build a multi-platform community app powered by Flutter and Cloud Firestore.*

완성 된 앱은 단일 Dart 코드베이스에서 Android, iOS 및 웹에서 실행됩니다.  
*The finished app runs on Android, iOS, and web, from a single Dart codebase.*

이 프로젝트는 Flutter에서 [Riverpod](https://riverpod.dev) 상태 관리 기술을 사용하여 커뮤니티 앱을 ([로플리](https://www.lawfully.com/)에서 영감을 받음) 구현합니다.  
*This project implement a community app ([Lawfully](https://www.lawfully.com/)-inspired) with [Riverpod](https://riverpod.dev) state management techniques in Flutter.*

이 프로젝트는 YouTube API를 사용하여 동영상 목록을 가져오고 회원 가입&로그인과 Firebase Firestore 데이터 저장 기능을 포함합니다.  
*The project uses the YouTube API to fetch a list of videos, and includes features such as Authentication and Firestore Database storage.*

## App Overview

애플리케이션은 **커뮤니티**, **비디오** 및 **프로필**의 세 가지 기본 화면으로 구성됩니다.  
처음 시작할 때 앱은 사용자에게 프로필 생성을 요청합니다.  
*The application is composed by three primary screens: **Community**, **Videos** and **Profile**.  
On first launch, the app asks the user to create a profile.*

**커뮤니티** 페이지는 게시판을 제공합니다.  
게시판은 글작성, 이미지 첨부, 댓글, 추천, 필터링이 가능 합니다.  
*The **Community** page provides a bulletin board.  
You can write, attach images, comment, recommend, and filter on the bulletin board.*  

**동영상** 페이지는 YouTube API에서 동영상 목록을 로드합니다.  
*The **Videos** page loads a list of videos from the YouTube API.*  

각 동영상은 API에서 검색된 썸네일 URL을 사용하여 이미지 링크로 표시됩니다. ❤️ 아이콘을 탭하여 동영상을 즐겨찾기로 추가 할 수 있으며 이 환경 설정은 **Firebase Firestore**에 유지됩니다.  
*Each video shows as a image link using the thumbnail URL retrieved from the API. You can tap on the ❤️ icon to add a video as a favorite, and this preference is persisted to **Firebase Firestore**.*  

<!-- 현재 선택한 프로필의 즐겨찾기 목록을 보려면 **즐겨찾기** 페이지를 엽니다.
*Open the **Favorites** page to see the list of Favorites for the currently selected profile.* -->

**프로필** 페이지를 사용하여 현재 선택한 프로필을 업데이트합니다.  
*Use the **Profile** page to update the currently selected profile.*  

## Features

- Community
- Videos (with pagination)
- Save Favorites to Favorites list
- Update profile
- Firebase Firestore data persistence (community, favorites, profile)

**Flutter, Firebase, Riverpod을 결합하여 재사용이 가능한 멀티 플랫폼 앱을 개발하고 있습니다.**  
*Combining Flutter, Firebase, and Riverpod to create reusable, multi-platform apps.*

## App Structure

이 앱은 단일 Dart 코드베이스에서 Android, iOS 및 웹에서 실행하기 위해 만들어졌습니다. 이를 가능하게 하기 위해 **재사용성이 높은** 아키텍처가 설계되었습니다.  
*This app is built to run on Android, iOS and the web on a single Dart codebase. To make this possible, the **highly reusable** architecture has been designed.*

The project folders are structured like this:

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

## Other packages in use

The "core" package of the app uses the following packages:

- [freezed](https://pub.dev/packages/freezed) for app state and [json_annotation](https://pub.dev/packages/json_annotation) for data serialization
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) for Firebase Cloud Firestore data persistence
- [firebase_auth](https://pub.dev/packages/firebase_auth) for authentication
- [dio](https://pub.dev/packages/dio) for the API client

### To be updated
