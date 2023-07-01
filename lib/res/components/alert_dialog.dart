
import 'package:flutter/material.dart';
import 'package:instantpredictor/res/constants/string_constants.dart';

class AlertDialogReUsable extends StatelessWidget {
  final String message;
  final String buttontext;
  final void Function()? onpressed;

 final Widget nobutton;
  const AlertDialogReUsable({
    super.key,
    required this.message,
    required this.onpressed,
     required this.nobutton, required this.buttontext,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(StringConstants.instantPredictor),
      content: Text(message),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: onpressed,
              child:  Text(
                buttontext.toString(),
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            nobutton
            
          ],
        ),
        
      ],
    );
  }
}
