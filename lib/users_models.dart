class UsersModels{
  final String? username;
  final String? email;
  final String? id;

const UsersModels({
  this .username,
  this.email,
  this.id,
  
});
  factory UsersModels.fromJson(Map<String, dynamic> json,){
    return UsersModels(
      username: json["username"],
      id: json["id"],
      email: json["email"],
    );
  }
}