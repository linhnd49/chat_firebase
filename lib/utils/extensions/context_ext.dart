import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softbase/data/repositories/firebase_auth/firebase_auth_manager.dart';

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

extension ShowModalSheet on BuildContext {
  void showToastDialog(String value) {
    Fluttertoast.showToast(msg: value, gravity: ToastGravity.BOTTOM);
  }

  Future<dynamic> showDialogWidget(BuildContext context,
      {required Widget child,
      bool? barrierDismissible = false,
      Color? barrierColor = Colors.black54}) async {
    return showDialog(
        barrierDismissible: barrierDismissible ?? false,
        barrierColor: barrierColor,
        context: context,
        builder: (context) {
          return WillPopScope(onWillPop: () async => true, child: child);
        });
  }

  Future<dynamic> showLoading(
    BuildContext context,
  ) async {
    showDialogWidget(context,
        child: Dialog(
          elevation: 0,
          backgroundColor: ColorApp.transparent,
          child: Center(
            child: Container(
              width: Dimens.spacing50,
              height: Dimens.spacing50,
              padding: const EdgeInsets.all(Dimens.spacing8),
              decoration: BoxDecoration(
                color: ColorApp.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const CircularProgressIndicator(
                color: ColorApp.white,
                strokeWidth: 2,
              ),
            ),
          ),
        ));
  }
}
