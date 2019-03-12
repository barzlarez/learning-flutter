import 'package:flutter/material.dart';

class Thing extends Object {
    final String name;
    final IconData icon;

    Thing(this.name, this.icon);
}

class MyAppListView extends StatelessWidget {

    final roundRadius = 5.0;
    final things = [
        Thing("Television", Icons.ac_unit),
        Thing("Car", Icons.child_friendly),
        Thing("House", Icons.color_lens),
        Thing("Hammer", Icons.equalizer),
        Thing("Briefcase", Icons.adb)
    ];

    final controller = ScrollController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: Text("Training Flutter"),
            ),
            body: ListView.builder(
                controller: controller,
                itemCount: things.length,
                itemBuilder: (context, pos) {
                    return GestureDetector(
                        child: ListTile(
                            title: Text(things[pos].name),
                            trailing: Icon(things[pos].icon),
                        ),
                        onTap: () {
                            Scaffold.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(things[pos].name),
                                    duration: Duration(seconds: 1),
                                    action: SnackBarAction(label: "OK", onPressed: () {
                                        Scaffold.of(context).hideCurrentSnackBar();
                                    }),
                                )
                            );
                        },
                    );
                },
            ),
        );
    }
}
