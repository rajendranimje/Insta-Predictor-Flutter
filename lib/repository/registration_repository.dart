import 'package:InstaPredictor/data/api_client.dart';
import 'package:InstaPredictor/model/registration_response.dart';
import 'package:InstaPredictor/res/constants/api_constants.dart';

class RegistrationRepository {
  final _baseClient = BaseApiClient();

  Future<RegistrationResponse> getRegistrationDetails(
      String name, String emailId, String mobileNo, String type) async {
    final response = await _baseClient.getCall(ApiConstants.registerEndPoint, {
      "name": name,
      "email_id": emailId,
      "mobile_no": mobileNo,
      "type": type
    });
    return RegistrationResponse.fromJson(response);
  }
}
