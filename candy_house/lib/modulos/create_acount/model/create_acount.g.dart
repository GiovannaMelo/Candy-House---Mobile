// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_acount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAcount _$CreateAcountFromJson(Map<String, dynamic> json) {
  return CreateAcount(
    idConfeitaria: json['idConfeitaria'] as int,
    nome: json['nome'] as String?,
    nomeFantasia: json['nomeFantasia'] as String?,
    cnpj: json['cnpj'] as String?,
    cep: json['cep'] as String?,
    rua: json['rua'] as String?,
    numero: json['numero'] as String?,
    email: json['email'] as String?,
    usuario: json['usuario'] as String?,
    senha: json['senha'] as String?,
  );
}

Map<String, dynamic> _$CreateAcountToJson(CreateAcount instance) =>
    <String, dynamic>{
      'idConfeitaria': instance.idConfeitaria,
      'nome': instance.nome,
      'nomeFantasia': instance.nomeFantasia,
      'cnpj': instance.cnpj,
      'cep': instance.cep,
      'rua': instance.rua,
      'numero': instance.numero,
      'email': instance.email,
      'usuario': instance.usuario,
      'senha': instance.senha,
    };
