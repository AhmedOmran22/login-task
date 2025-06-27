class LoginRequestModel {
  final String userName;
  final String password;

  LoginRequestModel({required this.userName, required this.password});

  Map<String, dynamic> toJson() => {"username": userName, "password": password};
}
// to login use this username and password ! 
// username: emilys
// password: emilyspass