// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_produto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutosItem _$ProdutosItemFromJson(Map<String, dynamic> json) {
  return ProdutosItem(
    json['idProduto'] as int,
    json['nome'] as String,
    DateTime.parse(json['dataFabricacao'] as String),
    json['qtdFabricada'] as int,
    json['qtdDisponivel'] as int,
    (json['valorVenda'] as num).toDouble(),
    (json['valorFabricacao'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ProdutosItemToJson(ProdutosItem instance) =>
    <String, dynamic>{
      'idProduto': instance.idProduto,
      'nome': instance.nome,
      'dataFabricacao': instance.dataFabricacao.toIso8601String(),
      'qtdFabricada': instance.qtdFabricada,
      'qtdDisponivel': instance.qtdDisponivel,
      'valorFabricacao': instance.valorFabricacao,
      'valorVenda': instance.valorVenda,
    };
