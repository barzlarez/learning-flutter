import 'package:flutter/material.dart';

import 'models.dart';

class DetailMeal extends StatelessWidget {

    final Meal meal;
    final List<Ingredient> ingredients;

    DetailMeal(this.meal, this.ingredients);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("How to Make"),
            ),
            body: Container(
                child: CustomScrollView(
                    slivers: <Widget>[
                        createHeaderSection(),
                        createIngredientsSection(),
                        createHowToSection()
                    ],
                ),
            )
        );
    }

    Widget createHeaderSection() {
        return SliverList(
            delegate: SliverChildListDelegate(
                [
                    AspectRatio(
                        aspectRatio: 5 / 2,
                        child: Image.network(meal.thumbnail, fit: BoxFit.fitWidth)
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                                Text(meal.mealName,
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    )
                                ),
                                Text("${meal.category} from ${meal.area}",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.normal)
                                )
                            ],
                        ),
                    ),
                    SafeArea(
                        minimum: EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: Text("Ingredients",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            )
                        ),
                    ),
                ]
            )
        );
    }

    Widget createIngredientsSection() {
        return SliverSafeArea(
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
        );
    }

    Widget createHowToSection() {
        return SliverList(
            delegate: SliverChildListDelegate(
                [
                    SafeArea(
                        minimum: EdgeInsets.fromLTRB(16, 0, 16, 8),
                        child: Text("How To Make",
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 13
                            )
                        ),
                    ),
                    SafeArea(
                        minimum: EdgeInsets.fromLTRB(16, 0, 16, 40),
                        child: Text(meal.instructions,
                            style: TextStyle(
                                wordSpacing: 1.5
                            ),
                        ),
                    ),
                ]
            )
        );
    }
}