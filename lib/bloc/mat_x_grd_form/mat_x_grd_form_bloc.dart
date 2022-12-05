import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'mat_x_grd_form_event.dart';
part 'mat_x_grd_form_state.dart';

class MatXGrdFormBloc extends Bloc<GradosFormEvent, MatXGrdFormState> {
  MatXGrdFormBloc() : super(const MatXGrdFormInitialState()) {
    on<ModificarFormMatXGrd>((event, emit) {
      emit(MatXGrdFormModifyState(
        event.lastState,
        idGrd: event.idGrd,
        idMat: event.idMat,
        id: event.id,
      ));
    });
  }
}
