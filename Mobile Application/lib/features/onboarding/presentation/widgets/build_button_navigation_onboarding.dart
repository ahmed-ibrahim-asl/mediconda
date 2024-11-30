import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/extensions.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/navigation/routes.dart';

class BuildButtonNavigationOnboarding extends StatelessWidget {
    const BuildButtonNavigationOnboarding({super.key,  required this.pageController, required this.isLastPage, });
   final PageController pageController;
   final bool isLastPage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed:() {
              context.replaceScreen(Routes.login);
            },
            child:  Text(
              "Skip",
              style: TextStyle(color: ColorManager.black),
            ),
          ),
          TextButton(
            onPressed:(){
              if(isLastPage){
                context.replaceScreen(Routes.login);
              }else{
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text(
               isLastPage ? "Get Started" : "Next",
              style: TextStyle(color:isLastPage? ColorManager.blue : ColorManager.blue ),
            ),
          ),
        ],
      ),
    );
  }
}
