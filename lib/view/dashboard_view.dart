import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' as inappweb;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:instantpredictor/res/components/appbar.dart';
import 'package:instantpredictor/res/constants/app_constants.dart';
import 'package:instantpredictor/res/constants/string_constants.dart';
import 'package:intl/intl.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    super.key,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String? currentTime;
  String? currentDate;
  String? url;
  inappweb.InAppWebViewController? changedUrlController;
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 5,
              ),
              Text("Loading...")
            ],
          ), // Show a loading indicator until initialized
        ),
      );
    }
    return appBarReusable(
      onRefresh: refreshWebview,
      heading: StringConstants.instantPredictor,
      isRefreshVisible: true,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: inappweb.InAppWebView(
            initialUrlRequest: inappweb.URLRequest(
              url: Uri.parse(url ?? ""),
            ),
            initialOptions: inappweb.InAppWebViewGroupOptions(
              android: inappweb.AndroidInAppWebViewOptions(
                useHybridComposition: true,
                // it makes 2 times bigger
              ),
            ),
            onWebViewCreated: (inappweb.InAppWebViewController controller) {
                changedUrlController = controller;
              
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getRequiredData();
  }

  loadUrl(String url) {
    print("url: $url");
    changedUrlController?.loadUrl(
        urlRequest: inappweb.URLRequest(url: Uri.parse(url)));
        
  }

  refreshWebview() {
    String CurrentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    setState(() {
      url =
          "https://astrouser.com/astroapp/mobileapp/singlepageapp.aspx?lat=${AppConstants.latitude}&Lon=-${AppConstants.longitude}&tz=5.5&Mydate=$currentDate:$CurrentTime&mychartMethod=0&myayanmsha=0&isBhavaMadhya=1&lang=En&Nodetype=0&Placename=${AppConstants.address}";
    });
    loadUrl(url ?? "");
  }

  getRequiredData() async {
    currentDate = DateFormat('MM:dd:yyyy').format(DateTime.now());
    currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    Position? position = await getLatLong(currentDate, currentTime);
    AppConstants.latitude = position?.latitude ?? 0.0;
    AppConstants.longitude = position?.longitude ?? 0.0;
    String address = await getAddress(position);
    AppConstants.address = address;

    setState(() {
      url =
          "https://astrouser.com/astroapp/mobileapp/singlepageapp.aspx?lat=${position?.latitude}&Lon=-${position?.longitude}&tz=5.5&Mydate=$currentDate:$currentTime&mychartMethod=0&myayanmsha=0&isBhavaMadhya=1&lang=En&Nodetype=0&Placename=$address";
      isInitialized = true;
    });
    loadUrl(url ?? "");
  }

  Future<Position?> getLatLong(String? currentDate, String? currentTime) async {
    final hasPermission = await _handleLocationPermission(context);
    // ignore: use_build_context_synchronously
    if (!hasPermission) return null;
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      return position;
    }).catchError((e) {
      debugPrint(e);
    });
    return position;
  }

  Future<bool> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services adre disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'),
        ),
      );
      return false;
    }
    return true;
  }

  Future<String> getAddress(Position? position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position.longitude);
    Placemark place = placemarks[0];
    String address =
        "${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
    return address;
  }
}
