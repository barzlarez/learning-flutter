import 'dart:collection';

import 'package:scoped_model/scoped_model.dart';

import 'models.dart';

class FavoriteModel extends Model {

    final List<Meal> _meals = [];

    UnmodifiableListView<Meal> get favorites => UnmodifiableListView(_meals);

    void addItem(Meal meal) {
        _meals.add(meal);
        notifyListeners();
    }

    void remove(Meal meal) {
        _meals.remove(meal);
        notifyListeners();
    }

    bool isAdded(Meal meal) {
        try {
            return _meals.firstWhere((item){ return item.id == meal.id; }) != null;
        } catch (error) {
            return false;
        }
    }
}