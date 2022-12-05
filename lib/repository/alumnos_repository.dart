import 'package:examen_david_solis_gs/models/alumno.dart';
import 'package:examen_david_solis_gs/models/respfetch.dart';
import 'package:examen_david_solis_gs/providers/db_provider.dart';

class AlumnosRepository {
  static Future<ResFetch<List<Alumno>>> getAlumnos(
    String? codigoNombre,
    int? edad,
    String? sexo,
  ) async {
    var db = await DBProvider.db.database;

    String where = '';

    if (codigoNombre != null) {
      where += 'alm_codigo + alm_nombre LIKE $codigoNombre';
    }
    if (codigoNombre != null && edad != null) where += ' AND ';
    if (edad != null) where += 'alm_edad = $edad';
    if (edad != null && sexo != null) where += ' AND ';
    if (sexo != null) where += 'alm_sexo = $sexo';

    List<Map<String, dynamic>> listaJson =
        codigoNombre != null && edad != null && sexo != null
            ? await db.query('alm_alumno', where: where)
            : await db.query('alm_alumno');

    return ResFetch(status: 200, data: Alumno.fromJsonList(listaJson));
  }

  static Future<ResFetch<int>> postAlumno(Alumno alumno) async {
    var db = await DBProvider.db.database;

    final id = await db.insert('alm_alumno', {
      'alm_codigo': alumno.codigo,
      'alm_nombre': alumno.nombre,
      'alm_edad': alumno.edad,
      'alm_sexo': alumno.sexo,
      'alm_id_grd': alumno.idGrd,
      'alm_observacion': alumno.observacion
    });

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> putAlumno(Alumno alumno) async {
    var db = await DBProvider.db.database;

    final id = await db.update('alm_alumno', where: 'alm_id = ${alumno.id}', {
      'alm_codigo': alumno.codigo,
      'alm_nombre': alumno.nombre,
      'alm_edad': alumno.edad,
      'alm_sexo': alumno.sexo,
      'alm_id_grd': alumno.idGrd,
      'alm_observacion': alumno.observacion
    });

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> deleteAlumno(int id) async {
    var db = await DBProvider.db.database;

    final identificador =
        await db.delete('alm_alumno', where: 'alm_id = ?', whereArgs: [id]);

    return ResFetch(status: 200, data: identificador);
  }
}
