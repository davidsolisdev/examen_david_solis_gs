import 'package:json_annotation/json_annotation.dart';

part 'materia.g.dart';

@JsonSerializable()
class Materia {
  final int id;
  final String nombre;

  const Materia({required this.nombre, this.id = 0});

  factory Materia.fromJson(Map<String, dynamic> json) =>
      _$MateriaFromJson(json);

  static List<Materia> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((j) => _$MateriaFromJson(j)).toList();

  Map<String, dynamic> toJson() => _$MateriaToJson(this);

  static List<Map<String, dynamic>> toJsonList(List<Materia> list) =>
      list.map((j) => _$MateriaToJson(j)).toList();
}
