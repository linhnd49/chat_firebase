import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softbase/utils/constains/export.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

import '../../../app_router.dart';
import '../../widgets/image_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(milliseconds: 500), () {
        Navigator.pushReplacementNamed(context, ArchRouters.home
            // !getIt.get<LocalStorage>().isFirstOpen
            // ? ArchRouters.home
            // : ArchRouters.intro
            );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            const ImageWidget(
              asset: IconApp.bg_splash,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            const ImageWidget(
              asset: IconApp.img_foreground_splash,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: context.screenHeight / 10),
              child: Text(
                "textit".tr(),
                style: context.myTheme.textThemeT1.header1.copyWith(
                    fontSize: 72, color: ColorApp.white.withOpacity(0.7)),
              ),
            )
          ],
        ));
  }
}
