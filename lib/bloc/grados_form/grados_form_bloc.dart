import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'grados_form_event.dart';
part 'grados_form_state.dart';

class GradosFormBloc extends Bloc<GradosFormEvent, GradosFormState> {
  GradosFormBloc() : super(const GradosFormInitialState()) {
    on<ModificarFormGrados>((event, emit) {
      emit(GradosFormModifyState(
        event.lastState,
        nombre: event.nombre,
        id: event.id,
      ));
    });
  }
}
