import 'dart:async';

import 'package:flutter/material.dart';
import 'package:softbase/domain/requests/auth_request.dart';
import 'package:softbase/presentation/views/auth/register/register_cubit.dart';
import 'package:softbase/presentation/views/auth/register/register_state.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

import '../../../../utils/constains/export.dart';
import '../../../widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState
    extends BaseStateScreen<RegisterCubit, RegisterState, RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _passController.dispose();
    _emailController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  AppBar? appBar(BuildContext context, RegisterState state) {
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
  bool resizeToAvoidBottomInset() => false;

  @override
  bool shouldListen(BuildContext context, RegisterState current) => true;

  @override
  void listener(BuildContext context, RegisterState state) {
    if (state.isSuccess == true) {
      context.showToastDialog("Register account success!");
      Timer(const Duration(seconds: 1), () {
        context.popTwoScreen(context);
      });
    }
    if (state.isSuccess == false) {
      context.showToastDialog("Register account failed!");
    }
  }

  @override
  Widget body(BuildContext context, RegisterState state) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing24),
      color: ColorApp.white,
      child: Column(
        children: <Widget>[
          const VSpacing(spacing: Dimens.spacing30),
          Text(
            "Sign up with Email",
            style: context.myTheme.textThemeT1.bigTitle.copyWith(
                color: ColorApp.colorA7A, fontWeight: FontWeight.w700),
          ),
          const VSpacing(spacing: Dimens.spacing16),
          Text(
            "Get chatting with friends and family\ntoday by signing up for our chat app!",
            style: context.myTheme.textThemeT1.caption
                .copyWith(color: ColorApp.colorC7B),
          ),
          const VSpacing(spacing: Dimens.spacing50),
          TextFieldLogin(label: "Your name", controller: _nameController),
          const VSpacing(spacing: Dimens.spacing20),
          TextFieldLogin(
            label: "Your email",
            controller: _emailController,
          ),
          const VSpacing(spacing: Dimens.spacing20),
          TextFieldLogin(
            label: "Password",
            controller: _passController,
            obscureText: true,
          ),
          const VSpacing(spacing: Dimens.spacing20),
          TextFieldLogin(
            label: "Confirm Password",
            controller: _confirmPassController,
            obscureText: true,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (_nameController.text.isNotEmpty &&
                  _emailController.text.isNotEmpty &&
                  _passController.text.isNotEmpty &&
                  _confirmPassController.text.isNotEmpty) {
                cubit.createAccountWithEmail(SignUpRequest(
                    email: _emailController.text,
                    password: _passController.text,
                    name: _nameController.text));
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
                "Create an account",
                style: context.myTheme.textThemeT1.body.copyWith(
                    color: ColorApp.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const VSpacing(spacing: Dimens.spacing30),
        ],
      ),
    );
  }
}
