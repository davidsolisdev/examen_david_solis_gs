import 'package:examen_david_solis_gs/bloc/materias_form/materias_form_bloc.dart';
import 'package:examen_david_solis_gs/config/inputs_decoration.dart';
import 'package:examen_david_solis_gs/models/materia.dart';
import 'package:examen_david_solis_gs/repository/materias_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MateriasModalBottomSheet extends StatelessWidget {
  const MateriasModalBottomSheet({this.update = false, Key? key})
      : super(key: key);

  final bool update;

  @override
  Widget build(BuildContext context) {
    final blocForm = BlocProvider.of<MateriasFormBloc>(context, listen: true);
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.6,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              // fila de Nombre
              TextFormField(
                keyboardType: TextInputType.text,
                initialValue: blocForm.state.nombre,
                onChanged: (value) => blocForm.add(ModificarFormMaterias(
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
                      MateriasRepository.putMateria(Materia(
                        id: blocForm.state.id,
                        nombre: blocForm.state.nombre,
                      ));
                      blocForm.add(ModificarFormMaterias(
                          lastState: blocForm.state, nombre: "", id: 0));
                      Navigator.pop(context);
                      return;
                    }

                    MateriasRepository.postMateria(blocForm.state.nombre);
                    blocForm.add(ModificarFormMaterias(
                        lastState: blocForm.state, nombre: "", id: 0));
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
