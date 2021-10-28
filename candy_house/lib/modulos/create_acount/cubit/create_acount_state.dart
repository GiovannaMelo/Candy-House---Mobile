
import 'package:equatable/equatable.dart';

enum CreateAcountStatus { loading, success, error, init }

class CreateAcountStates extends Equatable{
  @override
  List<Object?> get props => [status];
  final CreateAcountStatus status;

    const CreateAcountStates._({
    this.status: CreateAcountStatus.loading,
  });

  CreateAcountStates.loading() : this._(status: CreateAcountStatus.loading);

  CreateAcountStates.success() : this._(status: CreateAcountStatus.success);

  CreateAcountStates.init() : this._(status: CreateAcountStatus.init);

  CreateAcountStates.error() : this._(status : CreateAcountStatus.error);

}