import 'package:flutter/material.dart';

class OrderFormProvider extends ChangeNotifier {
  //------------------ Form key --------------------------
  final formKey = GlobalKey<FormState>();

  //------------------------  Controller ------------
  final TextEditingController orderAController = TextEditingController();
  final TextEditingController orderPNController = TextEditingController();

  //==================== User Order Validate ==========
  bool userOrderValidate() {
    return formKey.currentState!.validate();
  }

  //=========================== Clear Form Field ===============
  // void clearFormField() {
  //   orderAController.clear();
  //   orderPNController.clear();
  // }

  //======================= Dispose Controller ==================
  //------- this method use automatic called when we use global or wrap widget- otherwise manually dispose , it don't work
  @override
  void dispose() {
    orderAController.dispose();
    orderPNController.dispose();
    super.dispose();
  }
}
