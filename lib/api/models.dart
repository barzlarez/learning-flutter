
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
//    final String ingredient1;
//    final String ingredient2;
//    final String ingredient3;
//    final String ingredient4;
//    final String ingredient5;
//    final String ingredient6;
//    final String ingredient7;
//    final String ingredient8;
//    final String ingredient9;
//    final String ingredient10;
//    final String ingredient11;
//    final String ingredient12;
//    final String ingredient13;
//    final String ingredient14;
//    final String ingredient15;
//    final String ingredient16;
//    final String ingredient17;
//    final String ingredient18;
//    final String ingredient19;
//    final String ingredient20;
//    final String measure1;
//    final String measure2;
//    final String measure3;
//    final String measure4;
//    final String measure5;
//    final String measure6;
//    final String measure7;
//    final String measure8;
//    final String measure9;
//    final String measure10;
//    final String measure11;
//    final String measure12;
//    final String measure13;
//    final String measure14;
//    final String measure15;
//    final String measure16;
//    final String measure17;
//    final String measure18;
//    final String measure19;
//    final String measure20;
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
//             this.ingredient1,
//             this.ingredient2,
//             this.ingredient3,
//             this.ingredient4,
//             this.ingredient5,
//             this.ingredient6,
//             this.ingredient7,
//             this.ingredient8,
//             this.ingredient9,
//             this.ingredient10,
//             this.ingredient11,
//             this.ingredient12,
//             this.ingredient13,
//             this.ingredient14,
//             this.ingredient15,
//             this.ingredient16,
//             this.ingredient17,
//             this.ingredient18,
//             this.ingredient19,
//             this.ingredient20,
//             this.measure1,
//             this.measure2,
//             this.measure3,
//             this.measure4,
//             this.measure5,
//             this.measure6,
//             this.measure7,
//             this.measure8,
//             this.measure9,
//             this.measure10,
//             this.measure11,
//             this.measure12,
//             this.measure13,
//             this.measure14,
//             this.measure15,
//             this.measure16,
//             this.measure17,
//             this.measure18,
//             this.measure19,
//             this.measure20,
             this.source,
             this.json
         }) {
        ingredients = List<Ingredient>();
        for (var item in Iterable.generate(20, (pos) => pos + 1)) {
            ingredients.add(Ingredient(json['strIngredient$item'], json['strMeasure$item']));
        }
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
//            ingredient1: json['strIngredient1'],
//            ingredient2: json['strIngredient2'],
//            ingredient3: json['strIngredient3'],
//            ingredient4: json['strIngredient4'],
//            ingredient5: json['strIngredient5'],
//            ingredient6: json['strIngredient6'],
//            ingredient7: json['strIngredient7'],
//            ingredient8: json['strIngredient8'],
//            ingredient9: json['strIngredient9'],
//            ingredient10: json['strIngredient10'],
//            ingredient11: json['strIngredient11'],
//            ingredient12: json['strIngredient12'],
//            ingredient13: json['strIngredient13'],
//            ingredient14: json['strIngredient14'],
//            ingredient15: json['strIngredient15'],
//            ingredient16: json['strIngredient16'],
//            ingredient17: json['strIngredient17'],
//            ingredient18: json['strIngredient18'],
//            ingredient19: json['strIngredient19'],
//            ingredient20: json['strIngredient20'],
//            measure1: json['strMeasure1'],
//            measure2: json['strMeasure2'],
//            measure3: json['strMeasure3'],
//            measure4: json['strMeasure4'],
//            measure5: json['strMeasure5'],
//            measure6: json['strMeasure6'],
//            measure7: json['strMeasure7'],
//            measure8: json['strMeasure8'],
        );
    }

//    List<Ingredient> getIngredients() {
//        var ingredients = List<Ingredient>();
//        ingredients.add(Ingredient(ingredient1, measure1));
//        ingredients.add(Ingredient(ingredient2, measure2));
//        ingredients.add(Ingredient(ingredient3, measure3));
//        ingredients.add(Ingredient(ingredient4, measure4));
//        ingredients.add(Ingredient(ingredient5, measure5));
//        ingredients.add(Ingredient(ingredient6, measure6));
//        ingredients.add(Ingredient(ingredient7, measure7));
//        ingredients.add(Ingredient(ingredient8, measure8));
//        ingredients.add(Ingredient(ingredient9, measure9));
//        ingredients.add(Ingredient(ingredient10, measure10));
//        ingredients.add(Ingredient(ingredient11, measure11));
//        ingredients.add(Ingredient(ingredient12, measure12));
//        ingredients.add(Ingredient(ingredient13, measure13));
//        ingredients.add(Ingredient(ingredient14, measure14));
//        ingredients.add(Ingredient(ingredient15, measure15));
//        ingredients.add(Ingredient(ingredient16, measure16));
//        ingredients.add(Ingredient(ingredient17, measure17));
//        ingredients.add(Ingredient(ingredient18, measure18));
//        ingredients.add(Ingredient(ingredient19, measure19));
//        ingredients.add(Ingredient(ingredient20, measure20));
//        return ingredients;
//    }
}

class Ingredient extends Object {
    final String ingredient;
    final String measure;

    Ingredient(this.ingredient, this.measure);

    String description() {
        return "$measure of $ingredient";
    }
}