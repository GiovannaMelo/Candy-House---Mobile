import 'package:candy_house/shared/model/item_ingredientes.dart';
import 'package:dio/dio.dart';

class IngredientesService {
  Future<List<IngredientesItem>> getIngredientesItem() async {
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

  Future<void> postCreateIngrediente(IngredientesItem ingredientes) async {
    print(ingredientes.toJson());
    final data = await Dio()
        .post('http://10.0.2.2:8080/estoque', data: ingredientes.toJson());
    print(data);
  }

}
