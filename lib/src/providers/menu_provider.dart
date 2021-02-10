//para cargar el JSON local
import 'package:flutter/services.dart' show rootBundle;
//para decodificar el JSON local
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  Future<List<dynamic>> cargarData() async {
    //Metodo asincrono que se encarga de leer el JSON
    final menuOpts = await rootBundle.loadString('data/menu_opts.json');
    Map menuMapped = json.decode(menuOpts);
    opciones = menuMapped['rutas'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();
