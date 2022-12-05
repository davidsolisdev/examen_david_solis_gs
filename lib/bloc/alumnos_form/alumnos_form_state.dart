part of 'alumnos_form_bloc.dart';

@immutable
abstract class AlumnosFormState {
  const AlumnosFormState({
    required this.nombre,
    required this.codigo,
    required this.edad,
    required this.sexo,
    required this.idGrd,
    required this.observacion,
    this.id = 0,
  });

  final int id;
  final String codigo;
  final String nombre;
  final int edad;
  final String sexo;
  final int idGrd;
  final String observacion;
}

class AlumnosFormInitialState extends AlumnosFormState {
  const AlumnosFormInitialState()
      : super(
          codigo: "",
          nombre: "",
          edad: 0,
          sexo: "masculino",
          idGrd: 1,
          observacion: "",
        );
}

class AlumnosFormModifyState extends AlumnosFormState {
  AlumnosFormModifyState(
    AlumnosFormState lastState, {
    String? codigo,
    String? nombre,
    int? id,
    int? edad,
    String? sexo,
    int? idGrd,
    String? observacion,
  }) : super(
          id: id ?? lastState.id,
          nombre: nombre ?? lastState.nombre,
          codigo: codigo ?? lastState.codigo,
          edad: edad ?? lastState.edad,
          sexo: sexo ?? lastState.sexo,
          idGrd: idGrd ?? lastState.idGrd,
          observacion: observacion ?? lastState.observacion,
        );
}
