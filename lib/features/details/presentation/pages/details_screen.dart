import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/asset_manager.dart';
import 'package:mediconda/core/managers/size_manager.dart';
import 'package:mediconda/core/widgets/custom_app_bar.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_style_manager.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(title: 'Details', ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        margin: EdgeInsets.all(16.dm),
        padding: EdgeInsets.all(15.dm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(SizeManager.mediumBorderRadius)),
       color: ColorManager.lightGreen
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Pharmacy: Elezaby',style: FontStyleManager.getOvoRegular(fontSize: 20.sp,color: ColorManager.black),),
        Text('Number: 01119819600',style: FontStyleManager.getOvoRegular(fontSize: 20.sp,color: ColorManager.black),),
        Text('Delivery Line: 19600',style: FontStyleManager.getOvoRegular(fontSize: 20.sp,color: ColorManager.black),),
        Text('Branch: cairo - roxy',style: FontStyleManager.getOvoRegular(fontSize: 20.sp,color: ColorManager.black),),
        Center(
          child: Column(
            children: [
              Text('Ganaton',style: FontStyleManager.getOvoRegular(fontSize: 20.sp,color: ColorManager.black),),
              Container(
                width: 1.sw,
                height: 0.2.sh,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeManager.largeBorderRadius),
                  color: ColorManager.darkGrey,
                ),
                child: Container(
                  width: 0.8.sw,
                  height: 0.2.sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeManager.mediumBorderRadius),
                    image: const DecorationImage(image: AssetImage(AssetsManager.ganaton),fit: BoxFit.fill),
                  ),
                ),
              ),
              Text('Location:9 El Koba Street\nRoxy - Heliopolis ,Roxy',
                textAlign: TextAlign.start,
                style: FontStyleManager.getOvoRegular(fontSize: 20.sp,color: ColorManager.black),),
            ],
          ),
        )

      ],
        )),
    );
  }
}
