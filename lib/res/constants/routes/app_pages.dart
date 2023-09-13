import 'package:flutter/material.dart';
import 'package:InstaPredictor/res/constants/routes/approutes.dart';
import 'package:InstaPredictor/view/about_app_view.dart';
import 'package:InstaPredictor/view/astro_diamond_view.dart';
import 'package:InstaPredictor/view/dashboard_view.dart';
import 'package:InstaPredictor/view/insta_predictor_pro_view.dart';
import 'package:InstaPredictor/view/privacy_view.dart';
import 'package:InstaPredictor/view/registration_view.dart';
import 'package:InstaPredictor/view/splash_view.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      Approutes.splash: (context) => const SplashScreen(),
      Approutes.registration: (context) => const RegistrationView(),
      Approutes.dashboard: (context) => const DashboardView(),
      Approutes.about: (context) => const AboutApp(),
      Approutes.privacy: (context) => const PrivacyView(),
      Approutes.pearl: (context) => const AstroDiamond(),
      Approutes.InstaPredictorPro: (context) => const InstaPredictorProView()
    };
  }
}
