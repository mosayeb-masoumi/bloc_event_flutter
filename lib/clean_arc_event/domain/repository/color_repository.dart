import '../entity/color_entity.dart';

abstract class ColorRepository {
  Future<List<ColorEntity>> getColors();
}