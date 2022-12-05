import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/row_details.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/alumnos_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/bloc/alumnos_form/alumnos_form_bloc.dart';
import 'package:examen_david_solis_gs/config/colors.dart';
import 'package:examen_david_solis_gs/models/alumno.dart';
import 'package:examen_david_solis_gs/repository/alumnos_repository.dart';
import 'package:examen_david_solis_gs/repository/grados_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlumnoItem extends StatelessWidget {
  const AlumnoItem({required this.alumno, Key? key}) : super(key: key);

  final Alumno alumno;

  @override
  Widget build(BuildContext context) {
    var blocForm = BlocProvider.of<AlumnosFormBloc>(context);

    return ExpansionTile(
      title: ListTile(
        title: Text(alumno.nombre),
        trailing: SizedBox(
          width: 96,
          child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  bool? eliminar =
                      await _showDeleteMateriaModal(context, alumno.nombre);

                  if (eliminar == null || eliminar == false) return;

                  AlumnosRepository.deleteAlumno(alumno.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  blocForm.add(ModificarFormAlumnos(
                    lastState: blocForm.state,
                    id: alumno.id,
                    codigo: alumno.codigo,
                    nombre: alumno.nombre,
                    edad: alumno.edad,
                    sexo: alumno.sexo,
                    idGrd: alumno.idGrd,
                    observacion: alumno.observacion,
                  ));

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => AlumnosModalBottomSheet(
                      update: true,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      children: [
        RowDetails(title: "Id", content: alumno.id),
        RowDetails(title: "Codigo", content: alumno.codigo),
        RowDetails(title: "Nombre", content: alumno.nombre),
        RowDetails(title: "Edad", content: alumno.edad),
        RowDetails(title: "Sexo", content: alumno.sexo),
        RowDetails(title: "Id grado", content: alumno.idGrd),
        RowDetails(title: "Observacion", content: alumno.observacion),
      ],
    );
  }

  Future<bool?> _showDeleteMateriaModal(
      BuildContext context, String nombreAlumno) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Eliminar Alumno?'),
        content: Text('Eliminar $nombreAlumno de la lista'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}
