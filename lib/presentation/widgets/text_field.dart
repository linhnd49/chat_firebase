import 'package:flutter/material.dart';
import 'package:softbase/utils/extensions/context_ext.dart';

import '../../utils/constains/colors.dart';

class TextFieldLogin extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final bool? obscureText;
  const TextFieldLogin(
      {super.key, this.controller, required this.label, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: context.myTheme.textThemeT1.caption
              .copyWith(color: ColorApp.colorA7A, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            obscureText: obscureText ?? false,
            controller: controller,
            style: context.myTheme.textThemeT1.body
                .copyWith(color: ColorApp.colorE08),
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorApp.color1D0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorApp.color1D0),
              ),
            ),
          ),
        )
      ],
    );
  }
}
