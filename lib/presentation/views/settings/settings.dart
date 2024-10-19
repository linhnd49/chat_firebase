import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softbase/app_router.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/views/settings/domain/settings_domain.dart';
import 'package:softbase/presentation/views/settings/settings_cubit.dart';
import 'package:softbase/presentation/views/settings/settings_state.dart';
import 'package:softbase/presentation/widgets/image_widget.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

import '../../../utils/constains/export.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState
    extends BaseStateWidget<SettingsCubit, SettingsState, SettingsScreen> {
  @override
  void initState() {
    cubit.initSetting();
    super.initState();
  }

  final List<SettingsDomain> _listItem = [
    SettingsDomain(
        description: "Privacy, security, change number",
        image: IconApp.ic_setting_key,
        title: "Account"),
    SettingsDomain(
        description: "Chat history, theme, wallpapers",
        image: IconApp.ic_setting_msg,
        title: "Chat"),
    SettingsDomain(
        description: "Messages, group and others",
        image: IconApp.ic_setting_key_notification,
        title: "Notifications"),
    SettingsDomain(
        description: "Help center, contact us, privacy policy",
        image: IconApp.ic_setting_key_help,
        title: "Help"),
    SettingsDomain(
        description: "Network usage, storage usage",
        image: IconApp.ic_setting_data,
        title: "Storage and data"),
    SettingsDomain(
        image: IconApp.ic_setting_key_users, title: "Invite a friend")
  ];

  @override
  bool shouldListen(BuildContext context, SettingsState current) => true;

  @override
  void listener(BuildContext context, SettingsState state) {
    if (state.isLogoutSuccess == true) {
      context.showToastDialog("Logout success!");
      Timer(const Duration(seconds: 1), () {
        context.pushWithNamed(context,
            routerName: ArchRouters.splashAuthScreen);
      });
    }
    if (state.isLogoutSuccess == false) {
      context.showToastDialog("Logout failed, please again!");
    }
  }

  @override
  Widget body(BuildContext context, SettingsState state) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        ColorApp.colorB09,
        ColorApp.colorA7A,
      ])),
      child: SafeArea(
          child: Column(
        children: <Widget>[
          const VSpacing(spacing: Dimens.spacing20),
          Text("settings".tr(),
              style: context.myTheme.textThemeT1.title.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: ColorApp.white)),
          const VSpacing(spacing: Dimens.spacing30),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing24),
            decoration: const BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24))),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const VSpacing(spacing: 12),
                  Container(
                    height: 2,
                    width: 50,
                    decoration: BoxDecoration(
                        color: ColorApp.color6E6,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  const VSpacing(spacing: 30),
                  state.userInfo != null
                      ? Row(children: <Widget>[
                          CircleAvatar(
                            radius: 22,
                            child: state.userInfo!.avatar != null
                                ? NetWorkImageWidget(
                                    imageUrl: state.userInfo!.avatar!,
                                    shape: BoxShape.circle,
                                  )
                                : Container(),
                          ),
                          const HSpacing(spacing: Dimens.spacing12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              state.userInfo!.name != null
                                  ? Text(state.userInfo!.name!,
                                      style: context
                                          .myTheme.textThemeT1.bigTitle
                                          .copyWith(
                                              fontWeight: FontWeight.w500))
                                  : Container(),
                              state.userInfo!.description != null
                                  ? Text(
                                      state.userInfo!.description!,
                                      style: context.myTheme.textThemeT1.small
                                          .copyWith(color: ColorApp.colorC7B),
                                    )
                                  : Container()
                            ],
                          )
                        ])
                      : Container(),
                  const VSpacing(spacing: 30),
                  Divider(
                    color: ColorApp.grey.withOpacity(0.3),
                    thickness: 0.5,
                  ),
                  const VSpacing(spacing: 30),
                  ...List.generate(_listItem.length, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: Dimens.spacing20),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            padding: const EdgeInsets.all(Dimens.spacing10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorApp.color4F1.withOpacity(0.1),
                            ),
                            child: ImageWidget(asset: _listItem[index].image),
                          ),
                          const HSpacing(spacing: Dimens.spacing12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _listItem[index].title,
                                style: context.myTheme.textThemeT1.body
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              const VSpacing(spacing: Dimens.spacing4),
                              _listItem[index].description != null
                                  ? Text(
                                      _listItem[index].description!,
                                      style: context.myTheme.textThemeT1.small
                                          .copyWith(color: ColorApp.colorC7B),
                                    )
                                  : Container()
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                  GestureDetector(
                    onTap: () {
                      cubit.logout();
                    },
                    child: Container(
                      width: double.infinity,
                      height: Dimens.spacing50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.spacing12),
                        color: ColorApp.color4F1.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.logout_rounded,
                            color: ColorApp.black,
                            size: 22,
                          ),
                          const HSpacing(spacing: Dimens.spacing12),
                          Text(
                            "Log out",
                            style: context.myTheme.textThemeT1.body
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VSpacing(spacing: Dimens.spacing20)
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
