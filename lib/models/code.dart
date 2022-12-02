class Code{
  String id ;
  String codee;
  String classif;

  Code({ required this.id, required this.codee, required this.classif});
  factory Code.fromJson(Map<String, dynamic> json) => Code(
      id: json["id"],
      codee: json["code"],
      classif: json["classif"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": codee,
    "classif":classif,
  };
}