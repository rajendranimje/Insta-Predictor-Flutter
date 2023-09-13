import 'package:flutter/material.dart';
import 'package:InstaPredictor/res/constants/image_constants.dart';
import 'package:InstaPredictor/res/constants/routes/approutes.dart';
import 'package:InstaPredictor/res/constants/string_constants.dart';
import 'package:InstaPredictor/res/constants/styles/text_style_constants.dart';

class SideBarView extends StatefulWidget {
  const SideBarView({super.key});

  @override
  State<SideBarView> createState() => _SideBarViewState();
}

class _SideBarViewState extends State<SideBarView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 38, 164, 171),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImageConstants.iconsun,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  StringConstants.InstaPredictor,
                  style: TextStyleConstants.headingTextStyle,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(
              ImageConstants.home,
              width: 25,
            ),
            title: const Text(
              StringConstants.home,
              style: TextStyleConstants.sidebarTextSTyle,
            ),
            onTap: () {
              Navigator.pushNamed(context, Approutes.dashboard);
            },
          ),
          ListTile(
            leading: Image.asset(
              ImageConstants.info,
              width: 25,
            ),
            title: const Text(
              StringConstants.aboutApp,
              style: TextStyleConstants.sidebarTextSTyle,
            ),
            onTap: () {
              Navigator.pushNamed(context, Approutes.about);
            },
          ),
          ListTile(
            leading: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.srcIn),
              child: Image.asset(
                ImageConstants.planets,
                width: 25,
              ),
            ),
            title: const Text(
              StringConstants.instaPredictorPro,
              style: TextStyleConstants.sidebarTextSTyle,
            ),
            onTap: () {
              Navigator.pushNamed(context, Approutes.InstaPredictorPro);
            },
          ),
          ListTile(
            leading: Image.asset(
              ImageConstants.astro_pearl,
              width: 25,
            ),
            title: const Text(
              StringConstants.astroPearl,
              style: TextStyleConstants.sidebarTextSTyle,
            ),
            onTap: () {
              Navigator.pushNamed(context, Approutes.pearl);
            },
          ),
          ListTile(
            leading: Image.asset(
              ImageConstants.privacy,
              width: 25,
            ),
            title: const Text(
              StringConstants.privacyPolicy,
              style: TextStyleConstants.sidebarTextSTyle,
            ),
            onTap: () {
              Navigator.pushNamed(context, Approutes.privacy);
            },
          ),
        ],
      ),
    );
  }
}
