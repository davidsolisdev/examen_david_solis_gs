import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/alumnos_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/grados_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/mat_x_grd_modal_bottom_sheet.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/modals_bottom_sheet/materias_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({required this.index, Key? key}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      child: const Icon(Icons.add),
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => index == 0
            ? const MateriasModalBottomSheet()
            : index == 1
                ? const GradosModalBottomSheet()
                : index == 2
                    ? AlumnosModalBottomSheet()
                    : const MatXGrdModalBottomSheet(),
      ),
    );
  }
}
