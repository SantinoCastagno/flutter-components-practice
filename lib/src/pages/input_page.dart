import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _direccion, _fecha, _opcionElegida = "Control de tiempo";
  TextEditingController _inputFieldController = new TextEditingController();
  List<String> _habilidades = [
    "Control de tiempo",
    "Velocidad modificada",
    "Inteligencia absoluta"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Page"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _crearPersona(),
          Divider(),
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
        ],
      ),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("El dato ingresado es:$_direccion"),
      trailing: Text(_opcionElegida),
      subtitle: Text("Holis"),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: "Ej: 'San Martin 123'",
        labelStyle: TextStyle(color: Colors.amber),
        labelText: "Dirección",
        suffixIcon: Icon(
          Icons.accessibility,
          color: Colors.indigo,
        ),
      ),
      onChanged: (String newValue) {
        setState(() {
          _direccion = newValue;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: "Ej: 'santino123@gmail.com'",
        labelStyle: TextStyle(color: Colors.amber),
        labelText: "Correo electronico",
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (String newValue) {
        setState(() {
          _direccion = newValue;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        hintText: "Ej: '1234asdf'",
        labelStyle: TextStyle(color: Colors.amber),
        labelText: "Contraseña",
        icon: Icon(Icons.account_balance),
        suffixIcon: Icon(Icons.weekend),
      ),
      onChanged: (String newValue) {
        setState(() {
          _direccion = newValue;
        });
      },
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      controller: _inputFieldController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelStyle: TextStyle(color: Colors.amber),
        labelText: "Fecha de nacimiento",
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.calendar_view_day),
      ),
      onTap: () {
        //Para perder el foco al intentar hacer el tap en la fecha
        FocusScope.of(context).requestFocus(new FocusNode());
        //Metodo que permite abrir la ventana de selección de fechas
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
      locale: Locale("es", "ES"),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldController.text = _fecha;
      });
    }
  }

  Widget _crearDropDown() {
    return DropdownButton(
      value: _opcionElegida,
      items: _getOpcionesDD(),
      onChanged: (opt) {
        setState(() {
          _opcionElegida = opt;
        });
      },
    );
  }

  //Metodo auxiliar del metodo superior
  List<DropdownMenuItem<String>> _getOpcionesDD() {
    List<DropdownMenuItem<String>> lista = new List();

    _habilidades.forEach((habilidad) {
      lista.add(
        DropdownMenuItem(
          child: Text(habilidad),
          value: habilidad,
        ),
      );
    });

    return lista;
  }
}
