import 'package:flutter/material.dart';
import 'package:softbase/data/repositories/firebase_auth/firebase_auth_manager.dart';
import 'package:softbase/data/user/user_storage.dart';

import '../../data/di/injector.dart';
import '../../presentation/views/theme_manager/theme_manager.dart';
import '../constains/export.dart';

bool isShowingSnackBar = false;

extension Style on BuildContext {
  AppThemeData get myTheme => getIt<ThemeManager>().appThemeData;
}

extension ScreenSize on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
}

extension BuildContextExt on BuildContext {
  bool get isLogined {
    if (getIt.get<AuthManager>().isLogined) {
      return true;
    }
    return false;
  }
}

extension Router on BuildContext {
  pushWithNamed(BuildContext context,
      {required String routerName,
      Object? arguments,
      Function(Object?)? complete,
      bool? unfocusKeyboard = false}) {
    if (unfocusKeyboard == true) {
      FocusScope.of(context).unfocus();
    }
    Navigator.of(context)
        .pushNamed(routerName, arguments: arguments)
        .then((value) {
      if (complete != null) {
        complete(value);
      }
    });
  }

  popScreen(BuildContext context, {dynamic result}) {
    Navigator.of(context).pop(result);
  }

  popTwoScreen(BuildContext context) {
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  popThreeScreen(BuildContext context) {
    Navigator.of(context)
      ..pop()
      ..pop()
      ..pop();
  }
}

// extension ShowModalSheet on BuildContext {
//   Future<dynamic> showDevicePage() async {
//     if (!getIt<CastCubit>().state.isConnectedToWifi) {
//       return showWifiConnectionError();
//     }
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: this,
//       builder: (_) {
//         return SizedBox(
//           height: screenHeight - AppDimens.spacing100,
//           child: const ClipRRect(
//             borderRadius:
//                 BorderRadius.vertical(top: Radius.circular(AppDimens.radius25)),
//             child: DevicePage(),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> showSubUnlockBottomSheet(
//     PurchaseTrackingDTO trackingDTO, {
//     bool isDismissible = true,
//     bool enableDrag = true,
//     VoidCallback? onTappedClose,
//   }) async {
//     showModalBottomSheet(
//       isDismissible: isDismissible,
//       backgroundColor: Colors.transparent,
//       enableDrag: enableDrag,
//       context: this,
//       builder: (_) {
//         return UnlockPremiumBottomSheet(
//           purchaseTrackingDTO: trackingDTO,
//           onTappedClose: onTappedClose,
//         );
//       },
//     );
//   }

//   Future<void> showHelpCenter() async {
//     return showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       context: this,
//       builder: (_) {
//         return SizedBox(
//           height: screenHeight - AppDimens.spacing100,
//           child: const ClipRRect(
//             borderRadius:
//                 BorderRadius.vertical(top: Radius.circular(AppDimens.radius25)),
//             child: HelpCenterPage(),
//           ),
//         );
//       },
//     );
//   }

//   Future<void> showWifiConnectionError() async {
//     return showDialog(
//       context: this,
//       builder: (context) {
//         return AppOptionalDialog(
//           decorationWidget: const AppImageWidget(
//             assetString: AppIcons.ic_warning,
//             size: AppDimens.size100,
//           ),
//           title: 'Wifi is not enable',
//           message: 'Please turn on Wifi network before using app',
//           buttonTitle: 'Go to setting',
//           onPressedAltBtn: () {},
//           onPressedBtn: () => AppSettings.openWIFISettings(),
//         );
//       },
//     );
//   }

//   void showSnackBar(String title, String message) async {
//     if (isShowingSnackBar) {
//       return;
//     }
//     final snackBar = SnackBar(
//         elevation: 3,
//         duration: const Duration(seconds: 3),
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppDimens.radius32),
//         ),
//         dismissDirection: DismissDirection.none,
//         backgroundColor: myTheme.colorScheme.cardColor,
//         margin: const EdgeInsets.symmetric(
//             vertical: AppDimens.spacing70, horizontal: AppDimens.spacing40),
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               title,
//               style: myTheme.textThemeT1.title,
//               textAlign: TextAlign.center,
//             ),
//             const VSpacing(),
//             Text(
//               message,
//               style: myTheme.textThemeT3.light,
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ));
//     isShowingSnackBar = true;
//     ScaffoldMessenger.of(this).showSnackBar(snackBar);
//     await Future.delayed(const Duration(seconds: 3));
//     isShowingSnackBar = false;
//   }
// }
