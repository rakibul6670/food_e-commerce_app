import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  //------------------ Form key --------------------------
  final formKey = GlobalKey<FormState>();
  //------------------------ User Name Controller ------------
  final TextEditingController userNameController = TextEditingController();

  //==================== User Name Controller ==========
  bool userNameValidate() {
    if (formKey.currentState!.validate()) {
      notifyListeners();
      return true;
    }
    return false;
  }

  //=================== Dispose controller ==============

  // @override
  // void dispose() {
  //   userNameController.dispose();
  //   super.dispose();
  // }
}
