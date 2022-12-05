part of 'matXgrad_form_bloc.dart';

abstract class MatXGradFormEvent {}

class ModificarFormMatXGrad extends MatXGradFormEvent {
  ModificarFormMatXGrad({
    required this.lastState,
    required this.idMat,
    required this.idGrd,
    this.id,
  });

  MatXGradFormState lastState;
  int? id;
  int idGrd;
  int idMat;
}
