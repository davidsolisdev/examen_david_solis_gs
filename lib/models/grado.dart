import 'package:json_annotation/json_annotation.dart';

part 'grado.g.dart';

@JsonSerializable()
class Grado {
  final int id;
  final String nombre;

  const Grado({required this.nombre, this.id = 0});

  factory Grado.fromJson(Map<String, dynamic> json) => _$GradoFromJson(json);

  static List<Grado> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((j) => _$GradoFromJson(j)).toList();

  Map<String, dynamic> toJson() => _$GradoToJson(this);

  static List<Map<String, dynamic>> toJsonList(List<Grado> list) =>
      list.map((j) => _$GradoToJson(j)).toList();
}
