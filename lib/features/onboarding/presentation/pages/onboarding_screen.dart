import 'package:flutter/material.dart';
import 'package:mediconda/features/onboarding/presentation/models/onboarding_data.dart';
import 'package:mediconda/features/onboarding/presentation/widgets/build_button_navigation_onboarding.dart';
import 'package:mediconda/features/onboarding/presentation/widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: [
          Expanded(
            child:
            PageView.builder(
              controller:widget.pageController,
              onPageChanged: (index) {
                widget.currentPage=index;
                setState(() {

                });},

              itemBuilder: (BuildContext context, int index) {
                return OnboardingContent(data: onboardingItems[index]);
              },
              itemCount: onboardingItems.length,
            ),
          ),
          BuildButtonNavigationOnboarding(
            currentPage: widget.currentPage,
            pageController: widget.pageController,
          )
        ],
      ) ,
    );
  }
}



