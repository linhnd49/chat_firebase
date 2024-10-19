import 'dart:async';

import 'package:flutter/material.dart';
import 'package:softbase/domain/requests/auth_request.dart';
import 'package:softbase/presentation/views/auth/domain/social_type.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/widgets/image_widget.dart';
import 'package:softbase/utils/extensions/context_ext.dart';
import '../../../../utils/constains/export.dart';
import '../../../widgets/text_field.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState
    extends BaseStateScreen<LoginCubit, LoginState, LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool resizeToAvoidBottomInset() => false;

  @override
  bool shouldListen(BuildContext context, LoginState current) => true;

  @override
  void listener(BuildContext context, LoginState state) {
    if (state.loginSuccess == true) {
      context.showToastDialog("Login success!");
      Timer(const Duration(seconds: 1), () {
        context.popTwoScreen(context);
      });
    }
    if (state.loginSuccess == false) {
      context.showToastDialog("Login failed, please again!");
    }
  }

  @override
  AppBar? appBar(BuildContext context, LoginState state) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorApp.white,
      leading: GestureDetector(
        onTap: () {
          context.popScreen(context);
        },
        child: const Icon(
          Icons.arrow_back,
          color: ColorApp.colorE08,
          size: 22,
        ),
      ),
    );
  }

  @override
  Widget body(BuildContext context, LoginState state) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing24),
      color: ColorApp.white,
      child: Column(
        children: <Widget>[
          const VSpacing(spacing: Dimens.spacing30),
          Text(
            "Log in to Chatbox",
            style: context.myTheme.textThemeT1.bigTitle.copyWith(
                color: ColorApp.colorA7A, fontWeight: FontWeight.w700),
          ),
          const VSpacing(spacing: Dimens.spacing16),
          Text(
            "Welcome back! Sign in using your social\naccount or email to continue us",
            style: context.myTheme.textThemeT1.caption
                .copyWith(color: ColorApp.colorC7B),
          ),
          const VSpacing(spacing: Dimens.spacing30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                SocialType.values.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.spacing12),
                      child: ImageWidget(
                        asset: SocialType.values[index].icon(isBlack: true),
                        width: Dimens.spacing50,
                      ),
                    )),
          ),
          const VSpacing(spacing: Dimens.spacing20),
          Row(
            children: <Widget>[
              Expanded(
                  child: Divider(
                      color: ColorApp.black.withOpacity(0.1), thickness: 1)),
              const HSpacing(spacing: Dimens.spacing20),
              Text(
                "OR",
                style: context.myTheme.textThemeT1.caption.copyWith(
                    color: ColorApp.colorC7B, fontWeight: FontWeight.w800),
              ),
              const HSpacing(spacing: Dimens.spacing20),
              Expanded(
                  child: Divider(
                      color: ColorApp.black.withOpacity(0.1), thickness: 1)),
            ],
          ),
          const VSpacing(spacing: Dimens.spacing30),
          TextFieldLogin(label: "Your email", controller: _emailController),
          const VSpacing(spacing: Dimens.spacing30),
          TextFieldLogin(
            label: "Password",
            controller: _passController,
            obscureText: true,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (_passController.text.isNotEmpty &&
                  _emailController.text.isNotEmpty) {
                cubit.login(LoginRequest(
                    password: _passController.text,
                    username: _emailController.text));
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(colors: [
                    ColorApp.colorB09,
                    ColorApp.colorA7A,
                  ])),
              width: double.infinity,
              height: 50,
              child: Text(
                "Log in",
                style: context.myTheme.textThemeT1.body.copyWith(
                    color: ColorApp.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const VSpacing(spacing: Dimens.spacing4),
          TextButton(
              onPressed: () {},
              child: Text(
                "Forgot password?",
                style: context.myTheme.textThemeT1.caption
                    .copyWith(color: ColorApp.colorA7A),
              )),
          const VSpacing(spacing: Dimens.spacing30),
        ],
      ),
    );
  }
}
