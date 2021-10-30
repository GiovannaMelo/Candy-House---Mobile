import 'package:candy_house/modulos/ingredientes/service/ingredientes_service.dart';
import 'package:candy_house/shared/model/item_ingredientes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'ingredientes_states.dart';

class IngredientesCubit extends Cubit<IngredientesStates> {
  IngredientesCubit() : super(IngredientesStates.loading());

  getItens() async {
    final data = await IngredientesService().getIngredientesItem();
    emit(IngredientesStates.success(data));
  }

  deleteItem(id) async {
    emit(IngredientesStates.loading());
    await IngredientesService().deleteIngredientesItem(id);
    await getItens();
  }

  postCreate(IngredientesItem ingredientes) async {
    try {
      emit(IngredientesStates.loading());
      await IngredientesService().postCreateIngrediente(ingredientes);
      final data = await IngredientesService().getIngredientesItem();
      emit(IngredientesStates.create(data));
      await getItens();
    } catch (e) {
      emit(IngredientesStates.error());
    }
  }
}
