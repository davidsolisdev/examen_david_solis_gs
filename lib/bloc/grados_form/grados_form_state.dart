part of 'grados_form_bloc.dart';

@immutable
abstract class GradosFormState {
  const GradosFormState({required this.nombre, this.id = 0});

  final int id;
  final String nombre;
}

class GradosFormInitialState extends GradosFormState {
  const GradosFormInitialState() : super(nombre: "");
}

class GradosFormModifyState extends GradosFormState {
  GradosFormModifyState(GradosFormState lastState, {String? nombre, int? id})
      : super(nombre: nombre ?? lastState.nombre, id: id ?? lastState.id);
}
