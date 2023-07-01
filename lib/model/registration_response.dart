class RegistrationResponse {
   String? message;
  String? status;
  String? id;

  RegistrationResponse({this.message, this.status, this.id});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['id'] = this.id;
    return data;
  }
}