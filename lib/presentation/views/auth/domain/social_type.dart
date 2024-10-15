import 'package:softbase/utils/constains/export.dart';

enum SocialType { facebook, google, apple }

extension SocialTypeExtension on SocialType {
  String get icon {
    switch (this) {
      case SocialType.facebook:
        return IconApp.ic_facebook;
      case SocialType.google:
        return IconApp.ic_google;
      case SocialType.apple:
        return IconApp.ic_apple;
    }
  }
}
