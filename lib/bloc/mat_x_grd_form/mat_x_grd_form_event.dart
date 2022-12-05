part of 'mat_x_grd_form_bloc.dart';

abstract class GradosFormEvent {}

class ModificarFormMatXGrd extends GradosFormEvent {
  ModificarFormMatXGrd({
    required this.lastState,
    this.idGrd,
    this.idMat,
    this.id,
  });

  MatXGrdFormState lastState;
  int? id;
  int? idGrd;
  int? idMat;
}
