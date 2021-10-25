part of 'home_cubit.dart';

enum HomeStatus { loading, success, error }

class HomeStates extends Equatable {
  @override
  List<Object?> get props => [status, itens];
  final HomeStatus status;
  final List<HomeItem> itens;

  const HomeStates._({this.status: HomeStatus.loading, this.itens: const []});

  const HomeStates.loading() : this._(status: HomeStatus.loading);
  const HomeStates.success(List<HomeItem> list)
      : this._(status: HomeStatus.success, itens: list);
  const HomeStates.error() : this._(status: HomeStatus.error);
}
