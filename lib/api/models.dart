class Meals extends Object {
    List<Meal> meals;

    Meals(this.meals);

    factory Meals.json(Map<String, dynamic> json) {
        var list = json['meals'] as List;
        return Meals(
            list.map((item) => Meal.json(item)).toList()
        );
    }
}

class Meal extends Object {
    final String id;
    final String mealName;
    final String drinkAlternate;
    final String category;
    final String area;
    final String instructions;
    final String thumbnail;
    final String tags;
    final String youtube;
    final String source;
    final Map<String, dynamic> json;
    List<Ingredient> ingredients;

    Meal({
             this.id,
             this.mealName,
             this.drinkAlternate,
             this.category,
             this.area,
             this.instructions,
             this.thumbnail,
             this.tags,
             this.youtube,
             this.source,
             this.json
         }) {
        ingredients = List<Ingredient>();
        for (var item in Iterable.generate(20, (pos) => pos + 1)) {
            ingredients.add(Ingredient(json['strIngredient$item'], json['strMeasure$item']));
        }
        ingredients = ingredients.where((item) {
            final ingredientEmpty = item.ingredient.trim().isEmpty;
            final measureEmpty = item.measure.trim().isEmpty;
            return !(ingredientEmpty && measureEmpty);
        }).toList();
    }

    factory Meal.json(Map<String, dynamic> json) {
        return Meal(
            id: json['idMeal'],
            mealName: json['strMeal'],
            drinkAlternate: json['strDrinkAlternate'],
            category: json['strCategory'],
            area: json['strArea'],
            instructions: json['strInstructions'],
            thumbnail: json['strMealThumb'],
            tags: json['strTags'],
            youtube: json['strYoutube'],
            json: json
        );
    }
}

class Ingredient extends Object {
    final String ingredient;
    final String measure;

    Ingredient(this.ingredient, this.measure);

    String description() {
        return "$measure of $ingredient";
    }
}