import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'matXgrad_form_event.dart';
part 'matXgrad_form_state.dart';

class MatXGradFormBloc extends Bloc<MatXGradFormEvent, MatXGradFormState> {
  MatXGradFormBloc() : super(const MatXGradFormInitialState()) {
    on<ModificarFormMatXGrad>((event, emit) {
      emit(MatXGradFormModifyState(
        event.lastState,
        idGrd: event.idGrd,
        idMat: event.idMat,
        id: event.id,
      ));
    });
  }
}
