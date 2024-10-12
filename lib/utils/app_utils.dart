import 'package:flutter/widgets.dart';

void widgetsBinding(Function complete) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    complete();
  });
}
