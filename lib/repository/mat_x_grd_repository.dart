import 'package:examen_david_solis_gs/models/materiasXgrado.dart';
import 'package:examen_david_solis_gs/models/respfetch.dart';
import 'package:examen_david_solis_gs/providers/db_provider.dart';

class MatXGrdRepository {
  static Future<ResFetch<List<MateriasXGrado>>> getMatXGrd(int? id) async {
    var db = await DBProvider.db.database;

    List<Map<String, dynamic>> listaJson;

    if (id != null) {
      listaJson = await db
          .query('mxg_materiasxgrado', where: 'mxg_id = ?', whereArgs: [id]);
    }

    listaJson = await db.query('mxg_materiasxgrado');

    return ResFetch(status: 200, data: MateriasXGrado.fromJsonList(listaJson));
  }

  static Future<ResFetch<int>> postMatXGrd(int idGrd, int idMat) async {
    var db = await DBProvider.db.database;

    final id = await db.insert('mxg_materiasxgrado', {
      'mxg_id_grd': idGrd,
      'mxg_id_mat': idMat,
    });

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> putMatXGrd(MateriasXGrado mxg) async {
    var db = await DBProvider.db.database;

    final id =
        await db.update('mxg_materiasxgrado', where: 'mxg_id = ?', whereArgs: [
      mxg.id
    ], {
      'mxg_id_grd': mxg.idGrd,
      'mxg_id_mat': mxg.idMat,
    });

    return ResFetch(status: 200, data: id);
  }

  static Future<ResFetch<int>> deleteMatXGrd(int id) async {
    var db = await DBProvider.db.database;

    final identificador = await db
        .delete('mxg_materiasxgrado', where: 'mxg_id = ?', whereArgs: [id]);

    return ResFetch(status: 200, data: identificador);
  }
}
