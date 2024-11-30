import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:mediconda/core/managers/asset_manager.dart';
import 'package:mediconda/core/managers/color_manager.dart';
import 'package:mediconda/core/managers/extensions.dart';
import 'package:mediconda/core/navigation/routes.dart';

import '../../../../core/managers/font_style_manager.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.addScreen(Routes.onboarding);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkBlue,
      body: SafeArea(
        child: Stack(
          fit:StackFit.expand,
          children: [
            SvgPicture.asset(SvgAssetManager.splashBackground,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(ColorManager.darkestBlue, BlendMode.srcIn),
              // color: ColorManager.darkestBlue,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: SvgPicture.asset(
                      SvgAssetManager.logo,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Mediconda',
                    style: TextStyle(
                      fontSize: FontSizeManager.s24,
                      fontWeight: FontWeightManager.bold,
                      color: ColorManager.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
