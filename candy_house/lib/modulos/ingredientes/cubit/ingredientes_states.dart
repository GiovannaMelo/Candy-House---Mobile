part of 'ingredientes_cubit.dart';

enum IngredientesStatus { loading, success, error, create }

class IngredientesStates extends Equatable {
  @override
  List<Object?> get props => [status, itens];
  final IngredientesStatus status;
  final List<IngredientesItem> itens;

  const IngredientesStates._(
      {this.status: IngredientesStatus.loading, this.itens: const []});

  const IngredientesStates.loading()
      : this._(status: IngredientesStatus.loading);
  const IngredientesStates.success(List<IngredientesItem> list)
      : this._(status: IngredientesStatus.success, itens: list);
  const IngredientesStates.error() : this._(status: IngredientesStatus.error);
  const IngredientesStates.create(List<IngredientesItem> list)
      : this._(status: IngredientesStatus.create, itens: list);
}
