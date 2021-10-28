import 'package:json_annotation/json_annotation.dart';
part 'create_acount.g.dart';

@JsonSerializable()
class CreateAcount {
  int? idConfeitaria;
  String? nome;
  String? nomeFantasia;
  String? cnpj;
  String? cep;
  String? rua;
  String? numero;
  String? email;
  String? usuario;
  String? senha;

  CreateAcount({
    this.idConfeitaria,
    this.nome,
    this.nomeFantasia,
    this.cnpj,
    this.cep,
    this.rua,
    this.numero,
    this.email,
    this.usuario,
    this.senha,
  });

  Map<String, dynamic> toJson() => _$CreateAcountToJson(this);
}
