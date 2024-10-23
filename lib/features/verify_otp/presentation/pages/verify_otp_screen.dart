/**
 * File: verify_otp_screen.dart
 * Author: mr-h0n3y
 * Last Edit: 10/12/2024
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconda/core/managers/extensions.dart';
import 'package:mediconda/core/widgets/primary_button.dart';
import '../../../../core/managers/font_style_manager.dart';
import '../../../../core/navigation/routes.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70.h, bottom: 59.h),  // Responsive padding
            child: Image.asset(
              "assets/image/logo_info.png",
              width: 150.w,   // Added responsive width
              height: 150.h,  // Added responsive height
            ),
          ),

          /************************* Instructions *************************/
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),  // Responsive padding
            child: Text(
                'Choose Your Role',
                style: FontStyleManager.getOverPassBold(fontSize: 24.sp)  // Responsive font size
            ),
          ),

          Text(
            "Select the account type that best\n describes you.",
            textAlign: TextAlign.center,
            style: FontStyleManager.getOverPassRegular(
                color: Colors.grey[700],
                fontSize: 21.sp  // Responsive font size
            ),
          ),
          /****************************************************************/


          /******************* Customer Role Description *******************/
          Padding(
            padding: EdgeInsets.only(top: 85.h),  // Responsive padding
            child: SizedBox(
              width: 405.w,    // Responsive width
              height: 73.h,    // Responsive height
              child: Text(
                  '1 - If you want to search for medicines and purchase them from nearby pharmacies',
                  textAlign: TextAlign.center,
                  style: FontStyleManager.getOverPassRegular(color: Colors.grey[700], fontSize: 21.sp)  // Responsive font size
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 50.h),  // Responsive padding
            child: PrimaryButton(
                onPressed: () {
                  context.replaceScreen(Routes.home);
                },
                text: 'Customer',
                width: 310.w  // Responsive width
            ),
          ),
          /*****************************************************************/


          /******************* Supplier Role Description *******************/
          SizedBox(
            width: 405.w,  // Responsive width
            height: 73.h,  // Responsive height
            child: Text(
                '2 - If you own a pharmacy and want to list the available medicines on the app.',
                textAlign: TextAlign.center,
                style: FontStyleManager.getOverPassRegular(color: Colors.grey[700], fontSize: 21.sp)  // Responsive font size
            ),
          ),

          PrimaryButton(
              onPressed: (){},
              text: 'Supplier',
              width: 310.w  // Responsive width
          ),
          /*****************************************************************/

        ],
      ),
    );
  }
}