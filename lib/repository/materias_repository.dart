import 'package:examen_david_solis_gs/models/materia.dart';
import 'package:examen_david_solis_gs/models/respfetch.dart';
import 'package:examen_david_solis_gs/providers/db_provider.dart';

class MateriasRepository {
  static Future<ResFetch<List<Materia>>> getMaterias(String? idNombre) async {
    var db = await DBProvider.db.database;

    List<Map<String, dynamic>> listaJson;

    if (idNombre != null && idNombre.trim().isNotEmpty) {
      listaJson = await db.query(
        'mat_materia',
        where: 'mat_id + mat_nombre LIKE $idNombre',
      );
    }

    listaJson = await db.query('mat_materia');

    return ResFetch(status: 200, data: Materia.fromJsonList(listaJson));
  }

  static Future<ResFetch<int>> postMateria(String nombre) async {
    var db = await DBProvider.db.database;

    final id = await db.insert('mat_materia', {
      'mat_nombre': nombre,
    });

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> putMateria(Materia materia) async {
    var db = await DBProvider.db.database;

    final id = await db.update('mat_materia', where: 'mat_id = ?', whereArgs: [
      materia.id
    ], {
      'mat_nombre': materia.nombre,
    });

    print(materia.id);

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> deleteMateria(int id) async {
    var db = await DBProvider.db.database;

    final identificador =
        await db.delete('mat_materia', where: 'mat_id = ?', whereArgs: [id]);

    return ResFetch(status: 200, data: identificador);
  }
}
