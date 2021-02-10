import 'package:flutter/material.dart';

//Objeto que le asigna a cada String un Icono de Flutter, sirve para mapear los Strings
final Map _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'slider': Icons.tune,
  'list': Icons.list,
};

//Metodo que utiliza el objeto definido anteriormente
Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.amber);
}
