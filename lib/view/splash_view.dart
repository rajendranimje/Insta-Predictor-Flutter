import 'package:flutter/material.dart';
import 'package:InstaPredictor/data/local_store_helper.dart';
import 'package:InstaPredictor/res/constants/image_constants.dart';
import 'package:InstaPredictor/res/constants/routes/approutes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.splashImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Please wait....",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () async {
      var isChecked = await LocalStoreHelper().readTheData("isLoggedIn");
      if (isChecked == true) {
        Navigator.pushNamed(context, Approutes.dashboard);
      } else if (isChecked == null) {
        Navigator.pushNamed(context, Approutes.registration);
      }
    });
  }
}
