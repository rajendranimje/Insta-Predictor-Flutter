import 'package:flutter/material.dart';
import 'package:InstaPredictor/res/constants/image_constants.dart';
import 'package:InstaPredictor/view/sidebar.dart';

class appBarReusable extends StatefulWidget {
  appBarReusable(
      {super.key,
      required this.heading,
      this.isRefreshVisible,
      required this.child,
      this.onRefresh});
  final String heading;
  final Widget child;
  final bool? isRefreshVisible;
  final void Function()? onRefresh;
  @override
  State<appBarReusable> createState() => _appBarReusableState();
}

class _appBarReusableState extends State<appBarReusable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarView(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          widget.heading,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          if (widget.isRefreshVisible != null &&
              widget.isRefreshVisible == true)
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 0.025),
              child: GestureDetector(
                onTap: widget.onRefresh,
                child: Image.asset(
                  ImageConstants.refresh,
                  height: 30,
                  width: 30,
                ),
              ),
            )
        ],
      ),
      body: widget.child,
      bottomSheet: SizedBox(
        child: Image.asset(
          ImageConstants.insta_predictor_add,
          width: double.infinity,
          height: 50,
        ),
      ),
    );
  }
}
