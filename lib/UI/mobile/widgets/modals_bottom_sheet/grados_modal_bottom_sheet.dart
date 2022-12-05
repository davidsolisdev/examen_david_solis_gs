import 'package:examen_david_solis_gs/bloc/grados_form/grados_form_bloc.dart';
import 'package:examen_david_solis_gs/config/inputs_decoration.dart';
import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/repository/grados_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradosModalBottomSheet extends StatelessWidget {
  const GradosModalBottomSheet({this.update = false, Key? key})
      : super(key: key);

  final bool update;

  @override
  Widget build(BuildContext context) {
    final blocForm = BlocProvider.of<GradosFormBloc>(context, listen: true);
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.6,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Center(
        child: Column(
          children: [
            // fila de Nombre
            TextFormField(
              keyboardType: TextInputType.text,
              initialValue: blocForm.state.nombre,
              onChanged: (value) => blocForm.add(ModificarFormGrados(
                lastState: blocForm.state,
                nombre: value,
              )),
              decoration: inputsDecoration(
                label: "Nombre",
                placeholder: "Estadistica",
              ),
              validator: (value) {
                if (value == null) return "Ingresa el nombre";
                if (value.trim().isEmpty) return "Ingresa el nombre";
                return null;
              },
            ),
            const SizedBox(width: double.infinity, height: 20),
            // boton para grabar el registro
            Center(
              child: ElevatedButton(
                child: const Text("Grabar"),
                onPressed: () {
                  if (blocForm.state.nombre.trim().isEmpty) return;

                  if (update == true) {
                    GradosRepository.putGrado(Grado(
                      id: blocForm.state.id,
                      nombre: blocForm.state.nombre,
                    ));
                    blocForm.add(ModificarFormGrados(
                        lastState: blocForm.state, nombre: "", id: 0));
                    Navigator.pop(context);
                    return;
                  }

                  GradosRepository.postGrado(blocForm.state.nombre);
                  blocForm.add(ModificarFormGrados(
                      lastState: blocForm.state, nombre: "", id: 0));
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
