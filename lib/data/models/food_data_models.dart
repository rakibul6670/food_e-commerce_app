import 'package:logger/logger.dart';

class FoodDataModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final List<String> images;
  //final String category;

  FoodDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
   // required this.category,
  });

  factory FoodDataModel.fromJson(Map<String ,dynamic> json) {
    Logger logger = Logger();
    logger.i("Json Data image Type Check : ${json["images"].runtimeType}");
    return FoodDataModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      images: List<String>.from(json["images"]),
      //category: category,
    );
  }
  // {
  // "id": 163,
  // "title": "Advanced Device",
  // "slug": "advanced-device",
  // "price": 36,
  // "description": "A description",
  // "category": {
  // "id": 10,
  // "name": "category_B",
  // "slug": "category-b",
  // "image": "https://pravatar.cc/",
  // "creationAt": "2025-10-16T21:06:10.000Z",
  // "updatedAt": "2025-10-16T21:06:10.000Z"
  // },
  // "images": [
  // "https://placehold.co/600x400"
  // ],
  // "creationAt": "2025-10-17T03:07:58.000Z",
  // "updatedAt": "2025-10-17T09:12:17.000Z"
  // },
}
