import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldReusable extends StatelessWidget {
  final String? hinttext;
   TextEditingController? controller;
  final String? isEmpty;
  final String? isValid;
  TextInputType? textType;
  int? maxlength;
  List<TextInputFormatter>? inputFormatter;
  TextFieldReusable(
      {super.key,
      this.hinttext,
      this.controller,
      this.isEmpty,
      this.isValid,
      this.textType,                
      this.maxlength,
      this.inputFormatter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      maxLength: maxlength,
      keyboardType: textType,
      controller: controller,
      inputFormatters: inputFormatter,
      validator: (value) {
        if (value!.isEmpty) {
          return isEmpty;
        } else if (isValid != null && value.length < 10) {
          return isValid;
        }else{
          return "";
        }
      },
      decoration: InputDecoration(
        counterText: '',
        hintText: hinttext,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
