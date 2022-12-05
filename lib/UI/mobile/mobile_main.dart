import 'package:examen_david_solis_gs/bloc/alumnos_form/alumnos_form_bloc.dart';
import 'package:examen_david_solis_gs/bloc/grados_form/grados_form_bloc.dart';
import 'package:examen_david_solis_gs/bloc/matXgrad_form/matXgrad_form_bloc.dart';
import 'package:examen_david_solis_gs/bloc/mat_x_grd_form/mat_x_grd_form_bloc.dart';
import 'package:examen_david_solis_gs/bloc/materias_form/materias_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_david_solis_gs/config/theme_config.dart';
import 'package:examen_david_solis_gs/bloc/global/global_bloc.dart';
import 'package:examen_david_solis_gs/UI/mobile/pages/home_page.dart';

class MobileMain extends StatelessWidget {
  const MobileMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GlobalBloc()),
          BlocProvider(create: (context) => MateriasFormBloc()),
          BlocProvider(create: (context) => GradosFormBloc()),
          BlocProvider(create: (context) => AlumnosFormBloc()),
          BlocProvider(create: (context) => MatXGradFormBloc()),
          BlocProvider(create: (context) => MatXGrdFormBloc()),
        ],
        child: BlocBuilder<GlobalBloc, GlobalState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Examen David Solis - Grupo Satelite",
              themeMode:
                  state.theme == "light" ? ThemeMode.light : ThemeMode.dark,
              theme: ThemeConfig.light(),
              darkTheme: ThemeData.dark(),
              initialRoute: "/",
              routes: routes,
            );
          },
        ));
  }
}

Map<String, Widget Function(BuildContext)> routes = {
  "/": (context) => const HomePage(),
};
