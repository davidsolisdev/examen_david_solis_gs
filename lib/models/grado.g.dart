// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grado.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grado _$GradoFromJson(Map<String, dynamic> json) => Grado(
      nombre: json['grd_nombre'] as String? ?? "",
      id: json['grd_id'] as int? ?? 0,
    );

Map<String, dynamic> _$GradoToJson(Grado instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
    };
