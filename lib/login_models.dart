class LoginModels{
  final String? email;
  final String? password;


const LoginModels({
  this .email,
  this.password,

  
});
  factory LoginModels.fromJson(Map<String, dynamic> json,){
    return LoginModels(
      email: json["email"],
      password: json["password"],
    );
  }
}