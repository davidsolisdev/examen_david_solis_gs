import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/grado_item.dart';
import 'package:examen_david_solis_gs/bloc/global/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradosPage extends StatefulWidget {
  const GradosPage({Key? key}) : super(key: key);

  @override
  State<GradosPage> createState() => _GradosPageState();
}

class _GradosPageState extends State<GradosPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GlobalBloc>(context, listen: true);

    bloc.add(GetGrados(bloc.state));

    return LayoutBuilder(builder: (context, size) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Center(
              child: Text(
                "Grados",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children:
                  bloc.state.grados.map((g) => GradoItem(grado: g)).toList(),
            ),
          ),
        ],
      );
    });
  }
}
