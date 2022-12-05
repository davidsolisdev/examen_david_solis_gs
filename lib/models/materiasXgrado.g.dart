// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materiasXgrado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MateriasXGrado _$MateriasXGradoFromJson(Map<String, dynamic> json) =>
    MateriasXGrado(
      idGrd: json['mxg_id_grd'] as int? ?? 0,
      idMat: json['mxg_id_mat'] as int? ?? 0,
      id: json['mxg_id'] as int? ?? 0,
    );

Map<String, dynamic> _$MateriasXGradoToJson(MateriasXGrado instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idGrd': instance.idGrd,
      'idMat': instance.idMat,
    };
