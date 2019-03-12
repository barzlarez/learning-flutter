import 'package:flutter/material.dart';

class MyAppImage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
                child: Image.network("https://image.shutterstock.com/image-photo/milky-way-above-volcano-teide-260nw-169805951.jpg"),
            ),
        );
    }
}
