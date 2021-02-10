import 'package:flutter/material.dart';

import 'dart:async';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  ScrollController _scroll = new ScrollController();
  bool _isLoading = false;

  //Metodo que se utiliza al iniciar el estado del widget
  @override
  void initState() {
    super.initState();
    _agregar10();

    //Callback que permite escuchar el evento del scroll moviendose.
    _scroll.addListener(() {
      //Verifica si la posición actual del scroll es igual al maximo de la pantall actual.
      if (_scroll.position.pixels == _scroll.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scroll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
          controller: _scroll,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final _imagen = _listaNumeros[index];

            return FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image: NetworkImage("https://picsum.photos/id/$_imagen/500/300"),
              height: 300,
              width: 500,
              fit: BoxFit.cover,
            );
          }),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    //Mueve la posición actual del scroll (es decir, de la pantalla)
    _scroll.animateTo(
      _scroll.position.pixels + 200,
      duration: Duration(seconds: 2),
      curve: Curves.bounceIn,
    );

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 9,
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}
