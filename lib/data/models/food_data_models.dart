import 'package:logger/logger.dart';

class FoodDataModel {
  final int id;
  final String name;
  // final String description;
  // final int price;
  final String images;
  final List<String> ingredients;
  //final String category;

  FoodDataModel({
    required this.id,
    required this.name,
    // required this.description,
    // required this.price,
    required this.images,
    required this.ingredients,
    // required this.category,
  });

  factory FoodDataModel.fromJson(Map<String, dynamic> json) {
    // Logger logger = Logger();
    // logger.i("Json Data image Type Check : ${json["images"].runtimeType}");
    return FoodDataModel(
      id: json["id"],
      name: json["name"],
      // description: json["description"],
      // price: json["price"],
      images: json["image"],
      ingredients: List<String>.from(json["ingredients"]),
      //  images: List<String>.from(json["images"]),
      //category: category,
    );
  }
  //  "recipes": [
  //     {
  //       "id": 1,
  //       "name": "Classic Margherita Pizza",
  //       "ingredients": [
  //         "Pizza dough",
  //         "Tomato sauce",
  //         "Fresh mozzarella cheese",
  //         "Fresh basil leaves",
  //         "Olive oil",
  //         "Salt and pepper to taste"
  //       ],
  //       "instructions": [
  //         "Preheat the oven to 475°F (245°C).",
  //         "Roll out the pizza dough and spread tomato sauce evenly.",
  //         "Top with slices of fresh mozzarella and fresh basil leaves.",
  //         "Drizzle with olive oil and season with salt and pepper.",
  //         "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
  //         "Slice and serve hot."
  //       ],
  //       "prepTimeMinutes": 20,
  //       "cookTimeMinutes": 15,
  //       "servings": 4,
  //       "difficulty": "Easy",
  //       "cuisine": "Italian",
  //       "caloriesPerServing": 300,
  //       "tags": [
  //         "Pizza",
  //         "Italian"
  //       ],
  //       "userId": 166,
  //       "image": "https://cdn.dummyjson.com/recipe-images/1.webp",
  //       "rating": 4.6,
  //       "reviewCount": 98,
  //       "mealType": [
  //         "Dinner"
  //       ]
  //     },
}
