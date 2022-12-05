import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/models/respfetch.dart';
import 'package:examen_david_solis_gs/providers/db_provider.dart';

class GradosRepository {
  static Future<ResFetch<List<Grado>>> getGrados(String? idNombre) async {
    var db = await DBProvider.db.database;

    List<Map<String, dynamic>> listaJson;

    if (idNombre != null && idNombre.trim().isNotEmpty) {
      listaJson = await db.query(
        'grd_grado',
        where: 'grd_id + grd_nombre LIKE $idNombre',
      );
    }

    listaJson = await db.query('grd_grado');

    return ResFetch(status: 200, data: Grado.fromJsonList(listaJson));
  }

  static Future<ResFetch<int>> postGrado(String nombre) async {
    var db = await DBProvider.db.database;

    final id = await db.insert('grd_grado', {
      'grd_nombre': nombre,
    });

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> putGrado(Grado materia) async {
    var db = await DBProvider.db.database;

    final id = await db.update('grd_grado', where: 'grd_id = ?', whereArgs: [
      materia.id
    ], {
      'grd_nombre': materia.nombre,
    });

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> deleteGrado(int id) async {
    var db = await DBProvider.db.database;

    final identificador =
        await db.delete('grd_grado', where: 'grd_id = ?', whereArgs: [id]);

    return ResFetch(status: 200, data: identificador);
  }
}
