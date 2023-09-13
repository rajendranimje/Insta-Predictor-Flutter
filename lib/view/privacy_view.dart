import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as inappweb;
import 'package:InstaPredictor/res/components/appbar.dart';
import 'package:InstaPredictor/res/constants/string_constants.dart';
import 'package:InstaPredictor/res/constants/url_constants.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({super.key});

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  Widget build(BuildContext context) {
    return appBarReusable(
      heading: StringConstants.InstaPredictor,
      isRefreshVisible: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: inappweb.InAppWebView(
          initialUrlRequest: inappweb.URLRequest(
            url: Uri.parse(UrlConstants.privacy),
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
