// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_ingredientes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientesItem _$IngredientesItemFromJson(Map<String, dynamic> json) {
  return IngredientesItem(
    idEstoque: json['idEstoque'] as int?,
    nome: json['nome'] as String?,
    dataValidade: json['dataValidade'] == null
        ? null
        : DateTime.parse(json['dataValidade'] as String),
    unidadeMedida: json['unidadeMedida'] as String?,
    qtdUtilizada: (json['qtdUtilizada'] as num?)?.toDouble(),
    totalUtilizado: (json['totalUtilizado'] as num?)?.toDouble(),
    quantidade: json['quantidade'] as int?,
    valorCompra: (json['valorCompra'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$IngredientesItemToJson(IngredientesItem instance) =>
    <String, dynamic>{
      'idEstoque': instance.idEstoque,
      'nome': instance.nome,
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'unidadeMedida': instance.unidadeMedida,
      'qtdUtilizada': instance.qtdUtilizada,
      'totalUtilizado': instance.totalUtilizado,
      'quantidade': instance.quantidade,
      'valorCompra': instance.valorCompra,
    };
