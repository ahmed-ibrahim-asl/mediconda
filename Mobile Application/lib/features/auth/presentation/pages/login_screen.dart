import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediconda/core/managers/extensions.dart';
import 'package:mediconda/core/navigation/routes.dart';
import 'package:mediconda/core/widgets/primary_button.dart';

import '../../../../core/managers/asset_manager.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/font_style_manager.dart';
import '../../../../core/managers/size_manager.dart';
import '../cubit/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: BlocProvider(
  create: (context) => AuthCubit(),
  child: BlocConsumer<AuthCubit, AuthState>(
  builder: (context, state) {
    final cubit = AuthCubit.get(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            padding: EdgeInsets.only(top: 70.h, bottom: 59.h),
            alignment: Alignment.center,// Responsive padding
            child:         CircleAvatar(
              radius: 35,
              backgroundColor: ColorManager.white,
              child: SvgPicture.asset(
                SvgAssetManager.logo,
              ),
            ),

          ),
          Form(
              key: cubit.formKey,
              child: cubit.isLogin ? LoginView() : SignUpView()),
          // Form(child: LoginView()),
          Center(child: PrimaryButton(onPressed: (){
            cubit.authUser();
          }, text:  cubit.isLogin ?'Login':'Sign up',width: 1.sw-32.w,)),
if(cubit.isLogin)
          TextButton(onPressed: (){}, child: Text('Forget password ?',style: FontStyleManager.getOverPassBold(
color: ColorManager.lighterBlue
),)),
          Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 32.h),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(cubit.isLogin ?'Don\'t have an account ?':'Already have an account ?',style: FontStyleManager.getOverPassBold(color: ColorManager.lighterBlue),),
                TextButton(onPressed: (){
                  cubit.changeIsLogin();
                }, child: Text(cubit.isLogin ?'Sign up':'Login',style: FontStyleManager.getOverPassBold(color: ColorManager.blueBlue),)),
              ],
            ),
          ),


        ],
      );
  }, listener: (BuildContext context, AuthState state) {
    if(state is AuthSuccessState){
      context.replaceScreen(Routes.home);
    }
  },
),
),
    );
  }
}

class LoginView extends StatelessWidget {
   LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.3.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only( bottom: 16.h),  // Responsive padding
                child: Text(
                    'Login',
                    style: FontStyleManager.getOverPassBold(fontSize: 24.sp)  // Responsive font size
                ),
              ),

              CustomTextFormField(controller: context.read<AuthCubit>().emailController, keyboardType: TextInputType.emailAddress, hintText: 'Email', icon: Icons.email_outlined, validator: (String? text) {
                if (text == null || text.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },),
            ],
          ),
          CustomTextFormField(controller: context.read<AuthCubit>().passwordController, keyboardType: TextInputType.visiblePassword, hintText: 'Password', icon: Icons.password, validator: (String? text) {
    if (text == null || text.isEmpty) {
    return 'Please enter your password';
    }
    return null;
    },),
        ],
      ),
    );
  }
}
class SignUpView extends StatelessWidget {
  SignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.5.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only( bottom: 16.h),  // Responsive padding
                child: Text(
                    'Signup',
                    style: FontStyleManager.getOverPassBold(fontSize: 24.sp)  // Responsive font size
                ),
              ),

              CustomTextFormField(controller: context.read<AuthCubit>().nameController, keyboardType: TextInputType.name, hintText: 'Name', icon: Icons.person_outline,validator: (String? text) {
                if (text == null || text.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },),
            ],
          ),
          CustomTextFormField(controller: context.read<AuthCubit>().emailController, keyboardType: TextInputType.emailAddress, hintText: 'Email', icon: Icons.email_outlined,validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },),

          CustomTextFormField(controller: context.read<AuthCubit>().passwordController, keyboardType: TextInputType.visiblePassword, hintText: 'Password', icon: Icons.password,validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },),
          CustomTextFormField(controller: context.read<AuthCubit>().phoneController, keyboardType: TextInputType.phone, hintText: 'Phone', icon: Icons.phone_android,validator: (String? text) {
            if (text == null || text.isEmpty) {
              return 'Please enter your phone';
            }
            return null;
          },),
        ],
      ),
    );
  }
}
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key, required this.controller, required this.keyboardType, required this.hintText, required this.icon, required this.validator,

  });
TextEditingController controller ;
final TextInputType keyboardType ;
final String hintText;
final IconData icon;
final String? Function(String?)? validator;
  final customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeManager.mediumBorderRadius),
      borderSide: BorderSide.none
  );
  final width = 1.sw-32.w;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          fillColor: ColorManager.white,
          filled: true,
          hintText: hintText,
          hintStyle: FontStyleManager.getOverPassRegular(color: ColorManager.grey,fontSize: FontSizeManager.s13.sp),
          prefixIcon: Icon(icon, color:ColorManager.grey,),
          constraints: BoxConstraints(
            minWidth: width,
            maxWidth: width,
            minHeight: 50.h,
            // maxHeight: 50.h,
          ),
          contentPadding: EdgeInsets.zero,
          border: customBorder,
          enabledBorder: customBorder,
          disabledBorder: customBorder,
          focusedBorder: customBorder,

        ),
      ),
    );
  }
}
