import 'package:flutter/material.dart';
import 'package:instantpredictor/res/constants/routes/approutes.dart';
import 'package:instantpredictor/view/about_app_view.dart';
import 'package:instantpredictor/view/astro_diamond_view.dart';
import 'package:instantpredictor/view/dashboard_view.dart';
import 'package:instantpredictor/view/insta_predictor_pro_view.dart';
import 'package:instantpredictor/view/privacy_view.dart';
import 'package:instantpredictor/view/registration_view.dart';
import 'package:instantpredictor/view/splash_view.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      Approutes.splash: (context) => const SplashScreen(),
      Approutes.registration: (context) => const RegistrationView(),
      Approutes.dashboard:(context) =>const  DashboardView(),
      Approutes.about:(context) =>const AboutApp(),
      Approutes.privacy:(context) =>const PrivacyView(),
      Approutes.pearl:(context) =>const AstroDiamond(),
      Approutes.instantPredictorPro:(context) =>const InstaPredictorProView()
    };
  }
}
