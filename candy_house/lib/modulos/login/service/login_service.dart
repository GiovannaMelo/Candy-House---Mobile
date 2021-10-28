import 'package:candy_house/modulos/login/model/login.dart';
import 'package:dio/dio.dart';

class LoginService{

  Future<void> postLogin(Login login) async {
    final data = await Dio().post('http://10.0.2.2:8080/confeitaria/login', data:login.toJson());
    print(data);
  }
}