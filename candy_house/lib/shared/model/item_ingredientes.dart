import 'package:json_annotation/json_annotation.dart';
part 'item_ingredientes.g.dart';

@JsonSerializable()
class IngredientesItem {
  final int idEstoque;
  final String nome;
  final DateTime dataValidade;
  final double gramas;
  final double totalGramas;
  final int quantidade;
  final double valorCompra;
  @JsonKey(ignore: true)
  late String apiName = nome
      .toLowerCase()
      .replaceAll(" ", "")
      .replaceAll("ç", "c")
      .replaceAll("ã", "a");

  IngredientesItem(
    this.idEstoque,
    this.nome,
    this.dataValidade,
    this.gramas,
    this.totalGramas,
    this.quantidade,
    this.valorCompra,
  );

  factory IngredientesItem.fromJson(Map<String, dynamic> json) =>
      _$IngredientesItemFromJson(json);
}
