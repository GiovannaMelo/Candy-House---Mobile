import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';
@JsonSerializable()
class Login {
  String? usuario;
  String? senha;

  Login({this.usuario, this.senha});

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
