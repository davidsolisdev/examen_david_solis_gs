part of 'global_bloc.dart';

@immutable
abstract class GlobalEvent {}

class ChangeTheme extends GlobalEvent {
  ChangeTheme(this.lastState, {required this.theme});

  final GlobalState lastState;
  final String theme;
}

class ChangeIndexBottomBar extends GlobalEvent {
  ChangeIndexBottomBar(this.lastState, {required this.index});

  final GlobalState lastState;
  final int index;
}

class GetMaterias extends GlobalEvent {
  GetMaterias(this.lastState, {this.nombre});

  final GlobalState lastState;
  final String? nombre;
}

class GetGrados extends GlobalEvent {
  GetGrados(this.lastState, {this.nombre});

  final GlobalState lastState;
  final String? nombre;
}

class GetMatXGrd extends GlobalEvent {
  GetMatXGrd(this.lastState, {this.id, this.idGrd, this.idMat});

  final GlobalState lastState;
  final int? id;
  final int? idGrd;
  final int? idMat;
}

class GetAlumnos extends GlobalEvent {
  GetAlumnos(
    this.lastState, {
    this.codigoNombre,
    this.edad,
    this.sexo,
  });

  final GlobalState lastState;
  final String? codigoNombre;
  final int? edad;
  final String? sexo;
}
