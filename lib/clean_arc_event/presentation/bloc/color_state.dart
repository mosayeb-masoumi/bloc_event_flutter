part of 'color_bloc.dart';

// @immutable
// abstract class ColorState  {
//   const ColorState();
// }
//
// class ColorInitial extends ColorState {
//   const ColorInitial();
// }
//
// class ColorLoading extends ColorState {
//   const ColorLoading();
// }
//
// class ColorLoaded extends ColorState {
//   final List<ColorEntity> list;
//   const ColorLoaded(this.list);
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ColorLoaded &&
//           runtimeType == other.runtimeType &&
//           list == other.list;
//
//   @override
//   int get hashCode => list.hashCode;
// }
//
// class ColorError extends ColorState {
//   final String error;
//   const ColorError(this.error);
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is ColorError &&
//           runtimeType == other.runtimeType &&
//           error == other.error;
//
//   @override
//   int get hashCode => error.hashCode;
// }


@immutable
abstract class ColorState extends Equatable {
  const ColorState();
}

class ColorInitial extends ColorState {
  @override
  List<Object?> get props => [];
}

class ColorLoading extends ColorState {
  @override
  List<Object?> get props => [];
}

class ColorLoaded extends ColorState {
  final List<ColorEntity> list;
  const ColorLoaded(this.list);

  @override
  List<Object> get props => [list];
}

class ColorError extends ColorState {
  final String error;
  const ColorError(this.error);

  @override
  List<Object> get props => [error];
}