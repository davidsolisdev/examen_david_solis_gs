// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumno.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alumno _$AlumnoFromJson(Map<String, dynamic> json) => Alumno(
      codigo: json['alm_codigo'] as String? ?? "",
      nombre: json['alm_nombre'] as String? ?? "",
      edad: json['alm_edad'] as int? ?? 0,
      sexo: json['alm_sexo'] as String? ?? "",
      idGrd: json['alm_id_grd'] as int? ?? 0,
      observacion: json['alm_observacion'] as String? ?? "",
      id: json['alm_id'] as int? ?? 0,
    );

Map<String, dynamic> _$AlumnoToJson(Alumno instance) => <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'nombre': instance.nombre,
      'edad': instance.edad,
      'sexo': instance.sexo,
      'idGrd': instance.idGrd,
      'observacion': instance.observacion,
    };
