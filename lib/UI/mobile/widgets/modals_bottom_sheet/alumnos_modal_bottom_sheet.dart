import 'package:examen_david_solis_gs/bloc/alumnos_form/alumnos_form_bloc.dart';
import 'package:examen_david_solis_gs/config/inputs_decoration.dart';
import 'package:examen_david_solis_gs/models/alumno.dart';
import 'package:examen_david_solis_gs/models/grado.dart';
import 'package:examen_david_solis_gs/repository/alumnos_repository.dart';
import 'package:examen_david_solis_gs/repository/grados_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlumnosModalBottomSheet extends StatefulWidget {
  AlumnosModalBottomSheet({this.update = false, Key? key}) : super(key: key);

  bool update;

  @override
  State<AlumnosModalBottomSheet> createState() =>
      _AlumnosModalBottomSheetState();
}

class _AlumnosModalBottomSheetState extends State<AlumnosModalBottomSheet> {
  List<Grado> grados = [];

  @override
  void initState() {
    super.initState();
    _getGrados();
  }

  @override
  Widget build(BuildContext context) {
    final blocForm = BlocProvider.of<AlumnosFormBloc>(context, listen: true);
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.6,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              // fila de Nombre y edad
              Row(
                children: [
                  SizedBox(
                    width: 225,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: blocForm.state.nombre,
                      onChanged: (value) => blocForm.add(ModificarFormAlumnos(
                        lastState: blocForm.state,
                        nombre: value,
                      )),
                      decoration: inputsDecoration(
                        label: "Nombre",
                        placeholder: "Pedro Garcia",
                      ),
                      validator: (value) {
                        if (value == null) return "Ingresa el nombre";
                        if (value.trim().isEmpty) return "Ingresa el nombre";
                        if (value.trim().length > 300) {
                          return "Maximo 300 letras";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 70,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      initialValue: '${blocForm.state.edad}',
                      onChanged: (value) => blocForm.add(ModificarFormAlumnos(
                        lastState: blocForm.state,
                        edad: int.parse(value),
                      )),
                      decoration: inputsDecoration(
                        label: "Edad",
                        placeholder: "18",
                      ),
                      validator: (value) {
                        if (value == null) return "Ingresa la edad";
                        if (value.trim().isEmpty) return "Ingresa la edad";
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(width: double.infinity, height: 10),
              // fila de Codigo y Sexo
              Row(
                children: [
                  SizedBox(
                    width: 168,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      initialValue: blocForm.state.codigo,
                      onChanged: (value) => blocForm.add(ModificarFormAlumnos(
                        lastState: blocForm.state,
                        codigo: value,
                      )),
                      decoration: inputsDecoration(
                        label: "Codigo",
                        placeholder: "A-001",
                      ),
                      validator: (value) {
                        if (value == null) return "Ingresa el codigo";
                        if (value.trim().isEmpty) return "Ingresa el codigo";
                        if (value.trim().length > 100) {
                          return "Maximo 100 letras";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 122,
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
                        blocForm.add(ModificarFormAlumnos(
                          lastState: blocForm.state,
                          idGrd: opt,
                        ));
                      },
                      decoration: selectsDecoration(),
                    ),
                  )
                ],
              ),
              const SizedBox(width: double.infinity, height: 8),
              // campo de observacion
              Row(
                children: [
                  SizedBox(
                    width: 122,
                    child: DropdownButtonFormField<String>(
                      hint: const Text('Sexo'),
                      value: blocForm.state.sexo,
                      items: const [
                        DropdownMenuItem(
                          value: "masculino",
                          child: Text("Masculino"),
                        ),
                        DropdownMenuItem(
                          value: "femenino",
                          child: Text("Femenino"),
                        )
                      ],
                      onChanged: (String? opt) {
                        blocForm.add(ModificarFormAlumnos(
                          lastState: blocForm.state,
                          sexo: opt,
                        ));
                      },
                      decoration: selectsDecoration(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 168,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      initialValue: blocForm.state.observacion,
                      onChanged: (value) => blocForm.add(ModificarFormAlumnos(
                        lastState: blocForm.state,
                        observacion: value,
                      )),
                      decoration: inputsDecoration(
                        label: "Observacion",
                        placeholder: "Alumno trasladado",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: double.infinity, height: 7),
              // boton para grabar el registro
              Center(
                child: ElevatedButton(
                  child: const Text("Grabar"),
                  onPressed: () {
                    if (widget.update == true) {
                      AlumnosRepository.putAlumno(Alumno(
                          id: blocForm.state.id,
                          codigo: blocForm.state.codigo,
                          nombre: blocForm.state.nombre,
                          edad: blocForm.state.edad,
                          sexo: blocForm.state.sexo,
                          idGrd: blocForm.state.idGrd,
                          observacion: blocForm.state.observacion));
                      blocForm.add(ModificarFormAlumnos(
                        lastState: blocForm.state,
                        nombre: "",
                        id: 0,
                        codigo: "",
                        edad: 0,
                        sexo: "masculino",
                        idGrd: 1,
                        observacion: "",
                      ));
                      Navigator.pop(context);
                      return;
                    }

                    AlumnosRepository.postAlumno(Alumno(
                        id: blocForm.state.id,
                        codigo: blocForm.state.codigo,
                        nombre: blocForm.state.nombre,
                        edad: blocForm.state.edad,
                        sexo: blocForm.state.sexo,
                        idGrd: blocForm.state.idGrd,
                        observacion: blocForm.state.observacion));
                    blocForm.add(ModificarFormAlumnos(
                      lastState: blocForm.state,
                      nombre: "",
                      id: 0,
                      codigo: "",
                      edad: 0,
                      sexo: "masculino",
                      idGrd: 1,
                      observacion: "",
                    ));
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

  Future<void> _getGrados() async {
    grados = (await GradosRepository.getGrados(null)).data!;
    setState(() {});
  }
}
