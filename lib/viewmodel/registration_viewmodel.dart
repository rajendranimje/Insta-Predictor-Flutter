import 'package:flutter/material.dart';
import 'package:instantpredictor/data/local_store_helper.dart';
import 'package:instantpredictor/repository/registration_repository.dart';
import 'package:instantpredictor/res/components/Loader.dart';
import 'package:instantpredictor/res/components/alert_dialog.dart';
import 'package:instantpredictor/res/constants/api_error_codes.dart';
import 'package:instantpredictor/res/constants/routes/approutes.dart';
import 'package:instantpredictor/res/constants/string_constants.dart';
import 'package:instantpredictor/utils/validators.dart';

class RegistrationViewModel with ChangeNotifier {
  final _registrationRepository = RegistrationRepository();
  TextEditingController controller = TextEditingController();

  validate(GlobalKey<FormState> formkey, String name, String emailId,
      String mobileNo, String type, BuildContext context) async {
    if (formkey.currentState!.validate()) {
      var customLoader = Loader();
       showDialog(context: context, builder: (context) => customLoader);
      final result = await _registrationRepository.getRegistrationDetails(
          name, emailId, mobileNo, type);
      if (result.message == ApiErrorCodes.success ||
          result.message == ApiErrorCodes.exist) {
        await LocalStoreHelper().writeTheData("isLoggedIn", true);
        await LocalStoreHelper().writeTheData("Mobile Number", mobileNo);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result.message.toString()),
          ),
        );

        Navigator.pushNamed(context, Approutes.dashboard);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialogReUsable(
              nobutton: const Text(""),
              message: "Server not responding",
              onpressed: () {
                Navigator.pop(context);
              },
              buttontext: StringConstants.ok,
            );
          },
        );
      }
    }
  }

  validateEmail(email) {
    bool isEmailValid = Validators().validateEmail(email);
    if (email.isEmpty) {
      return StringConstants.isEmailEmpty;
    } else if (!isEmailValid) {
      return StringConstants.isEmailValid;
    }
  }

  clearData(TextEditingController controller) {
    controller.clear();
  }
}