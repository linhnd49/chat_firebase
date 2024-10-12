enum FontApp { acmeRegular, poppinMedium, poppinRegular, poppinThin}

extension FontAppExtension on FontApp {
  String get font {
    switch (this) {
      case FontApp.acmeRegular:
        return 'AcmeRegular';
      case FontApp.poppinMedium:
        return 'PoppinsMedium';
      case FontApp.poppinRegular:
        return 'PoppinsRegular';
      case FontApp.poppinThin:
        return 'PoppinsThin';
    }
  }
}
