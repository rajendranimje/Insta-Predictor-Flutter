import 'package:flutter/material.dart';


class RegisterButton extends StatelessWidget {
  RegisterButton({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
    this.width, this.height, this.buttoncolor, this.buttontextcolor,  this.buttonradius,
  });
  final String buttonText;
  final void Function()? onButtonPressed;
 final double? width;
final  double? height;
 final Color? buttoncolor;
  final Color? buttontextcolor;
  final double? buttonradius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            buttoncolor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        onPressed: onButtonPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttontextcolor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
