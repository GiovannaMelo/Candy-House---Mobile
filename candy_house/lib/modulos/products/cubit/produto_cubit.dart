import 'package:candy_house/modulos/products/service/produto_service.dart';
import 'package:candy_house/modulos/products/cubit/produtos_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProdutosCubit extends Cubit<ProdutosStates> {
  ProdutosCubit() : super(ProdutosStates.loading());

  getItens() async {
    final data = await ProdutosService().getProdutosItem();
    emit(ProdutosStates.success(data));
  }
    deleteItem(id) async {
      emit(ProdutosStates.loading());
      await ProdutosService().deleteIngredientesItem(id);
      await getItens();
    }
  }
