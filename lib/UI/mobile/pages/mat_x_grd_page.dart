import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/grado_item.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/items_lists/mat_x_grd_item.dart';
import 'package:examen_david_solis_gs/bloc/global/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatXGrdPage extends StatefulWidget {
  const MatXGrdPage({Key? key}) : super(key: key);

  @override
  State<MatXGrdPage> createState() => _MatXGrdPageState();
}

class _MatXGrdPageState extends State<MatXGrdPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GlobalBloc>(context, listen: true);

    bloc.add(GetMatXGrd(bloc.state));

    return LayoutBuilder(builder: (context, size) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 5),
            child: Center(
              child: Text(
                "Materias X Grados",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: bloc.state.materiasXgrado
                  .map((mxg) => MatXGrdItem(mxg: mxg))
                  .toList(),
            ),
          ),
        ],
      );
    });
  }
}
