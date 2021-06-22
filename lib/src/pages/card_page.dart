import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarjetas"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: <Widget>[
          _cardManual(),
          SizedBox(height: 30),
          _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo1(),
          SizedBox(height: 30),
          _cardTipo2(),
          SizedBox(height: 30),
          _cardTipo1(),
        ],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _cardTipo1() {
    //La tarjeta
    return Card(
      //Cada tarjeta contiene un conjunto de elementos alineados en forma de columna
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.indigo,
            ),
            title: Text(
              "El titulo de la tarjeta.",
            ),
            subtitle: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam risus libero, iaculis at commodo a, suscipit eu massa.",
            ),
          ),
          Row(children: [
            TextButton(
              child: Text("Ok"),
              onPressed: () {},
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {},
            )
          ], mainAxisAlignment: MainAxisAlignment.end),
        ],
      ),
    );
  }

  Widget _cardManual() {
    Container firstCard = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1609784238290-73b35815d227?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
              height: 400,
              fadeInCurve: Curves.easeInCubic,
              fit: BoxFit.cover),
          Container(
            child: Text("Tarjeta número 2"),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    Container cardComplete = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12.0,
            spreadRadius: 3.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: firstCard,
      ),
    );

    return cardComplete;
  }

  Widget _cardTipo2() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            FadeInImage(
              placeholder: AssetImage("assets/jar-loading.gif"),
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1502214722586-9c0a74759710?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80"),
              height: 300,
              fadeInCurve: Curves.easeInCubic,
            ),
            Container(
              child: Text("Tarjeta número 2"),
            )
          ],
        ),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
