import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/urls.dart';
import 'package:food_ecommerce_app/data/api/api_caller.dart';
import 'package:food_ecommerce_app/data/models/food_data_models.dart';
import 'package:logger/logger.dart';

class FoodDataController extends ChangeNotifier {
  //----------- instance create Logger ---------
  //----------it use for colorful console code ----
  final Logger logger = Logger();

  //-------------- Recommended food data----
  List<FoodDataModel> _recommendedFoodList = [];

  List<FoodDataModel> get recommendedFoodList => _recommendedFoodList;

  //-------------- My Favorites Food List ----
  List<FoodDataModel> _myFavoritesList = [];

  double foodPrice = 320;
  double totalPrice = 320;
  double quantity = 1;

  List<FoodDataModel> get myFavoritesList => _myFavoritesList;
  int get favoritesCount => _myFavoritesList.length;

  //--------- Data Load loading Progress ----
  bool recommendedLp = false;

  //=========================== LOAD DATA -================================
  Future<void> getRecommendedFood() async {
    recommendedLp = true;
    notifyListeners();

    final response = await APICaller.fetchData(Urls.foodUrls);

    recommendedLp = false;
    notifyListeners();

    if (response != null && response is List) {
      //------------- Data Model e store -----------
      _recommendedFoodList = response
          .map((food) => FoodDataModel.fromJson(food))
          .toList();

      notifyListeners();

      logger.i("Recommended Data load Successful");
    } else {
      logger.e("Recommended Data load Failed");
    }
  }

  //======================== MY Favorite ADD ==============================
  void addToFavorites(FoodDataModel food) {
    if (isAlreadyFavorited(food.id)) {
      return;
    }
    _myFavoritesList.add(food);
    notifyListeners();
  }

  //======================== MY Favorite ADD ==============================
  void removeToFavorites(int id) {
    _myFavoritesList.removeWhere((foodId) => foodId.id == id);
    notifyListeners();
  }

  //===================== Favorites adlready add or not check ================
  bool isAlreadyFavorited(int id) {
    return _myFavoritesList.where((f) => f.id == id).isNotEmpty;
  }

  //======================= Quantiy increment ============
  void incrementQuntity() {
    quantity++;
    totalPrice = foodPrice * quantity;
    notifyListeners();
  }

  //======================= Quantiy increment ============
  void decrementQuntity() {
    if (quantity > 1) {
      quantity--;
      totalPrice = (foodPrice * quantity);

      notifyListeners();
    }
  }
}
