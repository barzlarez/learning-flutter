import 'package:flutter/material.dart';

class MyAppImage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
                child: Image.asset("graphics/shrine.jpg"),
            ),
        );
    }
}
