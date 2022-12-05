import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/row_details.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/materias_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/bloc/materias_form/materias_form_bloc.dart';
import 'package:examen_david_solis_gs/config/colors.dart';
import 'package:examen_david_solis_gs/models/materia.dart';
import 'package:examen_david_solis_gs/repository/materias_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MateriaItem extends StatelessWidget {
  const MateriaItem({required this.materia, Key? key}) : super(key: key);

  final Materia materia;

  @override
  Widget build(BuildContext context) {
    var blocForm = BlocProvider.of<MateriasFormBloc>(context);

    return ExpansionTile(
      title: ListTile(
        title: Text(materia.nombre),
        trailing: SizedBox(
          width: 96,
          child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  bool? eliminar =
                      await _showDeleteMateriaModal(context, materia.nombre);

                  if (eliminar == null || eliminar == false) return;

                  MateriasRepository.deleteMateria(materia.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  blocForm.add(ModificarFormMaterias(
                    lastState: blocForm.state,
                    nombre: materia.nombre,
                    id: materia.id,
                  ));

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const MateriasModalBottomSheet(
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
        RowDetails(title: "Id", content: materia.id),
        RowDetails(title: "Nombre", content: materia.nombre),
      ],
    );
  }

  Future<bool?> _showDeleteMateriaModal(
      BuildContext context, String nombreMateria) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Eliminar Materia?'),
        content: Text('Eliminar $nombreMateria de la lista'),
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
