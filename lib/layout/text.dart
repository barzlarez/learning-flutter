import 'package:flutter/material.dart';

class MyAppText extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
                child: Text(
                    "Training Flutter",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(fontSize: 32, color: Colors.black),
                ),
            ),
        );
    }
}
