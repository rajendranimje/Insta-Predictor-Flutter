import 'package:flutter/material.dart';

class ExitAlert {
  static showAlertDialog(
    BuildContext context,
    var message, {
    required Function() onCancel,
    required Function() onOk,
    Color? buttoncolor,
    align,
  }) {
    Widget okButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            textAlign: align,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        TextButton(
          onPressed: onOk,
          child: Text(
            "Ok",
            textAlign: align,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ],
    );

    AlertDialog alert = AlertDialog(
      content: Text(
        "${message.toString()}",
        textAlign: TextAlign.center,
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            return false; // Prevent pop gesture
          },
          child: alert,
        );
      },
      /*  builder: (BuildContext context) {
        return alert;
      }, */
    );
  }
}