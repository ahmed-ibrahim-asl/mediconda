import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/color_manager.dart';
import 'package:mediconda/core/managers/constant_manager.dart';
import 'package:mediconda/core/managers/font_style_manager.dart';

import '../../../core/managers/size_manager.dart';

class BuildSearchBar extends StatefulWidget{

  BuildSearchBar({super.key});

  @override
  State<BuildSearchBar> createState() => _BuildSearchBarState();
}

class _BuildSearchBarState extends State<BuildSearchBar> {
  final customBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(SizeManager.mediumBorderRadius),
    borderSide: BorderSide.none
  );

  final width = 1.sw-32.w;
TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return TextFormField(
       controller: searchController,
       decoration: InputDecoration(
         fillColor: ColorManager.white,
         filled: true,
         hintText: "Search Medicine & Healthcare products",
         hintStyle: FontStyleManager.getOverPassRegular(color: ColorManager.grey,fontSize: FontSizeManager.s13.sp),
         prefixIcon: IconButton(onPressed: (){

setState(() {
  results.clear();

});
if(searchController.text.isNotEmpty){
  medicines.forEach((element) {
    if(element.name.toLowerCase().contains(searchController.text.toLowerCase())){
      setState(() {
        results.add(element);
      });
    }
  });

}
         }, icon: Icon(Icons.search, color:ColorManager.grey,)),
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