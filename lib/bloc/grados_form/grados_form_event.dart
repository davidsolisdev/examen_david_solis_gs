part of 'grados_form_bloc.dart';

abstract class GradosFormEvent {}

class ModificarFormGrados extends GradosFormEvent {
  ModificarFormGrados({required this.lastState, required this.nombre, this.id});

  GradosFormState lastState;
  int? id;
  String nombre;
}
