import 'package:examen_david_solis_gs/UI/mobile/widgets/tabla_alumnos.dart';
import 'package:examen_david_solis_gs/models/alumno.dart';
import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/models/materia.dart';
import 'package:examen_david_solis_gs/models/materiasXgrado.dart';
import 'package:examen_david_solis_gs/models/materias_x_alumno.dart';
import 'package:examen_david_solis_gs/providers/db_provider.dart';
import 'package:examen_david_solis_gs/repository/alumnos_repository.dart';
import 'package:flutter/material.dart';

class MateriasPorAlumno extends StatefulWidget {
  const MateriasPorAlumno({Key? key}) : super(key: key);

  @override
  State<MateriasPorAlumno> createState() => _MateriasPorAlumnoState();
}

class _MateriasPorAlumnoState extends State<MateriasPorAlumno> {
  int idSelect = 0;
  List<Alumno> alumnos = [];
  List<MateriasXAlumno> items = [];

  @override
  void initState() {
    super.initState();
    _getAlumnos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Center(
                  child: Text(
                    "Materias por Alumnos",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButton<int>(
                hint: const Text('Alumno'),
                value: idSelect,
                items: [
                  const DropdownMenuItem(
                    value: 0,
                    child: Text("Todos"),
                  ),
                  ...alumnos
                      .map((a) => DropdownMenuItem(
                            value: a.id,
                            child: Text(a.nombre),
                          ))
                      .toList(),
                ],
                onChanged: (int? opt) {
                  idSelect = opt ?? 0;
                  setState(() {});
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  sortColumnIndex: 0,
                  sortAscending: true,
                  columns: const [
                    DataColumn(label: Text('Id'), tooltip: 'id'),
                    DataColumn(label: Text('Alumno'), tooltip: 'alumno'),
                    DataColumn(label: Text('Grado'), tooltip: 'grado'),
                    DataColumn(label: Text('Materias'), tooltip: 'materias'),
                  ],
                  rows: idSelect == 0
                      ? items
                          .map((i) => DataRow(cells: [
                                DataCell(Text('${i.id}')),
                                DataCell(Text(i.nombre)),
                                DataCell(Text(i.grado)),
                                DataCell(Text(i.materias)),
                              ]))
                          .toList()
                      : items
                          .where((e) => e.id == idSelect)
                          .toList()
                          .map((i) => DataRow(cells: [
                                DataCell(Text('${i.id}')),
                                DataCell(Text(i.nombre)),
                                DataCell(Text(i.grado)),
                                DataCell(Text(i.materias)),
                              ]))
                          .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getAlumnos() async {
    alumnos = (await AlumnosRepository.getAlumnos(null, null, null)).data!;
    setState(() {});
    await llenadoData();
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

        materias += "  ";
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
}
