import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/extensions.dart';
import 'package:mediconda/features/onboarding/presentation/models/onboarding_data.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/navigation/routes.dart';

class BuildButtonNavigationOnboarding extends StatelessWidget {
    BuildButtonNavigationOnboarding({super.key, required this.currentPage, required this.pageController,});
   final PageController pageController;
   final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed:() {
              context.replaceScreen(Routes.home);
            },
            child:  Text(
              "Skip",
              style: TextStyle(color: ColorManager.black),
            ),
          ),
          TextButton(
            onPressed:(){
              if(currentPage==onboardingItems.length-1){
                context.replaceScreen(Routes.home);
              }else{
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: Text(
               currentPage== onboardingItems.length - 1 ? "Get Started" : "Next",
              style: TextStyle(color:currentPage == onboardingItems.length - 1? ColorManager.blue : ColorManager.blue ),
            ),
          ),
        ],
      ),
    );
  }
}
