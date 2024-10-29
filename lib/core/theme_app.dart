import 'package:flutter/material.dart';

final kThemeApp = ThemeData(
  brightness: Brightness.dark, // Um tema escuro é configurado com um esquema de cores e estilos para os widgets.
  visualDensity: VisualDensity.adaptivePlatformDensity, // Ajusta a densidade visual de acordo com a plataforma.
  primarySwatch: Colors.red,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary, // Define que o texto dos botões usa a cor primária.
  ),
);