import 'package:flutter/material.dart';

class FormValidationController extends ChangeNotifier{

  final formKey = GlobalKey<FormState>();
  //==================== User Name Controller ==========
  bool userNameValidate(){
    if(formKey.currentState!.validate()){
      notifyListeners();
      return true;
    }
    return false;
  }

}