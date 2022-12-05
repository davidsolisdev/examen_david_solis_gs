import 'package:examen_david_solis_gs/UI/mobile/pages/alumnos_page.dart';
import 'package:examen_david_solis_gs/UI/mobile/pages/grados_page.dart';
import 'package:examen_david_solis_gs/UI/mobile/pages/mat_x_grd_page.dart';
import 'package:examen_david_solis_gs/UI/mobile/pages/materias_page.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/custom_bottom_bar.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/custom_drawer.dart';
import 'package:examen_david_solis_gs/UI/mobile/widgets/custom_floating_action_button.dart';
import 'package:examen_david_solis_gs/bloc/global/global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({Key? key}) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int indexTab = 0;

  void setIndexTab(int index) {
    indexTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Examen David Solis')),
      body: BlocBuilder<GlobalBloc, GlobalState>(builder: ((context, state) {
        switch (indexTab) {
          case 0:
            return const MateriasPage();
          case 1:
            return const GradosPage();
          case 2:
            return const AlumnosPage();
          case 3:
            return const MatXGrdPage();
          default:
            return const MateriasPage();
        }
      })),
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomBottomBar(
        index: indexTab,
        setIndexTab: setIndexTab,
      ),
      floatingActionButton: CustomFloatingActionButton(
        index: indexTab,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
