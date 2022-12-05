/*import 'package:examen_david_solis_gs/models/alumno.dart';
import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/models/materia.dart';
import 'package:examen_david_solis_gs/models/materiasXgrado.dart';
import 'package:examen_david_solis_gs/models/materias_x_alumno.dart';
import 'package:examen_david_solis_gs/providers/db_provider.dart';
import 'package:examen_david_solis_gs/repository/alumnos_repository.dart';
import 'package:flutter/material.dart';

class TablaAlumnos extends StatefulWidget {
  TablaAlumnos({required this.alumnos, Key? key}) : super(key: key);

  List<Alumno> alumnos;

  @override
  State<TablaAlumnos> createState() => _TablaAlumnosState();
}

class _TablaAlumnosState extends State<TablaAlumnos> {
  List<MateriasXAlumno> items = [];

  @override
  void initState() {
    super.initState();
    llenadoData(widget.alumnos);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      sortColumnIndex: 0,
      sortAscending: true,
      columns: const [
        DataColumn(label: Text('Id'), tooltip: 'id'),
        DataColumn(label: Text('Alumno'), tooltip: 'alumno'),
        DataColumn(label: Text('Grado'), tooltip: 'grado'),
        DataColumn(label: Text('Materias'), tooltip: 'materias'),
      ],
      rows: items
          .map((i) => DataRow(cells: [
                DataCell(Text('${i.id}')),
                DataCell(Text(i.nombre)),
                DataCell(Text(i.nombre)),
                DataCell(Text(i.materias)),
              ]))
          .toList(),
    );
  }

  Future<List<Alumno>> _getAlumnos() async {
    return (await AlumnosRepository.getAlumnos(null, null, null)).data!;
  }

  Future<String> getNameGrado(int id) async {
    var db = await DBProvider.db.database;
    var list = await db.query('grd_grado', where: 'grd_id = $id');

    return Grado.fromJson(list[0]).nombre;
  }

  Future<List<int>> getMateriasGrado(int id) async {
    var db = await DBProvider.db.database;
    var list = await db.query('mxg_materiasxgrado', where: 'mxg_id_grd = $id');

    return MateriasXGrado.fromJsonList(list).map((mxg) => mxg.idMat).toList();
  }

  Future<String> getNameMateria(int id) async {
    var db = await DBProvider.db.database;
    var list = await db.query('mat_materia', where: 'mat_id = $id');

    return Materia.fromJson(list[0]).nombre;
  }

  Future llenadoData() async {
    List<MateriasXAlumno> itemss = [];
    for (var i = 0; i < alumnos.length; i++) {
      var grado = await getNameGrado(alumnos[i].idGrd);
      var listIdMaterias = await getMateriasGrado(alumnos[i].idGrd);
      var materias = '';

      for (var j = 0; j < listIdMaterias.length; j++) {
        var materia = await getNameMateria(listIdMaterias[j]);

        materias += materia;
      }

      itemss.add(MateriasXAlumno(
        id: alumnos[i].id,
        nombre: alumnos[i].nombre,
        grado: grado,
        materias: materias,
      ));
    }

    items = itemss;
    setState(() {});
  }
}*/