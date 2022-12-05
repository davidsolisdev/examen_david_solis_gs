part of 'global_bloc.dart';

@immutable
abstract class GlobalState {
  final String theme;
  final int indexBottomBar;
  final List<Materia> materias;
  final List<Grado> grados;
  final List<Alumno> alumnos;
  final List<MateriasXGrado> materiasXgrado;

  const GlobalState({
    required this.theme,
    required this.indexBottomBar,
    required this.materias,
    required this.grados,
    required this.alumnos,
    required this.materiasXgrado,
  });
}

class GlobalInitialState extends GlobalState {
  GlobalInitialState()
      : super(
          theme: "light",
          indexBottomBar: 0,
          materias: [],
          grados: [],
          alumnos: [],
          materiasXgrado: [],
        );
}

class GlobalModifyState extends GlobalState {
  GlobalModifyState(
    GlobalState lastState, {
    String? theme,
    int? indexBottomBar,
    List<Materia>? materias,
    List<Grado>? grados,
    List<Alumno>? alumnos,
    List<MateriasXGrado>? materiasXgrado,
  }) : super(
          theme: theme ?? lastState.theme,
          indexBottomBar: indexBottomBar ?? lastState.indexBottomBar,
          materias: materias ?? lastState.materias,
          grados: grados ?? lastState.grados,
          alumnos: alumnos ?? lastState.alumnos,
          materiasXgrado: materiasXgrado ?? lastState.materiasXgrado,
        );
}
