# Flutter Learn

I'll build a multi-platform community app powered by Flutter and Cloud Firestore.  

The finished app runs on Android, iOS, and web, from a single Dart codebase.  

This project implement a community app ([Lawfully](https://www.lawfully.com/)-inspired) with [Riverpod](https://riverpod.dev) state management techniques in Flutter.  

The project uses the YouTube API to fetch a list of videos, and includes features such as Authentication and Firestore Database storage.  

*link: [`https://flutter-learn.dev`](https://flutter-learn.dev)*

*Read this in other languages: [한국어](README.md)

## App Overview

The application is composed by three primary screens: **Community**, **Videos** and **Profile**.  
On first launch, the app asks the user to create a profile.  

The **Community** page provides a bulletin board.  
You can write, attach images, comment, recommend, and filter on the bulletin board.  

The **Videos** page loads a list of videos from the YouTube API.  

Each video shows as a image link using the thumbnail URL retrieved from the API. You can tap on the ❤️ icon to add a video as a favorite, and this preference is persisted to **Firebase Firestore**.  

<!-- 현재 선택한 프로필의 즐겨찾기 목록을 보려면 **즐겨찾기** 페이지를 엽니다.
*Open the **Favorites** page to see the list of Favorites for the currently selected profile.* -->

Use the **Profile** page to update the currently selected profile.  

## Features

- Community
- YouTube Videos
- Update profile
- Firebase Firestore data persistence (community, favorites, profile)

**Combining Flutter, Firebase, and Riverpod to create reusable, multi-platform apps.**
## Implement app features

- [x] Multi-language support - Korean version

- [x] Widget size change according to screen size
- [x] navigation bar
  - [x] Changed to SideMenu in desktop size

- [x] community
  - [x] Write Post
  - [x] Delete Post
  - [x] Edit Post
  - [x] Like Post
  - [x] Comment
    - [x] Write a comment
    - [x] Edit comment
    - [x] Like comment
    - [x] Likes comments
  - [x] When a user's post is deleted, if there are comments left, show message of "author deleted"

- [x] Register & Login
  - [x] Sign up with Email
  - [x] Sign up with your Google Account
  - [x] Sign up with your Apple account
  - [x] Sign out
  - [x] Delete account
  - [x] Update User info

  - [x] App settings
  - [x] My posts
  - [x] My comment
  - [x] My liked posts
  - [x] My read posts 

- [x] Shimmer Loading Animation
- [x] Splash Screen
## Coming soon 
  - [ ] category
  - [ ] tag
    - [ ] tag recommendation
- [ ] Youtube
 - [ ] Changes the screen when clicking SideMenu
## Implement web function
- [x] Route
- [x] Favicon
- [x] Title
- [x] Web App Icon
- [ ] Invalid address handling

## Implement Firebase Features
- [x] Separation of development and release projects
  - [x] Development Firestore Database
  - [x] Development Firebase Functions
  
- [x] Firebase Authentication
  - [x] Anonymous Login
  - [x] Email Login
  - [x] Google Login
  - [x] Apple Login
    
- [x] Firebase Crashlytics
  - [x] Check Android and iOS crash reports

- [x] Firestore Database
  - [x] Firestore data structure design
  - [x] Firestore Collection Group Queries
  
- [x] Firebase Hosting
  - [x] Hosting Website Deployment
  - [x] Setting up and deploying automatic builds to GitHub
  
- [x] Firebase Functions
  - [x] Count when joining or leaving a user
  - [x] Count when adding or deleting posts
  - [x] Count the number of users who read the article
  - [x] Count the number of comment in post when adding or deleting comments
  - [x] Total comments count when adding or deleting comments

- [x] Cloud Firestore fine-grained rules

- [x] Setting algolia Extension for post search term function
## Apply CI/CD Codemagic
- [x] Build for Android
- [x] Build for iOS
## App Structure

*This app is built to run on Android, iOS and the web on a single Dart codebase. To make this possible, the **highly reusable** architecture has been designed.*

The project folders are structured like this:

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


## Other packages in use

The "core" package of the app uses the following packages:

- [freezed](https://pub.dev/packages/freezed) for app state and [json_annotation](https://pub.dev/packages/json_annotation) for data serialization
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) for the remote database
- [firebase_auth](https://pub.dev/packages/firebase_auth) for authentication
- [dio](https://pub.dev/packages/dio) for the API client
- [intl](https://pub.dev/packages/intl) for currency, date, time formatting

### To be updated
