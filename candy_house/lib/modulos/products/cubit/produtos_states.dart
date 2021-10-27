import 'package:candy_house/shared/model/item_produto.dart';
import 'package:equatable/equatable.dart';

enum ProdutosStatus { loading, success, error }

class ProdutosStates extends Equatable {
  @override
  List<Object?> get props => [status, itens];
  final ProdutosStatus status;
  final List<ProdutosItem> itens;

  const ProdutosStates._(
      {this.status: ProdutosStatus.loading, this.itens: const []});

  const ProdutosStates.loading() : this._(status: ProdutosStatus.loading);
  const ProdutosStates.success(List<ProdutosItem> list)
      : this._(status: ProdutosStatus.success, itens: list);
  const ProdutosStates.error() : this._(status: ProdutosStatus.error);
}
