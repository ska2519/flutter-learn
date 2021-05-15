# Flutter Learn

I'll build a multi-platform community app powered by Flutter and Cloud Firestore.  

The finished app runs on Android, iOS, and web, from a single Dart codebase.  

This project implement a community app ([Lawfully](https://www.lawfully.com/)-inspired) with [Riverpod](https://riverpod.dev) state management techniques in Flutter.  

The project uses the YouTube API to fetch a list of videos, and includes features such as Authentication and Firestore Database storage.  

*link: [`https://flutter-learn.dev`](https://flutter-learn.dev)*

*Read this in other languages: [English](README.md), [한국어](README.ko.md)

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
- Videos (with pagination)
- Save Favorites to Favorites list
- Update profile
- Firebase Firestore data persistence (community, favorites, profile)

**Combining Flutter, Firebase, and Riverpod to create reusable, multi-platform apps.**

## App Structure

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
