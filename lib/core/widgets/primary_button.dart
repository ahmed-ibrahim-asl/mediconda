import 'package:flutter/material.dart';
import 'package:mediconda/core/managers/font_style_manager.dart';

import '../managers/color_manager.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.onPressed, required this.text, this.width});

  final VoidCallback onPressed;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: width != null
              ? Size(width!, 50)
              : null,
        ),
        child: Text(
          text,
          style: FontStyleManager.getOverPassBold(
              color: ColorManager.white, fontSize: FontSizeManager.s20),
        ));
  }
}
