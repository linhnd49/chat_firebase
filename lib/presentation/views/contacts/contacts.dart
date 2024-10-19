import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/views/contacts/contacts_cubit.dart';
import 'package:softbase/presentation/views/contacts/contacts_state.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

import '../../../utils/constains/export.dart';
import '../../widgets/image_widget.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState
    extends BaseStateWidget<ContactsCubit, ContactsState, ContactsScreen> {
  @override
  void initState() {
    cubit.initListContacts();
    super.initState();
  }

  @override
  Widget body(BuildContext context, ContactsState state) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: ColorApp.white.withOpacity(0.2),
                  radius: 22,
                  child: const ImageWidget(
                      asset: IconApp.ic_search, width: 22, height: 22),
                ),
                Text("Contacts".tr(),
                    style: context.myTheme.textThemeT1.title.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: ColorApp.white)),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: ColorApp.white.withOpacity(0.2),
                  child: const Icon(
                    Icons.person_add_outlined,
                    color: ColorApp.white,
                    size: 22,
                  ),
                )
              ],
            ),
          ),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("my_contacts".tr(),
                        style: context.myTheme.textThemeT1.body.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorApp.colorE08)),
                  ),
                  const VSpacing(spacing: Dimens.spacing6),
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.listContact?.length,
                        itemBuilder: (context, index) {
                          final title = state.listContact!.keys.toList()[index];
                          final itemContact =
                              state.listContact!.values.toList()[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const VSpacing(spacing: Dimens.spacing12),
                              Text(
                                title,
                                style: context.myTheme.textThemeT1.button
                                    .copyWith(
                                        color: ColorApp.black,
                                        fontWeight: FontWeight.w800),
                              ),
                              const VSpacing(spacing: Dimens.spacing12),
                              ...List.generate(itemContact.length, (it) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      bottom: it != itemContact.length - 1
                                          ? Dimens.spacing12
                                          : 0),
                                  child: Row(children: <Widget>[
                                    CircleAvatar(
                                      radius: 22,
                                      child: itemContact[it].avatar != null
                                          ? NetWorkImageWidget(
                                              imageUrl: itemContact[it].avatar!,
                                              shape: BoxShape.circle,
                                            )
                                          : Container(),
                                    ),
                                    const HSpacing(spacing: Dimens.spacing12),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        itemContact[it].name != null
                                            ? Text(itemContact[it].name!,
                                                style: context.myTheme
                                                    .textThemeT1.bigTitle
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w500))
                                            : Container(),
                                        itemContact[it].description != null
                                            ? Text(
                                                itemContact[it].description!,
                                                style: context
                                                    .myTheme.textThemeT1.small
                                                    .copyWith(
                                                        color:
                                                            ColorApp.colorC7B),
                                              )
                                            : Container()
                                      ],
                                    )
                                  ]),
                                );
                              })
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
