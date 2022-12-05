part of 'materias_form_bloc.dart';

abstract class MateriasFormEvent {}

class ModificarFormMaterias extends MateriasFormEvent {
  ModificarFormMaterias(
      {required this.lastState, required this.nombre, this.id});

  MateriasFormState lastState;
  int? id;
  String nombre;
}
