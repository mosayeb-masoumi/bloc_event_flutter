part of 'desc_bloc.dart';

@immutable
abstract class DescEvent {}


class UpdateDescription extends DescEvent {
  final String desc;
  UpdateDescription(this.desc);
}
