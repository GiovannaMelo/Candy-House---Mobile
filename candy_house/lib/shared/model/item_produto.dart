import 'package:json_annotation/json_annotation.dart';
part 'item_produto.g.dart';

@JsonSerializable()
class ProdutosItem {
  final int idProduto;
  final String nome;
  final DateTime dataFabricacao;
  final int qtdFabricada;
  final int qtdDisponivel;
  final double valorFabricacao;
  final double valorVenda;
  @JsonKey(ignore: true)
  late String apiName = nome
      .toLowerCase()
      .replaceAll(" ", "")
      .replaceAll("ç", "c")
      .replaceAll("ã", "a");
  
  ProdutosItem(
    this.idProduto,
    this.nome,
    this.dataFabricacao,
    this.qtdFabricada,
    this.qtdDisponivel,
    this.valorVenda,
    this.valorFabricacao,
  );

  factory ProdutosItem.fromJson(Map<String, dynamic> json) =>
      _$ProdutosItemFromJson(json);
}
