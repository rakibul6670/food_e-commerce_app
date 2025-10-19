import 'package:flutter/material.dart';

class PayCardFormProvider extends ChangeNotifier {
  //------------------ Form key --------------------------
  final formKey = GlobalKey<FormState>();

  //------------------------  Controller ------------
  final TextEditingController cardHoldNController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardDateController = TextEditingController();
  final TextEditingController cardVCCController = TextEditingController();

  //==================== User Order Validate ==========
  bool payCardValidate() {
    return formKey.currentState!.validate();
  }

  //=========================== Clear Form Field ===============
  void clearFormField() {
    cardHoldNController.clear();
    cardVCCController.clear();
    cardNumberController.clear();
    cardDateController.clear();
  }

  //======================= Dispose Controller ==================
  @override
  void dispose() {
    cardHoldNController.dispose();
    cardVCCController.dispose();
    cardNumberController.dispose();
    cardDateController.dispose();
    super.dispose();
  }
}
