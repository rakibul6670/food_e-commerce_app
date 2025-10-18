import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_ecommerce_app/core/constants/urls.dart';
import 'package:food_ecommerce_app/data/api/api_caller.dart';
import 'package:food_ecommerce_app/data/models/food_data_models.dart';
import 'package:logger/logger.dart';

class FoodDataController extends ChangeNotifier{
  //----------- instance create Logger ---------
  //----------it use for colorful console code ----
  final Logger logger = Logger();

  //-------------- Recommended food data----
  List<FoodDataModel> recommendedFoodList = [];

  //--------- Data Load loading Progress ----
  bool recommendedLp = false;

  //--------------------- Load data -----------------------------------
 Future<void> getRecommendedFood() async{
   recommendedLp = true;
   notifyListeners();

   final response = await APICaller.fetchData(Urls.foodUrls);

   recommendedLp = false;
   notifyListeners();

   if(response != null && response is List){

   //  final List<dynamic> encodedData = json.decode(response);
     //------------- Data Model e store -----------
     recommendedFoodList = response.map((food)=> FoodDataModel.fromJson(food)).toList();
     notifyListeners();
     logger.i("Recommended Data load Successful");
   }
   else{
     logger.e("Recommended Data load Failed");
   }
 }

}