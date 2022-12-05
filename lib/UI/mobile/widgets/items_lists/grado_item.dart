import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/row_details.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/grados_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/bloc/grados_form/grados_form_bloc.dart';
import 'package:examen_david_solis_gs/config/colors.dart';
import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/repository/grados_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradoItem extends StatelessWidget {
  const GradoItem({required this.grado, Key? key}) : super(key: key);

  final Grado grado;

  @override
  Widget build(BuildContext context) {
    var blocForm = BlocProvider.of<GradosFormBloc>(context);

    return ExpansionTile(
      title: ListTile(
        title: Text(grado.nombre),
        trailing: SizedBox(
          width: 96,
          child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  bool? eliminar =
                      await _showDeleteMateriaModal(context, grado.nombre);

                  if (eliminar == null || eliminar == false) return;

                  GradosRepository.deleteGrado(grado.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  blocForm.add(ModificarFormGrados(
                    lastState: blocForm.state,
                    nombre: grado.nombre,
                    id: grado.id,
                  ));

                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const GradosModalBottomSheet(
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
        RowDetails(title: "Id", content: grado.id),
        RowDetails(title: "Nombre", content: grado.nombre),
      ],
    );
  }

  Future<bool?> _showDeleteMateriaModal(
      BuildContext context, String nombreGrado) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Eliminar Grado?'),
        content: Text('Eliminar $nombreGrado de la lista'),
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
