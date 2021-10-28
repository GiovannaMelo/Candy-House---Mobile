import 'package:bloc/bloc.dart';
import 'package:candy_house/modulos/login/cubit/login_states.dart';
import 'package:candy_house/modulos/login/model/login.dart';
import 'package:candy_house/modulos/login/service/login_service.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates.init());

  postLogin(Login login) async {
    try {
      emit(LoginStates.loading());
      await LoginService().postLogin(login);
      emit(LoginStates.success());
    } catch (e) {
      emit(LoginStates.error());
    }
  }
}
