// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    usuario: json['usuario'] as String?,
    senha: json['senha'] as String?,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'usuario': instance.usuario,
      'senha': instance.senha,
    };
