import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/materia_item.dart';
import 'package:examen_david_solis_gs/bloc/global/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MateriasPage extends StatefulWidget {
  const MateriasPage({Key? key}) : super(key: key);

  @override
  State<MateriasPage> createState() => _MateriasPageState();
}

class _MateriasPageState extends State<MateriasPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GlobalBloc>(context, listen: true);

    bloc.add(GetMaterias(bloc.state));

    return LayoutBuilder(builder: (context, size) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Center(
              child: Text(
                "Materias",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: bloc.state.materias
                  .map((m) => MateriaItem(materia: m))
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}
