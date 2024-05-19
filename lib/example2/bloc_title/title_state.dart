part of 'title_bloc.dart';

@immutable
abstract class TitleState {
  const TitleState();
}

class TitleInitial extends TitleState {
  const TitleInitial();
}

class TitleLoading extends TitleState {
  const TitleLoading();
}


class TitleLoaded extends TitleState {
  final String titleResult;

  const TitleLoaded(this.titleResult);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleLoaded &&
          runtimeType == other.runtimeType &&
          titleResult == other.titleResult;

  @override
  int get hashCode => titleResult.hashCode;
}



class TitleError extends TitleState {
  final String titleError;

  const TitleError(this.titleError);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleError &&
          runtimeType == other.runtimeType &&
          titleError == other.titleError;

  @override
  int get hashCode => titleError.hashCode;
}


//---------------------------------------


class TitleDescInitial extends TitleState {
  const TitleDescInitial();
}

class TitleDescLoading extends TitleState {
  const TitleDescLoading();
}

class TitleDescLoaded extends TitleState {
  final String titleDescResult;
  const TitleDescLoaded(this.titleDescResult);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TitleDescLoaded &&
              runtimeType == other.runtimeType &&
              titleDescResult == other.titleDescResult;

  @override
  int get hashCode => titleDescResult.hashCode;
}

class TitleDescError extends TitleState {
  final String titleDescError;
  const TitleDescError(this.titleDescError);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleDescError &&
          runtimeType == other.runtimeType &&
          titleDescError == other.titleDescError;

  @override
  int get hashCode => titleDescError.hashCode;
}
