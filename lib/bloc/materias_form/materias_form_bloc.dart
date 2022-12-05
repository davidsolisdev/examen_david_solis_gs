import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'materias_form_event.dart';
part 'materias_form_state.dart';

class MateriasFormBloc extends Bloc<MateriasFormEvent, MateriasFormState> {
  MateriasFormBloc() : super(const MateriasFormInitialState()) {
    on<ModificarFormMaterias>((event, emit) {
      emit(MateriasFormModifyState(
        event.lastState,
        nombre: event.nombre,
        id: event.id,
      ));
    });
  }
}
