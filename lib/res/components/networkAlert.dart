import 'package:flutter/material.dart';

class AlertsNetwork {
  static showAlertDialog(BuildContext context, var message,
      {required Function() onpressed,
      Color? buttoncolor,
      align,
      required String buttontext}) {
    Widget okButton = Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          height: MediaQuery.of(context).size.height * 0.05,
          color: Color.fromARGB(255, 62, 59, 59),
          child: TextButton(
            onPressed: onpressed,
            child: Text(
              buttontext,
              textAlign: align,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ),
      ),
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



/* class AlertWithOk {
  static showAlertDialog(BuildContext context, var message,
      {required Function() onpressed,
      Color? buttoncolor,
      Color? buttontextcolor,
      align,
      required String buttontext}) {
    Widget okButton = TextButton(
      onPressed: onpressed,
      child: Text(
        buttontext,
        textAlign: align,
        style: TextStyle(
            color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );

    AlertDialog alert = AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "${message.toString()}",
        ),
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

class AlertWithUpdateGrievance {
  static showAlertDialog(BuildContext context, var message,
      {required Function() onpressed,
      Color? buttoncolor,
      Color? buttontextcolor,
      String? title,
      align,
      required String buttontext}) {
    Widget okButton = TextButton(
      onPressed: onpressed,
      child: Text(
        buttontext,
        textAlign: align,
        style: TextStyle(
          color: Colors.teal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "${title.toString()}",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          Text("${message.toString()}", style: TextStyle(fontSize: 16)),
        ],
      ),
      actions: [okButton],
    );
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
      /* builder: (BuildContext context) {
        return alert;
      }, */
    );
  }
}
 */