// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Materia _$MateriaFromJson(Map<String, dynamic> json) => Materia(
      nombre: json['mat_nombre'] as String? ?? "",
      id: json['mat_id'] as int? ?? 0,
    );

Map<String, dynamic> _$MateriaToJson(Materia instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
    };
