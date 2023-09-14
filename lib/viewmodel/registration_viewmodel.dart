import 'package:InstaPredictor/res/components/internetCheck.dart';
import 'package:InstaPredictor/res/components/networkAlert.dart';
import 'package:flutter/material.dart';
import 'package:InstaPredictor/data/local_store_helper.dart';
import 'package:InstaPredictor/repository/registration_repository.dart';
import 'package:InstaPredictor/res/components/Loader.dart';
import 'package:InstaPredictor/res/components/alert_dialog.dart';
import 'package:InstaPredictor/res/constants/api_error_codes.dart';
import 'package:InstaPredictor/res/constants/routes/approutes.dart';
import 'package:InstaPredictor/res/constants/string_constants.dart';
import 'package:InstaPredictor/utils/validators.dart';

class RegistrationViewModel with ChangeNotifier {
  final _registrationRepository = RegistrationRepository();
  TextEditingController controller = TextEditingController();

  validate(GlobalKey<FormState> formkey, String name, String emailId,
      String mobileNo, String type, BuildContext context) async {
    if (formkey.currentState!.validate()) {
      if (await InternetCheck()) {
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
      } else {
        AlertsNetwork.showAlertDialog(context, StringConstants.internetcheck,
            onpressed: () {
          Navigator.pop(context);
        }, buttontext: StringConstants.ok, align: TextAlign.center);
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
