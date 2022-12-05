import 'package:bloc/bloc.dart';
import 'package:examen_david_solis_gs/models/alumno.dart';
import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/models/materia.dart';
import 'package:examen_david_solis_gs/models/materiasXgrado.dart';
import 'package:examen_david_solis_gs/repository/alumnos_repository.dart';
import 'package:examen_david_solis_gs/repository/grados_repository.dart';
import 'package:examen_david_solis_gs/repository/mat_x_grd_repository.dart';
import 'package:examen_david_solis_gs/repository/materias_repository.dart';
import 'package:flutter/foundation.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalInitialState()) {
    on<ChangeTheme>((event, emit) {
      emit(GlobalModifyState(event.lastState, theme: event.theme));
    });

    on<ChangeIndexBottomBar>((event, emit) {
      emit(GlobalModifyState(event.lastState, indexBottomBar: event.index));
    });

    on<GetMaterias>((event, emit) async {
      var materias = await MateriasRepository.getMaterias(event.nombre);
      emit(GlobalModifyState(
        event.lastState,
        materias: materias.data,
      ));
    });

    on<GetGrados>((event, emit) async {
      var grados = await GradosRepository.getGrados(event.nombre);
      emit(GlobalModifyState(
        event.lastState,
        grados: grados.data,
      ));
    });

    on<GetAlumnos>((event, emit) async {
      var alumnos = await AlumnosRepository.getAlumnos(
        event.codigoNombre,
        event.edad,
        event.sexo,
      );

      emit(GlobalModifyState(
        event.lastState,
        alumnos: alumnos.data,
      ));
    });

    on<GetMatXGrd>((event, emit) async {
      var grados = await MatXGrdRepository.getMatXGrd(null);
      emit(GlobalModifyState(
        event.lastState,
        materiasXgrado: grados.data,
      ));
    });
  }
}
