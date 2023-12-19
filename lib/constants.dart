abstract class Constants {
  const Constants._();

  static const String APP_TITLE = 'FLUTTER_APP';

  static const String API_HOST = 'api.flutter_app.vsolution.app';

  static const String ANDROID_PACKAGE_NAME = 'app.vsolution.flutter_app';

  static String get ANDROID_PLAYSTORE_URL => 'https://play.google.com/store/apps/details?id=$ANDROID_PACKAGE_NAME';

  static const String IOS_APP_NAME = 'FLUTTER_APP';
  static const String IOS_BUNDLE_ID = 'app.vsolution.flutter_app';
  static const String IOS_APPSTORE_ID = '';

  static String get IOS_APPSTORE_URL => 'https://apps.apple.com/kr/app/$IOS_APP_NAME/id$IOS_APPSTORE_ID';
}
