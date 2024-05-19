import 'package:bloc_with_event/clean_arc_event/data/data_source/color_data_source.dart';
import 'package:bloc_with_event/clean_arc_event/data/dto/color_dto.dart';
import 'package:bloc_with_event/clean_arc_event/domain/entity/color_entity.dart';
import 'package:bloc_with_event/clean_arc_event/domain/repository/color_repository.dart';

class ColorRepositoryImpl extends ColorRepository {

  final ColorDataSource _dataSource;
  ColorRepositoryImpl(this._dataSource);

  @override
  Future<List<ColorEntity>> getColors() async {

    List<ColorsDTO> colorsDto = await _dataSource.getColors();
    List<ColorEntity> colorList = colorsDto.map((dto) => ColorEntity.fromDTO(dto)).toList();
    return colorList ;
  }

}