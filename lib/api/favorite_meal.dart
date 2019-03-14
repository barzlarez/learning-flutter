import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'favorite_model.dart';

class FavoriteMeal extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Favorites"),
            ),
            body: ScopedModelDescendant<FavoriteModel>(
                builder: (context, child, favorite) {
                    final list = favorite.favorites;
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, position) {
                            final item = list[position];
                            return ListTile(
                                leading: Image.network(item.thumbnail, width: 38, height: 38),
                                title: Text(item.mealName),
                            );
                        }
                    );
                }
            ),
        );
    }

}