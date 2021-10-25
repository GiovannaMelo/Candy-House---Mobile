// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeItem _$HomeItemFromJson(Map<String, dynamic> json) {
  return HomeItem(
    json['idEstoque'] as int,
    json['nome'] as String,
    DateTime.parse(json['dataValidade'] as String),
    (json['gramas'] as num).toDouble(),
    (json['totalGramas'] as num).toDouble(),
    json['quantidade'] as int,
    (json['valorCompra'] as num).toDouble(),
  );
}

Map<String, dynamic> _$HomeItemToJson(HomeItem instance) => <String, dynamic>{
      'idEstoque': instance.idEstoque,
      'nome': instance.nome,
      'dataValidade': instance.dataValidade.toIso8601String(),
      'gramas': instance.gramas,
      'totalGramas': instance.totalGramas,
      'quantidade': instance.quantidade,
      'valorCompra': instance.valorCompra,
    };
