part of 'materias_form_bloc.dart';

@immutable
abstract class MateriasFormState {
  const MateriasFormState({required this.nombre, this.id = 0});

  final int id;
  final String nombre;
}

class MateriasFormInitialState extends MateriasFormState {
  const MateriasFormInitialState() : super(nombre: "");
}

class MateriasFormModifyState extends MateriasFormState {
  MateriasFormModifyState(MateriasFormState lastState,
      {String? nombre, int? id})
      : super(nombre: nombre ?? lastState.nombre, id: id ?? lastState.id);
}
