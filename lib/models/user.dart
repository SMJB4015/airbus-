
class User{
  String id ;
  String userName ;
  String email ;
  bool role ;
  User({required this.id,required this.userName,required this.email,required this.role}) ;
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userName: json["userName"],
    email: json["email"],
    role: json["role"]

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "email":email,
    "role": role
  };
}
class News{
  String id ;
  String title ;
  String context ;
  String date ;
  News({required this.id,required this.title,required this.context,required this.date}) ;
  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    title: json["title"],
    context: json["context"],
    date: json["date"],

  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "context":context,
    "date":date,
  };
}
