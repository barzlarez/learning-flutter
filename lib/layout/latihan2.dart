import 'package:flutter/material.dart';

class MyAppLatihan2 extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: Text("Training Flutter"),
            ),
            body: SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: Column(
                        children: <Widget>[
                            _header(),
                            _title(),
                            _buttons(),
                            _content()
                        ],)
                )
            ),
        );
    }

    Widget _header() {
        return Image.asset(
            "images/dummy.jpg",
            width: 600,
            height: 240,
            fit: BoxFit.cover,
        );
    }

    Widget _title() {
        return Container(
            padding: EdgeInsets.all(15),
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Container(
                                    child: Text("This is a title", style: TextStyle(fontWeight: FontWeight.bold))
                                ),
                                Container(
                                    child: Text("This is a subtitle", style: TextStyle(color: Colors.grey[600]))
                                )
                            ],
                        ),
                    ),
                    Icon(Icons.star, color: Colors.indigo[400]),
                    Text("200"),
                ],
            ),
        );
    }

    Widget _buttons() {
        return Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                    _layoutButton("Print", Icons.print),
                    _layoutButton("Camera", Icons.camera),
                    _layoutButton("Add", Icons.add),
                ],)
        );
    }

    Column _layoutButton(String name, IconData data) {
        return Column(
            children: <Widget>[
                Container(
                    height: 35,
                    child: Icon(data)),
                Text(name)
            ],
        );
    }

    Widget _content() {
        return Container(
            margin: EdgeInsets.all(16),
            child: Text(
                "Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. "
                    "Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. "
                    "Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. "
                    "Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. Text yang panjang. "),
        );
    }
}