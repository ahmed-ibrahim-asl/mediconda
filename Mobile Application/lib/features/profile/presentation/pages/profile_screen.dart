import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediconda/core/managers/color_manager.dart';
import 'package:mediconda/core/managers/size_manager.dart';

import '../../../../core/managers/asset_manager.dart';
import '../../../../core/managers/font_style_manager.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            32.h.verticalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: ColorManager.white,
                  child: SvgPicture.asset(
                    SvgAssetManager.logo,
                  ),
                ),
                Text(
                  'mediconda',
                  style: FontStyleManager.getOverLockBold(color: ColorManager.white, fontSize: 28.sp),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
             CustomButton(title: 'Support me on instapay',color: ColorManager.lighterGrey, icon: AssetsManager.money, textColor: ColorManager.darkerBlue,iconColor: ColorManager.black.withOpacity(0.3),),
            Divider(
              color: ColorManager.darkerBlue,
              height: 32.h,
              endIndent: 16.w,
              indent: 16.w,
            ),
             CustomButton(title: 'Rate us on Google play',color: ColorManager.darkerBlue, icon: AssetsManager.rating, textColor: ColorManager.white,),
                Divider(
                  color: ColorManager.darkerBlue,
                  height: 32.h,
                  endIndent: 16.w,
                  indent: 16.w,
                ),

             CustomButton(title: 'Share app with your friends',color: ColorManager.lighterGrey, textColor: ColorManager.darkerBlue,),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You can follow us on',
                  style: FontStyleManager.getOverLockBold(color: ColorManager.white, fontSize: 24.sp),
                ),
                SizedBox(
                  width: 0.8.sw,
                  height: 80.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Image.asset(AssetsManager.linkedin,height: 48.dm,width: 48.dm,fit: BoxFit.cover,),
                  Image.asset(AssetsManager.instagram,height: 48.dm,width: 48.dm,fit: BoxFit.cover,),
                  Image.asset(AssetsManager.twitter,height: 48.dm,width: 48.dm,fit: BoxFit.cover,),
                    ],
                  ),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.title, required this.color,  this.icon, required this.textColor, this.iconColor,
  });
final String title;
final Color color;
final Color? iconColor;
final Color textColor;
final String? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw-32.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(SizeManager.mediumBorderRadius),
      ),
      child: Row(
        children: [
          if(icon!=null)
          Image.asset(icon!,height: 48.dm,width: 48.dm,color: iconColor,),
          Expanded(child: Text(title,textAlign: TextAlign.center,style: FontStyleManager.getOverLockRegular(color: textColor,fontSize: 24.sp),)),
          if(icon!=null)
          Image.asset(icon!,height: 48.dm,width: 48.dm,color: iconColor,),
        ],
      ),
    );
  }
}
