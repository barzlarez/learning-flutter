import 'package:flutter/material.dart';

import 'models.dart';

class DetailMeal extends StatefulWidget {

    @override
    State<StatefulWidget> createState() => _DetailMeal();
}

class _DetailMeal extends State<DetailMeal> {

    Meal meal;
    List<Ingredient> ingredients;

    DetailMeal({meal: Meal}) {
        meal = meal;
        ingredients = meal.ingredients.where((item) {
            return !(item.ingredient
                .trim()
                .isEmpty
                && item.measure
                    .trim()
                    .isEmpty);
        }).toList();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Title"),
            ),
            body: Container(
                child: CustomScrollView(
                    slivers: <Widget>[
                        createHeader(),
//                        createIngredientsTable()
//                        Text("Ingredients"),
                        SliverSafeArea(
                            minimum: EdgeInsets.fromLTRB(16, 0, 16, 20),
                            sliver: SliverList(
                                delegate: SliverChildBuilderDelegate((context, pos) {
                                    return Row(
                                        children: <Widget>[
                                            Container(
                                                width: 30,
                                                child: Text(
                                                    "${pos + 1}.", style: TextStyle(fontWeight: FontWeight.bold))
                                            ),
                                            Text(ingredients[pos].description())
                                        ],
                                    );
                                }, childCount: ingredients.length)
                            ),
                        )
                    ],
                ),
            )
        );
    }

    Widget createHeader() {
        return SliverList(
            delegate: SliverChildListDelegate(
                [
                    AspectRatio(
                        aspectRatio: 5 / 2,
                        child: Image.network(meal.thumbnail, fit: BoxFit.fitWidth)
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                                Text(meal.mealName,
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold)
                                ),
                                Text(meal.category,
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.normal)
                                )
                            ],
                        ),
                    )
                ]
            )
        );
    }

    Widget createIngredientsTable() {
        return SliverSafeArea(
            sliver: Column(
                children: <Widget>[
                    Text("Ingredients"),
                    SliverList(
                        delegate: SliverChildBuilderDelegate((context, pos) {
                            return Row(
                                children: <Widget>[
                                    Text("${pos + 1}.", style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(meal.ingredients[pos].description())
                                ],
                            );
                        }, childCount: meal.ingredients.length)
                    )
                ],
            ),
        );
    }
}