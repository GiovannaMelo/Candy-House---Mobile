import 'package:candy_house/shared/model/item_produto.dart';
import 'package:dio/dio.dart';

class ProdutosService {
  Future<List<ProdutosItem>> getProdutosItem() async {
    final data = await Dio().get('http://10.0.2.2:8080/produto');
    print(data);
    return List.from(data.data).map((e) => ProdutosItem.fromJson(e)).toList();
  }

  Future<void> deleteIngredientesItem(int id) async {
    final data = await Dio().delete('http://10.0.2.2:8080/produto/$id');
    print(data);
  }
}
