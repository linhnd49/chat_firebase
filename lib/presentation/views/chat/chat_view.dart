import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softbase/presentation/views/base/base_screen.dart';
import 'package:softbase/presentation/views/chat/chat_cubit.dart';
import 'package:softbase/presentation/views/chat/chat_state.dart';
import 'package:softbase/presentation/views/chat/domain/chat_item_domain.dart';
import 'package:softbase/presentation/widgets/image_widget.dart';
import 'package:softbase/utils/constains/colors.dart';
import 'package:softbase/utils/constains/dimens.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends BaseStateScreen<ChatCubit, ChatState, ChatPage> {
  @override
  void initState() {
    cubit.initChat();
    super.initState();
  }

  @override
  Widget body(BuildContext context, ChatState state) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(Dimens.spacing16, Dimens.spacing50,
              Dimens.spacing16, Dimens.spacing16),
          decoration: BoxDecoration(color: ColorApp.white, boxShadow: [
            BoxShadow(
              color: ColorApp.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 0.1),
            )
          ]),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  context.popScreen(context);
                },
                child: const Icon(Icons.arrow_back,
                    color: ColorApp.colorE08, size: 24),
              ),
              const HSpacing(spacing: Dimens.spacing16),
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: ColorApp.black,
                    child: NetWorkImageWidget(
                        shape: BoxShape.circle,
                        imageUrl:
                            "https://randomuser.me/api/portraits/men/5.jpg"),
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
              const HSpacing(spacing: Dimens.spacing12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Alex Linderson",
                    style: context.myTheme.textThemeT1.caption
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const VSpacing(spacing: Dimens.spacing4),
                  Text(
                    "Active now",
                    style: context.myTheme.textThemeT1.small
                        .copyWith(color: ColorApp.colorC7B),
                  )
                ],
              ),
              const Spacer(),
              const Icon(Icons.phone_outlined, color: ColorApp.black, size: 24),
              const HSpacing(spacing: Dimens.spacing12),
              const Icon(Icons.videocam_outlined,
                  color: ColorApp.black, size: 24)
            ],
          ),
        ),
        Expanded(
            child: state.listChat != null
                ? ListView.separated(
                    reverse: true,
                    padding: const EdgeInsets.fromLTRB(
                        Dimens.spacing16, 0, Dimens.spacing16, Dimens.spacing6),
                    separatorBuilder: (_, index) {
                      final item = state.listChat![index];
                      return SizedBox(
                        height: item.isFirstMsg != true ? 0 : Dimens.spacing12,
                      );
                    },
                    itemCount: state.listChat!.length,
                    itemBuilder: (context, index) {
                      final item = state.listChat![index];
                      if (item.userType == UserType.receiver) {
                        return _MessageReceiveItem(item: item);
                      }
                      return _MessageSenderItem(item: item);
                    },
                  )
                : Container()),
        Container(
          height: 70,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorApp.white,
          ),
          padding: const EdgeInsets.fromLTRB(Dimens.spacing16, Dimens.spacing16,
              Dimens.spacing16, Dimens.spacing20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.attach_file_rounded,
                    color: ColorApp.colorE08, size: 24),
              ),
              const HSpacing(spacing: Dimens.spacing12),
              Expanded(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "write_your_message".tr(),
                      hintStyle: context.myTheme.textThemeT1.small
                          .copyWith(color: ColorApp.colorC7B),
                      focusedBorder: _border(),
                      enabledBorder: _border(),
                      border: _border(),
                      fillColor: ColorApp.color4F1.withOpacity(0.06),
                      filled: true,
                      contentPadding: const EdgeInsets.only(
                          top: Dimens.spacing10, left: Dimens.spacing10),
                      focusColor: ColorApp.transparent),
                ),
              ),
              const HSpacing(spacing: Dimens.spacing12),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.camera_alt_rounded,
                    color: ColorApp.colorE08, size: 24),
              ),
              const HSpacing(spacing: Dimens.spacing12),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.mic_rounded,
                    color: ColorApp.colorE08, size: 24),
              )
            ],
          ),
        )
      ],
    );
  }

  InputBorder _border() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: ColorApp.transparent, width: 1),
        borderRadius: BorderRadius.circular(12));
  }
}

class _MessageReceiveItem extends StatelessWidget {
  final ChatItemDomain item;
  const _MessageReceiveItem({required this.item});

  @override
  Widget build(BuildContext context) {
    bool isFirstMsg = item.isFirstMsg == true;
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
              radius: 16,
              backgroundColor: ColorApp.transparent,
              child: item.avatar != null
                  ? NetWorkImageWidget(
                      imageUrl: item.avatar!,
                      shape: BoxShape.circle,
                    )
                  : Container()),
          const HSpacing(spacing: Dimens.spacing6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isFirstMsg
                  ? Text(
                      item.name!,
                      style: context.myTheme.textThemeT1.caption
                          .copyWith(fontWeight: FontWeight.w700),
                    )
                  : Container(),
              const VSpacing(spacing: Dimens.spacing4),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: Dimens.spacing12, horizontal: Dimens.spacing6),
                decoration: BoxDecoration(
                    color: ColorApp.color4F1.withOpacity(0.06),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(Dimens.spacing16),
                        bottomLeft: Radius.circular(Dimens.spacing16),
                        bottomRight: Radius.circular(Dimens.spacing16))),
                child: Text(item.content,
                    style: context.myTheme.textThemeT1.caption
                        .copyWith(color: ColorApp.colorE08)),
              ),
              !isFirstMsg
                  ? const VSpacing(spacing: Dimens.spacing4)
                  : Container(),
              !isFirstMsg
                  ? Text(
                      item.time,
                      style: context.myTheme.textThemeT1.title.copyWith(
                          color: ColorApp.black.withOpacity(0.5), fontSize: 10),
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );
  }
}

class _MessageSenderItem extends StatelessWidget {
  final ChatItemDomain item;
  const _MessageSenderItem({required this.item});

  @override
  Widget build(BuildContext context) {
    final isFirstMsg = item.isFirstMsg == true;

    return Container(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: ColorApp.colorA7A,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimens.spacing16),
                    bottomLeft: Radius.circular(Dimens.spacing16),
                    bottomRight: Radius.circular(Dimens.spacing16))),
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.spacing12, horizontal: Dimens.spacing6),
            child: Text(item.content,
                style: context.myTheme.textThemeT1.caption
                    .copyWith(color: ColorApp.white)),
          ),
          const VSpacing(spacing: Dimens.spacing4),
          !isFirstMsg
              ? Text(
                  item.time,
                  style: context.myTheme.textThemeT1.title.copyWith(
                      color: ColorApp.black.withOpacity(0.5), fontSize: 10),
                )
              : Container()
        ],
      ),
    );
  }
}
