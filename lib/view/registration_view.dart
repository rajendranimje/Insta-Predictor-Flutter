import 'package:InstaPredictor/res/components/exitAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:InstaPredictor/res/components/register_button.dart';
import 'package:InstaPredictor/res/components/text_field_reusable.dart';
import 'package:InstaPredictor/res/constants/image_constants.dart';
import 'package:InstaPredictor/res/constants/string_constants.dart';
import 'package:InstaPredictor/res/constants/styles/text_style_constants.dart';
import 'package:InstaPredictor/viewmodel/registration_viewmodel.dart';
import 'package:provider/provider.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _formkey = GlobalKey<FormState>();
  // Position? _currentPosition;
  // String? _currentAddress;
  //text: "dd"
  //text: "6356252652"
  //text: "s@gmail.com"
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final registrationProvider = Provider.of<RegistrationViewModel>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              ImageConstants.bg,
            ),
            fit: BoxFit.fill),
      ),
      child: WillPopScope(
        onWillPop: () async {
          ExitAlert.showAlertDialog(context, StringConstants.exitApp,
              onCancel: () {
                Navigator.pop(context);
              },
              align: TextAlign.center,
              onOk: () {
                SystemNavigator.pop();
              });
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstants.kpaf_icon,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  const Text(
                    StringConstants.InstaPredictor,
                    style: TextStyleConstants.headingTextStyle,
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: TextFieldReusable(
                            hinttext: StringConstants.name,
                            controller: _nameController,
                            isEmpty: StringConstants.isNameEmpty,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: TextFieldReusable(
                            hinttext: StringConstants.mobileNumber,
                            controller: _mobileNumberController,
                            isEmpty: StringConstants.isMobileNumberEmpty,
                            isValid: StringConstants.isMobileNumberValid,
                            textType: TextInputType.number,
                            maxlength: 10,
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailIdController,
                            validator: (value) {
                              print(value);
                              return registrationProvider.validateEmail(value);
                            },
                            decoration: const InputDecoration(
                              hintText: StringConstants.emailId,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              top: MediaQuery.of(context).size.height * 0.025),
                          child: RegisterButton(
                            buttonText: StringConstants.register,
                            buttontextcolor: Colors.black,
                            width: MediaQuery.of(context).size.width * 0.9,
                            onButtonPressed: () async {
                              registrationProvider.validate(
                                  _formkey,
                                  _nameController.text.toString(),
                                  _emailIdController.text.toString(),
                                  _mobileNumberController.text.toString(),
                                  "Paid",
                                  context);
                            },
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            registrationProvider.clearData(_nameController);
                            registrationProvider
                                .clearData(_mobileNumberController);
                            registrationProvider.clearData(_emailIdController);
                          },
                          child: const Text(
                            StringConstants.clear,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
