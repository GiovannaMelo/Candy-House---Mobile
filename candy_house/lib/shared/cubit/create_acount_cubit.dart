import 'package:bloc/bloc.dart';
import 'package:candy_house/modulos/create_acount/cubit/create_acount_state.dart';
import 'package:candy_house/modulos/create_acount/model/create_acount.dart';
import 'package:candy_house/modulos/create_acount/service/create_acount_service.dart';


class CreateAcountCubit extends Cubit<CreateAcountStates>{

  CreateAcountCubit() : super(CreateAcountStates.init());

  postCreate(CreateAcount create) async {
     try {
      emit(CreateAcountStates.loading());
      await CreateAcountService().postCreateAcount(create);
      emit(CreateAcountStates.success());
    } catch (e) {
      emit(CreateAcountStates.error());
    }
  }
  
}