import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../managers/theme_manager.dart';
import '../navigation/app_route.dart';
import '../navigation/routes.dart';

class MedicondaApp extends StatelessWidget {
  const MedicondaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375,812),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          title: 'Mediconda',
          theme: ThemeManager.lightTheme(),
          onGenerateRoute: (settings)=>AppRoute.generateRoute(settings),
          initialRoute: Routes.splash,
          debugShowCheckedModeBanner: false,

          

        );
      }
    );
  }
}