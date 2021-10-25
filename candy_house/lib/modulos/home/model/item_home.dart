import 'package:json_annotation/json_annotation.dart';
part 'item_home.g.dart';

@JsonSerializable()
class HomeItem{

  final int idEstoque;
  final String nome;
  final DateTime dataValidade;
  final double gramas;
  final double totalGramas;
  final int quantidade;
  final double valorCompra;

  HomeItem(this.idEstoque, this.nome, this.dataValidade, this.gramas, this.totalGramas, this.quantidade, this.valorCompra);

  factory HomeItem.fromJson(Map<String, dynamic> json) => _$HomeItemFromJson(json);
  
}