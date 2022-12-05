part of 'matXgrad_form_bloc.dart';

@immutable
abstract class MatXGradFormState {
  const MatXGradFormState(
      {required this.idGrd, required this.idMat, this.id = 0});

  final int id;
  final int idGrd;
  final int idMat;
}

class MatXGradFormInitialState extends MatXGradFormState {
  const MatXGradFormInitialState() : super(idGrd: 0, idMat: 0);
}

class MatXGradFormModifyState extends MatXGradFormState {
  MatXGradFormModifyState(MatXGradFormState lastState,
      {int? idGrd, int? idMat, int? id})
      : super(
          idGrd: idGrd ?? lastState.idGrd,
          idMat: idMat ?? lastState.idMat,
          id: id ?? lastState.id,
        );
}
