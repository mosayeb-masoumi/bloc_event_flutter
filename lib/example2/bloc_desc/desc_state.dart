part of 'desc_bloc.dart';

@immutable
abstract class DescState {
  const DescState();
}


class DescriptionInitial extends DescState {
  const DescriptionInitial();
}

class DescriptionLoading extends DescState {
  const DescriptionLoading();
}

class DescriptionLoaded extends DescState {
  final String descResult;
  const DescriptionLoaded(this.descResult);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DescriptionLoaded &&
              runtimeType == other.runtimeType &&
              descResult == other.descResult;

  @override
  int get hashCode => descResult.hashCode;
}

class DescriptionError extends DescState {
  final String descError;
  const DescriptionError(this.descError);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DescriptionError &&
              runtimeType == other.runtimeType &&
              descError == other.descError;

  @override
  int get hashCode => descError.hashCode;
}

