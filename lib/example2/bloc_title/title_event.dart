part of 'title_bloc.dart';

@immutable
abstract class TitleEvent {}


class UpdateTitle extends TitleEvent {
  final String title;
  UpdateTitle(this.title);
}

// class UpdateDescription extends TitleEvent {
//   final String desc;
//   UpdateDescription(this.desc);
// }