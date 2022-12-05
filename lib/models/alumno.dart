import 'package:json_annotation/json_annotation.dart';

part 'alumno.g.dart';

@JsonSerializable()
class Alumno {
  final int id;
  final String codigo;
  final String nombre;
  final int edad;
  final String sexo;
  final int idGrd;
  final String observacion;

  const Alumno({
    required this.codigo,
    required this.nombre,
    required this.edad,
    required this.sexo,
    required this.idGrd,
    required this.observacion,
    this.id = 0,
  });

  factory Alumno.fromJson(Map<String, dynamic> json) => _$AlumnoFromJson(json);

  static List<Alumno> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((j) => _$AlumnoFromJson(j)).toList();

  Map<String, dynamic> toJson() => _$AlumnoToJson(this);

  static List<Map<String, dynamic>> toJsonList(List<Alumno> list) =>
      list.map((j) => _$AlumnoToJson(j)).toList();
}
