import 'package:candy_house/modulos/create_acount/model/create_acount.dart';
import 'package:dio/dio.dart';

class CreateAcountService {
  Future<void> postCreateAcount(CreateAcount create) async {
    print(create.toJson());
    final data = await Dio()
        .post('http://10.0.2.2:8080/confeitaria/save', data: create.toJson());
    print(data);
  }
}
