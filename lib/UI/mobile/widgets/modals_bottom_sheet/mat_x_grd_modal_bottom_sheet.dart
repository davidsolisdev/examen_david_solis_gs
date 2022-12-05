import 'package:examen_david_solis_gs/bloc/grados_form/grados_form_bloc.dart';
import 'package:examen_david_solis_gs/bloc/mat_x_grd_form/mat_x_grd_form_bloc.dart';
import 'package:examen_david_solis_gs/config/inputs_decoration.dart';
import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/models/materia.dart';
import 'package:examen_david_solis_gs/models/materiasXgrado.dart';
import 'package:examen_david_solis_gs/repository/grados_repository.dart';
import 'package:examen_david_solis_gs/repository/mat_x_grd_repository.dart';
import 'package:examen_david_solis_gs/repository/materias_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatXGrdModalBottomSheet extends StatefulWidget {
  const MatXGrdModalBottomSheet({this.update = false, Key? key})
      : super(key: key);

  final bool update;

  @override
  State<MatXGrdModalBottomSheet> createState() =>
      _MatXGrdModalBottomSheetState();
}

class _MatXGrdModalBottomSheetState extends State<MatXGrdModalBottomSheet> {
  List<Grado> grados = [];
  List<Materia> materias = [];

  @override
  void initState() {
    super.initState();
    _getGrados();
    _getMaterias();
  }

  @override
  Widget build(BuildContext context) {
    final blocForm = BlocProvider.of<MatXGrdFormBloc>(context, listen: true);
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.6,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Center(
        child: Column(
          children: [
            // fila de Nombre
            Row(
              children: [
                SizedBox(
                  width: 140,
                  child: DropdownButtonFormField<int>(
                    hint: const Text('Grado'),
                    value: blocForm.state.idGrd,
                    items: grados
                        .map((g) => DropdownMenuItem(
                              value: g.id,
                              child: Text(g.nombre),
                            ))
                        .toList(),
                    onChanged: (int? opt) {
                      blocForm.add(ModificarFormMatXGrd(
                        lastState: blocForm.state,
                        idGrd: opt,
                      ));
                    },
                    decoration: selectsDecoration(),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 140,
                  child: DropdownButtonFormField<int>(
                    hint: const Text('Materia'),
                    value: blocForm.state.idMat,
                    items: materias
                        .map((g) => DropdownMenuItem(
                              value: g.id,
                              child: Text(g.nombre),
                            ))
                        .toList(),
                    onChanged: (int? opt) {
                      blocForm.add(ModificarFormMatXGrd(
                        lastState: blocForm.state,
                        idMat: opt,
                      ));
                    },
                    decoration: selectsDecoration(),
                  ),
                ),
              ],
            ),

            const SizedBox(width: double.infinity, height: 20),
            // boton para grabar el registro
            Center(
              child: ElevatedButton(
                child: const Text("Grabar"),
                onPressed: () {
                  if (widget.update == true) {
                    MatXGrdRepository.putMatXGrd(MateriasXGrado(
                        id: blocForm.state.id,
                        idGrd: blocForm.state.idGrd,
                        idMat: blocForm.state.idMat));
                    blocForm.add(ModificarFormMatXGrd(
                        lastState: blocForm.state, idGrd: 0, idMat: 0, id: 0));
                    Navigator.pop(context);
                    return;
                  }

                  MatXGrdRepository.postMatXGrd(
                    blocForm.state.idGrd,
                    blocForm.state.idMat,
                  );
                  blocForm.add(ModificarFormMatXGrd(
                    lastState: blocForm.state,
                    idGrd: 0,
                    idMat: 0,
                    id: 0,
                  ));
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _getGrados() async {
    grados = (await GradosRepository.getGrados(null)).data!;
    setState(() {});
  }

  Future<void> _getMaterias() async {
    materias = (await MateriasRepository.getMaterias(null)).data!;
    setState(() {});
  }
}
