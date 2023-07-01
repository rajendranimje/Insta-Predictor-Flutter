import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as inappweb;
import 'package:instantpredictor/res/components/appbar.dart';
import 'package:instantpredictor/res/constants/string_constants.dart';
import 'package:instantpredictor/res/constants/url_constants.dart';

class AstroDiamond extends StatefulWidget {
  const AstroDiamond({super.key});

  @override
  State<AstroDiamond> createState() => _AstroDiamondState();
}

class _AstroDiamondState extends State<AstroDiamond> {
  @override
  Widget build(BuildContext context) {
    return appBarReusable(
      heading: StringConstants.instantPredictor,
      isRefreshVisible: false,
      child: 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: inappweb.InAppWebView(
              initialUrlRequest: inappweb.URLRequest(
                url: Uri.parse(UrlConstants.astroPearl),
              ),
              initialOptions: inappweb.InAppWebViewGroupOptions(
                android: inappweb.AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                  // it makes 2 times bigger
                ),
              ),
            ),
          ),
     
    );
  }
}