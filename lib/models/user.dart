
class User{
  final int? id;
  final String userName;
  final String email;
  final String password;
  User ( {this.id, required this.userName,required this.email, required this.password
  });
  factory User.fromMap(Map<String,dynamic> json)=>User(
      id:json["id"],
      userName: json["username"],
      email: json["email"],
      password: json["password"],
  );
  Map<String,dynamic>toMap()=>{
    "username":userName,
    "email":email,
    "password":password,
  };
}