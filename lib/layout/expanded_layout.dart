import 'package:flutter/material.dart';

class MyAppExpanded extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            home: Scaffold(
                appBar: new AppBar(
                    title: Text("Training Flutter"),
                ),
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                        Expanded(
                            child: Container(
                                decoration: ShapeDecoration(shape: CircleBorder(), color: Colors.blue),
                                child: Text(
                                    "Contoh Row 1",
                                    style: TextStyle(fontSize: 24))
                            ),
                        ),
                        Expanded(
                            child: Text(
                                "Contoh Row 2",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24)),
                        ),
                        Text(
                            "Contoh Row 3",
                            style: TextStyle(fontSize: 24)),

                    ],
                ),
            ),
        );
    }
}
