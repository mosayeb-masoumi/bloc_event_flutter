import '../../data/dto/color_dto.dart';

class ColorEntity {
  final String name ;
  ColorEntity(this.name);

  ColorEntity.fromDTO(ColorsDTO dto)
  :name = dto.name;
}