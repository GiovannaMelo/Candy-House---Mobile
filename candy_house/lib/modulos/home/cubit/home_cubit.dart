import 'package:bloc/bloc.dart';
import 'package:candy_house/modulos/home/model/item_home.dart';
import 'package:candy_house/modulos/home/service/home_service.dart';
import 'package:equatable/equatable.dart';
part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStates.loading());

  getItens() async {
    final data = await HomeService().getHomeItem();
    emit(HomeStates.success(data));
  }
}