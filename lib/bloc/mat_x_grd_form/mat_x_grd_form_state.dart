part of 'mat_x_grd_form_bloc.dart';

@immutable
abstract class MatXGrdFormState {
  const MatXGrdFormState(
      {required this.idGrd, required this.idMat, this.id = 0});

  final int id;
  final int idGrd;
  final int idMat;
}

class MatXGrdFormInitialState extends MatXGrdFormState {
  const MatXGrdFormInitialState() : super(idGrd: 1, idMat: 1);
}

class MatXGrdFormModifyState extends MatXGrdFormState {
  MatXGrdFormModifyState(MatXGrdFormState lastState,
      {int? idGrd, int? idMat, int? id})
      : super(
          idGrd: idGrd ?? lastState.idGrd,
          idMat: idMat ?? lastState.idMat,
          id: id ?? lastState.id,
        );
}
