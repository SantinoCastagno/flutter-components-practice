import 'package:flutter/material.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
        backgroundColor: Colors.indigo,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opcActual) {
      opciones
        ..add(ListTile(
          title: Text(opcActual['texto']),
          leading: getIcon(opcActual['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
          onTap: () {
            Navigator.pushNamed(context, opcActual['ruta']);

            // Navegación no óptima
            /* final route = MaterialPageRoute(builder: (context) => AlertPage());
            Navigator.push(context, route); */
          },
        ))
        ..add(Divider());
    });

    return opciones;
  }
}
