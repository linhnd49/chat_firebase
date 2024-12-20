import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:softbase/app_router.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/widgets/image_widget.dart';
import 'package:softbase/presentation/widgets/list_view_base.dart';
import 'package:softbase/utils/constains/colors.dart';
import 'package:softbase/utils/constains/dimens.dart';
import 'package:softbase/utils/constains/icon.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

import '../../../domain/reponses/user_store_reponse.dart';
import 'message_cubit.dart';
import 'message_state.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState
    extends BaseStateWidget<MessageCubit, MessageState, MessageScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget body(BuildContext context, state) {
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
                  Text("home".tr(),
                      style: context.myTheme.textThemeT1.title.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: ColorApp.white)),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: ColorApp.white,
                    child: state.currentUser != null &&
                            state.currentUser!.avatar != null
                        ? NetWorkImageWidget(
                            imageUrl: state.currentUser!.avatar!,
                            shape: BoxShape.circle,
                            fit: BoxFit.contain,
                          )
                        : Container(),
                  )
                ],
              ),
            ),
            const VSpacing(spacing: Dimens.spacing30),
            Container(
              height: 90,
              width: double.infinity,
              color: ColorApp.transparent,
              padding: const EdgeInsets.only(left: Dimens.spacing24),
              child: state.listUserChat != null
                  ? ListViewBase(
                      itemCount: state.listUserChat!.length,
                      scrollHorizontal: true,
                      expanded: false,
                      builder: (context, index) {
                        final item = state.listUserChat![index];
                        return Container(
                          margin: EdgeInsets.only(
                              right: index == 9
                                  ? Dimens.spacing20
                                  : Dimens.spacing12),
                          width: 60,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(Dimens.spacing2),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ColorApp.white, width: 0.7),
                                    shape: BoxShape.circle,
                                    color: ColorApp.transparent),
                                child: CircleAvatar(
                                  radius: 26,
                                  backgroundColor: ColorApp.white,
                                  child: item.avatar != null
                                      ? NetWorkImageWidget(
                                          imageUrl: item.avatar!,
                                          shape: BoxShape.circle,
                                          fit: BoxFit.contain,
                                        )
                                      : Container(),
                                ),
                              ),
                              const VSpacing(spacing: Dimens.spacing10),
                              Text(
                                item.name != null ? item.name! : "",
                                style: context.myTheme.textThemeT1.caption
                                    .copyWith(color: ColorApp.white),
                              )
                            ],
                          ),
                        );
                      })
                  : Container(),
            ),
            const VSpacing(spacing: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.spacing24),
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
                    state.listUserChat != null
                        ? ListViewBase(
                            itemCount: state.listUserChat!.length,
                            builder: (context, index) {
                              final item = state.listUserChat![index];
                              return Slidable(
                                endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: <Widget>[
                                      const HSpacing(spacing: 30),
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorApp.colorE08,
                                        ),
                                        child: const Icon(
                                          Icons.notifications,
                                          size: 22,
                                          color: ColorApp.white,
                                        ),
                                      ),
                                      const HSpacing(spacing: 12),
                                      Container(
                                        width: 36,
                                        height: 36,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ColorApp.colorA4C,
                                        ),
                                        child: const Icon(
                                          Icons.delete,
                                          size: 22,
                                          color: ColorApp.white,
                                        ),
                                      ),
                                    ]),
                                child: MessageItem(
                                  user: item,
                                  onClick: () {
                                    context.pushWithNamed(context,
                                        routerName: ArchRouters.chatScreen);
                                  },
                                ),
                              );
                            })
                        : Container()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final Function onClick;
  final UserStoreDomain user;
  const MessageItem({super.key, required this.onClick, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          color: ColorApp.transparent,
          child: Row(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: ColorApp.white,
                    child: user.avatar != null
                        ? NetWorkImageWidget(
                            imageUrl: user.avatar!,
                            shape: BoxShape.circle,
                            fit: BoxFit.contain,
                          )
                        : Container(),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: ColorApp.color16D),
                  )
                ],
              ),
              const HSpacing(spacing: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user.name != null ? user.name! : "",
                    style: context.myTheme.textThemeT1.caption
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const VSpacing(spacing: 4),
                  Text(
                    user.description!,
                    style: context.myTheme.textThemeT1.small
                        .copyWith(color: ColorApp.colorC7B),
                  )
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("2 min ago",
                      style: context.myTheme.textThemeT1.small.copyWith(
                        color: ColorApp.colorC7B,
                      )),
                  const VSpacing(spacing: 4),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: ColorApp.colorA4C, shape: BoxShape.circle),
                    child: Text(
                      "2",
                      style: context.myTheme.textThemeT1.small.copyWith(
                          fontWeight: FontWeight.bold, color: ColorApp.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
