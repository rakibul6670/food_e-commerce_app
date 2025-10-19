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
  //-------------- My Basket Food List ----
  List<FoodDataModel> _myBasketList = [];

  double _foodPrice = 320;
  double _totalPrice = 320;
  double _quantity =1;

  double get foodPrice => _foodPrice;
  double get totalBasketPrice => foodPrice * _myBasketList.length;
  double get totalPrice => _totalPrice;
  double get quantity => _quantity;

  List<FoodDataModel> get myFavoritesList => _myFavoritesList;
  int get favoritesCount => _myFavoritesList.length;

  List<FoodDataModel> get myBasketList => _myBasketList;
  int get basketCount => _myBasketList.length;

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

  //======================= Quantity increment ============
  void incrementQuantity() {
    _quantity++;
    _totalPrice = foodPrice * quantity;
    notifyListeners();
  }

  //======================= Quantity increment ============
  void decrementQuantity() {
    if (quantity > 1) {
      _quantity--;
      _totalPrice = (foodPrice * quantity);
      notifyListeners();
    }
  }

  //======================== MY Basket ADD ==============================
  void addToBasket(FoodDataModel food) {
    if (isAlreadyFavorited(food.id)) {
      return;
    }
    _myBasketList.add(food);
    notifyListeners();
  }

  //======================== MY Basket ADD ==============================
  void removeToBasket(int id) {
    _myBasketList.removeWhere((foodId) => foodId.id == id);
    notifyListeners();
  }

  //===================== Basket already add or not check ================
  bool isAlreadyBasket(int id) {
    return _myBasketList.where((f) => f.id == id).isNotEmpty;
  }


  //=================== Total Basket Price ============
 // void totalBasketPrice (){
 //    for(var price in _myBasketList){
 //
 //    }
 }



