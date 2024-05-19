import 'package:bloc_with_event/clean_arc_event/domain/entity/color_entity.dart';
import 'package:bloc_with_event/clean_arc_event/domain/repository/color_repository.dart';

class ColorUseCase extends ColorRepository {
  final ColorRepository _repository;
  ColorUseCase(this._repository);

  @override
  Future<List<ColorEntity>> getColors() {
   return _repository.getColors();
  }

}