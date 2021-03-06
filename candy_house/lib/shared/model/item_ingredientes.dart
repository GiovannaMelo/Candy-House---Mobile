import 'package:json_annotation/json_annotation.dart';
part 'item_ingredientes.g.dart';

@JsonSerializable()
class IngredientesItem {
   int? idEstoque;
   String? nome;
   DateTime? dataValidade;
   String? unidadeMedida;
   double? qtdUtilizada;
   double? totalUtilizado;
   int? quantidade;
   double? valorCompra;
  @JsonKey(ignore: true)
  late String apiName = nome!
      .toLowerCase()
      .replaceAll(" ", "")
      .replaceAll("ç", "c")
      .replaceAll("ã", "a");

  IngredientesItem(
    {this.idEstoque,
    this.nome,
    this.dataValidade,
    this.unidadeMedida,
    this.qtdUtilizada,
    this.totalUtilizado,
    this.quantidade,
    this.valorCompra,}
  );

  factory IngredientesItem.fromJson(Map<String, dynamic> json) =>
      _$IngredientesItemFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientesItemToJson(this);
}
