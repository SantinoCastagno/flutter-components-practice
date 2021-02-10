import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatares"),
        actions: [
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1609962427242-ac4dc4a8f19b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
              ),
              radius: 22,
            ),
            padding: EdgeInsets.all(8),
          ),
          Container(
            child: CircleAvatar(
              child: Text("SC"),
              backgroundColor: Colors.blueGrey[600],
              radius: 20,
            ),
            padding: EdgeInsets.all(4),
          ),
        ],
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage(
            "https://images.unsplash.com/photo-1609958935582-2bb75583ea72?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
          ),
          fit: BoxFit.fitHeight,
          height: 500,
          fadeInDuration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
