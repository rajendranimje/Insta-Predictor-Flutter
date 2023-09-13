import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:InstaPredictor/res/constants/string_constants.dart';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AlertDialog(
            title: const Text(
              StringConstants.InstaPredictor,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  StringConstants.pleasewait,
                )
              ],
            ),
          )
        : CupertinoAlertDialog(
            title: const Text(
              StringConstants.InstaPredictor,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  StringConstants.pleasewait,
                )
              ],
            ),
          );
  }
}
