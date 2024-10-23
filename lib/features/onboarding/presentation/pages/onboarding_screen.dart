import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediconda/features/onboarding/presentation/cubit/onboarding_cubit.dart';
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
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final cubit = OnboardingCubit.get(context);
            return Column(
              children: [
                Expanded(
                  child:
                  PageView.builder(
                    controller: widget.pageController,
                    onPageChanged: (index) {
                      widget.currentPage = index;
                      setState(() {

                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return OnboardingContent(data: cubit.onboardingItems[index]);
                    },
                    itemCount: cubit.onboardingItems.length,
                  ),
                ),
                BuildButtonNavigationOnboarding(
                  isLastPage: widget.currentPage == cubit.onboardingItems.length - 1,
                  pageController: widget.pageController,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}



