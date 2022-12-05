import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/alumno_item.dart';
import 'package:examen_david_solis_gs/bloc/global/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlumnosPage extends StatefulWidget {
  const AlumnosPage({Key? key}) : super(key: key);

  @override
  State<AlumnosPage> createState() => _AlumnosPageState();
}

class _AlumnosPageState extends State<AlumnosPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GlobalBloc>(context, listen: true);

    bloc.add(GetAlumnos(bloc.state));

    return LayoutBuilder(builder: (context, size) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Center(
              child: Text(
                "Alumnos",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children:
                  bloc.state.alumnos.map((a) => AlumnoItem(alumno: a)).toList(),
            ),
          ),
        ],
      );
    });
  }
}
