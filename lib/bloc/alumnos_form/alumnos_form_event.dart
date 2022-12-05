part of 'alumnos_form_bloc.dart';

abstract class GradosFormEvent {}

class ModificarFormAlumnos extends GradosFormEvent {
  ModificarFormAlumnos({
    required this.lastState,
    this.nombre,
    this.codigo,
    this.edad,
    this.sexo,
    this.idGrd,
    this.observacion,
    this.id,
  });

  final AlumnosFormState lastState;
  int? id;
  String? codigo;
  String? nombre;
  int? edad;
  String? sexo;
  int? idGrd;
  String? observacion;
}
