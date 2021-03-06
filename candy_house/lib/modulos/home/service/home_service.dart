import 'package:candy_house/shared/model/item_ingredientes.dart';
import 'package:dio/dio.dart';

class HomeService {
  Future<List<IngredientesItem>> getHomeItem() async {
    final data = await Dio().get('http://10.0.2.2:8080/estoque');
    print(data);
    return List.from(data.data)
        .map((e) => IngredientesItem.fromJson(e))
        .toList();
  }

  Future<void> deleteIngredientesItem(int id) async {
    final data = await Dio().delete('http://10.0.2.2:8080/estoque/$id');
    print(data);
  }
}
