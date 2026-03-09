import 'package:flutter/material.dart' hide Colors;

import 'colors.dart';
import 'layout.dart';

InputDecoration inputDecoration({
  String? error,
}) =>
    InputDecoration(
      fillColor: Colors.white,
      filled: true,
      errorText: error,
      focusedBorder: inputBorder(error),
      enabledBorder: inputBorder(error),
      disabledBorder: inputBorder(error),
      errorBorder: inputBorder(error),
      border: inputBorder(error),
    );

OutlineInputBorder inputBorder(String? error) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(UILayout.small),
      borderSide: BorderSide(
        width: 1,
        color: error == null
            ? Colors.salmonBrand[30]!
            : Colors.bitterSweetError[30]!,
      ),
    );
