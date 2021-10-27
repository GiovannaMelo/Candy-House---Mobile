import 'package:bloc/bloc.dart';
import 'package:candy_house/modulos/home/service/home_service.dart';
import 'package:candy_house/shared/model/item_ingredientes.dart';
import 'package:equatable/equatable.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStates.loading());

  getItens() async {
    emit(HomeStates.loading());
    final data = await HomeService().getHomeItem();
    emit(HomeStates.success(data));
  }

   deleteItem(id) async{
    emit(HomeStates.loading());
    await HomeService().deleteIngredientesItem(id);
    await getItens();
  }
}