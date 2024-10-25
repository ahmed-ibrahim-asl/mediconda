import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../../component/buildSearchBar.dart';
import '../../component/build_product_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 1.sw,
          height: 150.h,

          decoration: BoxDecoration(
              color: ColorManager.darkBlue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(SizeManager.smallBorderRadius))
          ),),
        SizedBox(
          height: 1.sh,
          child: Column(
            children: [
              Container(

                margin:EdgeInsets.only(top: 120.h) ,
                // padding: const EdgeInsets.all( 10.0),

                child: BuildSearchBar(),
              ),

              const Expanded(child: BuildProductGrid()),
            ],
          ),
        ),
      ],
    );
  }
}
