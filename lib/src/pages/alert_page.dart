import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alertas"),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: RaisedButton(
          child: Text("El mensaje oculto"),
          textColor: Colors.white,
          color: Colors.indigo[400],
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Mmmmm"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("I really lost the game"),
              FlutterLogo(size: 100),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Back"),
            ),
          ],
        );
      },
    );
  }
}
