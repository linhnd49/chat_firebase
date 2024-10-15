import 'package:softbase/utils/constains/export.dart';

enum SocialType { facebook, google, apple }

extension SocialTypeExtension on SocialType {
  String icon({bool? isBlack = false}) {
    switch (this) {
      case SocialType.facebook:
        return IconApp.ic_facebook;
      case SocialType.google:
        return IconApp.ic_google;
      case SocialType.apple:
        return isBlack == true ? IconApp.ic_apple_black : IconApp.ic_apple;
    }
  }
}
