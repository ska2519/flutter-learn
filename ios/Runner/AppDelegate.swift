import UIKit
import Flutter
import NaverThirdPartyLogin
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  // Naver & Kakao Login
  override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    let scheme = url.scheme
    if scheme!.contains("naverlogin"){
    return NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
    }
    KakaoSDKCommon.initSDK(appKey: "0116cd9761718d85103dd847d64eb906")
    if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }

    return false
  }
}

