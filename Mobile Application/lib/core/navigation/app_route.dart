import 'package:flutter/material.dart';
import 'package:mediconda/features/details/presentation/pages/details_screen.dart';
import 'package:mediconda/features/empty/presentation/pages/empty_screen.dart';
import 'package:mediconda/features/notification/presentation/pages/notification_screen.dart';
import 'package:mediconda/features/profile/presentation/pages/profile_screen.dart';
import 'package:mediconda/features/search/presentation/pages/search_screen.dart';
import 'package:mediconda/features/verify_otp/presentation/pages/verify_otp_screen.dart';

import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';
import 'routes.dart';

class AppRoute {
  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _materialPageRoute(const SplashScreen());
        case Routes.login:
        return _materialPageRoute(const AuthScreen());
      case Routes.onboarding:
        return _materialPageRoute( OnboardingScreen());
      case Routes.home:
        return _materialPageRoute(const HomeScreen());
      case Routes.profile:
        return _materialPageRoute(const ProfileScreen());
      case Routes.verifyOtp:
        return _materialPageRoute(const VerifyOtpScreen());
      case Routes.search:
        return _materialPageRoute(const SearchScreen());
      case Routes.details:
        return _materialPageRoute(const DetailsScreen());
      case Routes.notification:
        return _materialPageRoute(const NotificationScreen());

      default:
        return _nonFoundPage();
    }
  }

  static _materialPageRoute(Widget child) =>
      MaterialPageRoute(builder: (context) => child);

  static _nonFoundPage() => _materialPageRoute(const Scaffold());
}
