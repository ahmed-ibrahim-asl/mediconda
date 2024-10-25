import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/color_manager.dart';
import '../managers/font_style_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title,  this.onPressed,
  });
final String title;
final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: FontStyleManager.getOverPassBold(),),
      actions: [
        if(onPressed!=null)
        TextButton(onPressed:onPressed, child: Text('Clear all',style: FontStyleManager.getOverPassBold(color: ColorManager.blueBlue)),)
      ],
      forceMaterialTransparency: true,

    );
  }

  @override
  Size get preferredSize => Size(1.sw, 60.h);
}
