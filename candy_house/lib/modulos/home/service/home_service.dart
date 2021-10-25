import 'package:candy_house/modulos/home/model/item_home.dart';
import 'package:dio/dio.dart';

class HomeService {
 Future<List<HomeItem>> getHomeItem() async {
    final data = await Dio().get('http://10.0.2.2:8080/estoque');
    print(data);
    return List.from(data.data).map((e) => HomeItem.fromJson(e)).toList();
  }
}
