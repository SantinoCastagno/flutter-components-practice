import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorActual = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Slider(
        activeColor: Colors.indigo,
        label: "Nivel de poder",
        value: _valorActual,
        min: 100.0,
        max: 500.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorActual = valor;
                });
              },
      ),
    );
  }

  Widget _crearImagen() {
    return Image(
      width: _valorActual,
      image: NetworkImage(
          "https://images.unsplash.com/photo-1507346684407-31bd9890f8a9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80"),
    );
  }

  Widget _crearCheckBox() {
    //Recordar que otros similares son el CheckBox y el CheckboxListTile
    return SwitchListTile(
      title: Text("Bloquear slider"),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
}
