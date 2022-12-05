import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/row_details.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/grados_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/mat_x_grd_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/bloc/matXgrad_form/matXgrad_form_bloc.dart';
import 'package:examen_david_solis_gs/config/colors.dart';
import 'package:examen_david_solis_gs/models/materiasXgrado.dart';
import 'package:examen_david_solis_gs/repository/grados_repository.dart';
import 'package:examen_david_solis_gs/repository/mat_x_grd_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatXGrdItem extends StatelessWidget {
  const MatXGrdItem({required this.mxg, Key? key}) : super(key: key);

  final MateriasXGrado mxg;

  @override
  Widget build(BuildContext context) {
    var blocForm = BlocProvider.of<MatXGradFormBloc>(context);

    return ExpansionTile(
      title: ListTile(
        title: Text('${mxg.id}'),
        trailing: SizedBox(
          width: 50,
          child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  bool? eliminar =
                      await _showDeleteMateriaModal(context, mxg.id);

                  if (eliminar == null || eliminar == false) return;

                  MatXGrdRepository.deleteMatXGrd(mxg.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      children: [
        RowDetails(title: "Id", content: mxg.id),
        RowDetails(title: "Id Grado", content: mxg.idGrd),
        RowDetails(title: "Id Materia", content: mxg.idMat),
      ],
    );
  }

  Future<bool?> _showDeleteMateriaModal(BuildContext context, int id) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Eliminar Grado?'),
        content: Text('Eliminar $id de la lista'),
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
