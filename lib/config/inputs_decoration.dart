import 'package:examen_david_solis_gs/config/colors.dart';
import 'package:flutter/material.dart';

InputDecoration inputsDecoration({
  required String label,
  required String placeholder,
}) {
  return InputDecoration(
    label: Text(label),
    hintText: placeholder,
    border: const OutlineInputBorder(),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  );
}

InputDecoration selectsDecoration() {
  return const InputDecoration(
    border: OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  );
}
