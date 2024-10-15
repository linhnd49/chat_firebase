import 'package:flutter/material.dart';
import 'package:softbase/app_router.dart';
import 'package:softbase/presentation/views/auth/splash/auth_splash_cubit.dart';
import 'package:softbase/presentation/views/auth/splash/auth_splash_state.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

import '../../../../utils/constains/export.dart';
import '../../../widgets/image_widget.dart';
import '../domain/social_type.dart';

class AuthSplashScreen extends StatefulWidget {
  const AuthSplashScreen({super.key});

  @override
  State<AuthSplashScreen> createState() => _AuthSplashScreenState();
}

class _AuthSplashScreenState extends BaseStateScreen<AuthSplashCubit,
    AuthSplashState, AuthSplashScreen> {
  @override
  Widget body(BuildContext context, AuthSplashState state) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            const ImageWidget(
              asset: IconApp.bg_splash,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.spacing24),
                child: Column(
                  children: <Widget>[
                    VSpacing(
                      spacing: context.screenHeight / 8,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Connect\nfriends\neasily &\nquickly",
                        style: context.myTheme.textThemeT1.caption.copyWith(
                            fontSize: 68,
                            fontWeight: FontWeight.w400,
                            color: ColorApp.white),
                      ),
                    ),
                    const VSpacing(spacing: Dimens.spacing30),
                    Text(
                      "Our chat app is the perfect way to stay connected with friends and family.",
                      style: context.myTheme.textThemeT1.body
                          .copyWith(color: ColorApp.white.withOpacity(0.5)),
                    ),
                    const VSpacing(spacing: Dimens.spacing30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          SocialType.values.length,
                          (index) => Container(
                                width: 48,
                                height: 48,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: Dimens.spacing12),
                                padding: const EdgeInsets.symmetric(
                                    vertical: Dimens.spacing6),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorApp.white.withOpacity(0.19)),
                                child: ImageWidget(
                                  asset: SocialType.values[index].icon(),
                                ),
                              )),
                    ),
                    const VSpacing(spacing: Dimens.spacing30),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                                color: ColorApp.white.withOpacity(0.2),
                                thickness: 1)),
                        const HSpacing(spacing: Dimens.spacing20),
                        Text(
                          "OR",
                          style: context.myTheme.textThemeT1.caption.copyWith(
                              color: ColorApp.white,
                              fontWeight: FontWeight.w800),
                        ),
                        const HSpacing(spacing: Dimens.spacing20),
                        Expanded(
                            child: Divider(
                                color: ColorApp.white.withOpacity(0.2),
                                thickness: 1)),
                      ],
                    ),
                    const VSpacing(spacing: Dimens.spacing30),
                    GestureDetector(
                      onTap: () {
                        context.pushWithNamed(context,
                            routerName: ArchRouters.register);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorApp.white.withOpacity(0.37)),
                        width: double.infinity,
                        height: 50,
                        child: Text(
                          "Sign up with email",
                          style: context.myTheme.textThemeT1.body.copyWith(
                              color: ColorApp.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const VSpacing(spacing: Dimens.spacing20),
                    GestureDetector(
                      onTap: () {
                        context.pushWithNamed(context,
                            routerName: ArchRouters.login);
                      },
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Existing account?",
                            style: context.myTheme.textThemeT1.caption.copyWith(
                                color: ColorApp.white,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: " Log in",
                            style: context.myTheme.textThemeT1.caption.copyWith(
                                color: ColorApp.white,
                                fontWeight: FontWeight.w600))
                      ])),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
