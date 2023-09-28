class User {
  late int id;
  late String fullName;
  late String phoneNumber;
  late String? verificationCode;
  late String token;
  late String password;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    token = json['token'];
    verificationCode = json['verificationCode'];
  }
}
