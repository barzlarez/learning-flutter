import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import 'detail_meal.dart';
import 'favorite_meal.dart';
import 'favorite_model.dart';
import 'models.dart';

class ListMeals extends StatefulWidget {

    ListMeals({Key key, this.title}) : super(key: key);

    final String title;

    @override
    State<StatefulWidget> createState() => _ListMeals();
}

class _ListMeals extends State<ListMeals> {

    static const platform = const MethodChannel('samples.flutter.io/battery');
    Future<Meals> meals;

    @override
    void initState() {
        super.initState();
        meals = fetchMeals();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Meals"),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FavoriteMeal())
                            );
                        }
                    )
                ],
            ),
            body: Container(
                child: Center(
                    child: buildList(),
                ),
            )
        );
    }

    // Get battery level.
    String _batteryLevel = 'Unknown battery level.';

    Future<void> _getBatteryLevel() async {
        String batteryLevel;
        try {
            final int result = await platform.invokeMethod('getBatteryLevel');
            batteryLevel = 'Battery level at $result % .';
        } on PlatformException catch (e) {
            batteryLevel = "Failed to get battery level: '${e.message}'.";
        }

        setState(() {
            _batteryLevel = batteryLevel;
        });
    }

    Widget buildList() {
        return FutureBuilder<Meals>(
            future: meals,
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                    final data = snapshot.data.meals;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, position) {
                            final item = data[position];
                            return GestureDetector(
                                child: createListItem(item),
                                onTap: () {
//                                    _getBatteryLevel();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailMeal(item, item.ingredients)
                                        )
                                    );
                                },
                            );
                        });
                } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
            },
        );
    }

    Widget createListItem(Meal value) {
        return Container(
            constraints: BoxConstraints(),
            child: Column(
                children: <Widget>[
                    AspectRatio(
                        aspectRatio: 5 / 2,
                        child: Image.network(value.thumbnail, height: 200, fit: BoxFit.fitWidth)
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 16),
                        child: Row(
                            children: <Widget>[
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                            Text(value.mealName,
                                                style: TextStyle(
                                                    color: Colors.indigo,
                                                    fontWeight: FontWeight.bold)
                                            ),
                                            Text(value.category,
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontWeight: FontWeight.normal)
                                            )
                                        ],
                                    ),
                                ),
                                ScopedModelDescendant<FavoriteModel>(
                                    builder: (context, child, favorite) {
                                        final model = ScopedModel.of<FavoriteModel>(context, rebuildOnChange: true);
                                        if (favorite.isAdded(value)) {
                                            return IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {
                                                    model.remove(value);
                                                },
                                            );
                                        } else {
                                            return IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                    model.addItem(value);
                                                },
                                            );
                                        }
                                    },
                                )
                            ],
                        )
                    )
                ],
            ),
        );
    }

    Future<Meals> fetchMeals() async {
        final response = await http.get("https://www.themealdb.com/api/json/v1/1/latest.php");
        if (response.statusCode == 200) {
            return Meals.json(json.decode(response.body));
        } else {
            throw Exception('Gagal mendapatkan data');
        }
    }
}
