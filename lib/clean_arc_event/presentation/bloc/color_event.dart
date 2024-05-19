part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

class GetColors extends ColorEvent {
  GetColors();
}