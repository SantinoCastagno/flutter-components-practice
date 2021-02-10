import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> _opciones = ["Uno", "Dos", "Tres"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components temp"),
      ),
      body: ListView(
        children: _crearListaCorta(),
      ),
    );
  }

  // List<Widget> _crearListaLargo() {
  //   List<Widget> resultado = List<Widget>();

  //   for (var opcion in _opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opcion),
  //     );

  //     resultado..add(tempWidget)..add(Divider());
  //   }

  //   return resultado;
  // }

  List<Widget> _crearListaCorta() {
    return _opciones.map((opcion) {
      return Column(
        children: [
          ListTile(title: Text(opcion + "nueva lista")),
          Divider(),
        ],
      );
    }).toList();
  }
}
