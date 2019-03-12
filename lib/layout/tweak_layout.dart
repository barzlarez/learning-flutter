import 'package:flutter/material.dart';

class MyAppTweakLayout extends StatelessWidget {

    var roundRadius = 8.0;

    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            home: Scaffold(
                appBar: new AppBar(
                    title: Text("Training Flutter"),
                ),
                body:
                SingleChildScrollView(child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                        Container(child: Text("This is a custom text",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.indigo,
                                fontFamily: "Montserrat",
                                fontStyle: FontStyle.italic,
                                wordSpacing: 3,
                                letterSpacing: 3
                            ),
                        )),
                        RaisedButton(
                            onPressed: _buttonTapped,
                            child: Text("Hey, tap Me!"),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(roundRadius))
                            ),
                            highlightColor: Colors.brown,
                            splashColor: Colors.green,
                        ),
                        Container(
                            decoration: ShapeDecoration(
                                shape: CircleBorder(), color: Colors.red),
                            child: Icon(Icons.camera, size: 100)
                        ),
                        Container(
                            height: 300,
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(roundRadius))
                                ),
                                color: Colors.orange),
                            child: Image.network(
                                "https://image.shutterstock.com/image-photo/milky-way-above-volcano-teide-260nw-169805951.jpg",
                                fit: BoxFit.none,
                            )
                        ),
                        Container(
                            height: 300,
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(roundRadius))
                                ),
                                color: Colors.green),
                            child: Image.network(
                                "https://image.shutterstock.com/image-photo/milky-way-above-volcano-teide-260nw-169805951.jpg",
                                fit: BoxFit.none,
                            )
                        ),
                    ],
                )
                ),
            ),
        );
    }

    void _buttonTapped() {
        print("Yor have tapped me!");
    }
}
