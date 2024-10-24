import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_style_manager.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.title, required this.image});
final String title;
final String image;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            32.h.verticalSpace,
            Text(title,style: FontStyleManager.getOverPassBold(fontSize: 24.sp,color: ColorManager.darkGrey),),
          ],
        ),
      ),
    );
  }
}
