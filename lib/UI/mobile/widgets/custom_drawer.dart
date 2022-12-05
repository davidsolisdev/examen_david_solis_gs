import 'package:examen_david_solis_gs/config/colors.dart';
import 'package:flutter/material.dart';

import '../pages/materias_por_alumno_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const CircleAvatar(
              backgroundColor: primaryColor,
              radius: 55,
              child: Text(
                'DS',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                "David Solis",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                "davidsolisdev@gmail.com",
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(),
            ListTile(
              title: const Text(
                'Materias por alumno',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MateriasPorAlumno()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
