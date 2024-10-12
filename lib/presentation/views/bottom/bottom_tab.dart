import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softbase/presentation/views/calls/calls.dart';
import 'package:softbase/presentation/views/contacts/contacts.dart';
import 'package:softbase/presentation/views/message/message.dart';
import 'package:softbase/presentation/views/settings/settings.dart';

import '../../../utils/constains/icon.dart';
import '../../widgets/image_widget.dart';

enum BottomTab { message, calls, contacts, settings }

extension AppTabExtension on BottomTab {
  String get name {
    switch (this) {
      case BottomTab.message:
        return "message".tr();
      case BottomTab.calls:
        return "calls".tr();
      case BottomTab.contacts:
        return "contacts".tr();
      case BottomTab.settings:
        return "settings".tr();
    }
  }

  Widget icon(bool sellected) {
    double size = 25;
    switch (this) {
      case BottomTab.message:
        return ImageWidget(
          asset: IconApp.ic_tab_message
              .replaceAll("#TYPE", sellected ? "_sellected" : ""),
          width: size,
          height: size,
        );
      case BottomTab.calls:
        return ImageWidget(
          asset: IconApp.ic_tab_calls
              .replaceAll("#TYPE", sellected ? "_sellected" : ""),
          width: size,
          height: size,
        );
      case BottomTab.contacts:
        return ImageWidget(
          asset: IconApp.ic_tab_contacts
              .replaceAll("#TYPE", sellected ? "_sellected" : ""),
          width: size,
          height: size,
        );
      case BottomTab.settings:
        return ImageWidget(
          asset: IconApp.ic_tab_setting
              .replaceAll("#TYPE", sellected ? "_sellected" : ""),
          width: size,
          height: size,
        );
    }
  }

  Widget screen(BuildContext context) {
    switch (this) {
      case BottomTab.message:
        return const MessageScreen();
      case BottomTab.calls:
        return const CallsScreen();
      case BottomTab.contacts:
        return const ContactsScreen();
      case BottomTab.settings:
        return const SettingsScreen();
    }
  }
}
