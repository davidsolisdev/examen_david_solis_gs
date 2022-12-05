import 'package:examen_david_solis_gs/bloc/global/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({required this.index, required this.setIndexTab, Key? key})
      : super(key: key);

  int index;
  Function setIndexTab;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GlobalBloc>(context, listen: true);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (int newIndex) {
        bloc.add(ChangeIndexBottomBar(bloc.state, index: newIndex));
        setIndexTab(newIndex);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Materias',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Grados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded),
          label: 'Alumnos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_tree),
          label: 'MatXGrd',
        ),
      ],
    );
  }
}
