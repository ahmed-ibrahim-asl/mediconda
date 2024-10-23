import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/color_manager.dart';
import 'package:mediconda/core/managers/font_style_manager.dart';

import '../../../core/managers/size_manager.dart';

class BuildSearchBar extends StatelessWidget{
  final customBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(SizeManager.mediumBorderRadius),
    borderSide: BorderSide.none
  );
  final width = 1.sw-32.w;

  BuildSearchBar({super.key});
  @override
  Widget build(BuildContext context) {
     return TextFormField(
       decoration: InputDecoration(
         fillColor: ColorManager.white,
         filled: true,
         hintText: "Search Medicine & Healthcare products",
         hintStyle: FontStyleManager.getOverPassRegular(color: ColorManager.grey,fontSize: FontSizeManager.s13.sp),
         prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search, color:ColorManager.grey,)),
         constraints: BoxConstraints(
           minWidth: width,
           maxWidth: width,
           minHeight: 50.h,
           maxHeight: 50.h,
         ),
         border: customBorder,
         enabledBorder: customBorder,
         disabledBorder: customBorder,
         focusedBorder: customBorder,

       ),
     );
  }

}