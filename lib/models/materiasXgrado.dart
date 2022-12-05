import 'package:json_annotation/json_annotation.dart';

part 'materiasXgrado.g.dart';

@JsonSerializable()
class MateriasXGrado {
  final int id;
  final int idGrd;
  final int idMat;

  const MateriasXGrado({required this.idGrd, required this.idMat, this.id = 0});

  factory MateriasXGrado.fromJson(Map<String, dynamic> json) =>
      _$MateriasXGradoFromJson(json);

  static List<MateriasXGrado> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((j) => _$MateriasXGradoFromJson(j)).toList();

  Map<String, dynamic> toJson() => _$MateriasXGradoToJson(this);

  static List<Map<String, dynamic>> toJsonList(List<MateriasXGrado> list) =>
      list.map((j) => _$MateriasXGradoToJson(j)).toList();
}
