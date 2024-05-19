import 'package:bloc_with_event/clean_arc_event/data/dto/color_dto.dart';

abstract class ColorDataSource {
  Future<List<ColorsDTO>> getColors();
}

class IColorDataSource extends ColorDataSource {
  @override
  Future<List<ColorsDTO>> getColors() async {
    await Future.delayed(const Duration(seconds: 2));
    List<ColorsDTO> list = [
      ColorsDTO("blue", "it has blue color"),
      ColorsDTO("red", "it has red color"),
      ColorsDTO("green", "it has green color"),
    ];

    return list;
  }
}
