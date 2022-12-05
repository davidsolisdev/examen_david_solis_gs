import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'alumnos_form_event.dart';
part 'alumnos_form_state.dart';

class AlumnosFormBloc extends Bloc<GradosFormEvent, AlumnosFormState> {
  AlumnosFormBloc() : super(const AlumnosFormInitialState()) {
    on<ModificarFormAlumnos>((event, emit) {
      emit(AlumnosFormModifyState(
        event.lastState,
        id: event.id,
        codigo: event.codigo,
        nombre: event.nombre,
        edad: event.edad,
        sexo: event.sexo,
        idGrd: event.idGrd,
        observacion: event.observacion,
      ));
    });
  }
}
