class FormValidation {
  //===================== Name Validator =================
  static String? nameValidator(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "Enter your name";
    }

    if (name.length < 3) {
      return "Name must be 3 letter";
    }

    if (RegExp(r'\d').hasMatch(name)) {
      return "name can't contain number";
    }
    return null;
  }

  //======================= Delivery Address validation ================
  static String? deliveryAddressValidator(String? address) {
    if (address == null || address.trim().isEmpty) {
      return "Enter your address";
    }

    if (address.length < 6) {
      return "address must be 6 letter";
    }
    return null;
  }

  //======================= Phone number validation ================
  static String? phoneNumberValidator(String? address) {
    if (address == null || address.trim().isEmpty) {
      return "Enter your phone number";
    }

    if (address.length < 11 || address.length > 11) {
      return "phone number must be  11 digit";
    }
    if (!RegExp(r'^\d+$').hasMatch(address)) {
      return "phone number can't contain string";
    }
    return null;
  }

  //==================== Card Holder Validation ================
  static String? validateCardHolder(String? cardHolder) {
    if (cardHolder == null || cardHolder.isEmpty)
      return "Card holder name cannot be empty";
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(cardHolder)) {
      return "Card holder name can only contain letters and spaces";
    }
    return null;
  }

  //==================== Card Number ============================
  static String? validateCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty)
      return "Card number cannot be empty";
    if (!RegExp(r'^\d+$').hasMatch(cardNumber)) {
      return "Card number can only contain digits";
    }
    if (cardNumber.length != 16) return "Card number must  be 16 digits";
    return null;
  }

  //======================= CCV Validation ===================
  static String? validateCCV(String? ccv) {
    if (ccv == null || ccv.isEmpty) return "CCV cannot \n be empty";
    if (!RegExp(r'^\d+$').hasMatch(ccv))
      return "CCV can only \n contain digits";
    if (ccv.length < 3 || ccv.length > 4) return "CCV must be 3 \n or 4 digits";
    return null;
  }

  //======================== Card Expire validation ==============
  static String? validateExpiryDate(String? date) {
    if (date == null || date.isEmpty) return "Expiry date \n cannot be empty";
    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(date)) {
      return "Expiry date must \n be in MM/YY format";
    }

    final parts = date.split('/');
    final month = int.parse(parts[0]);
    final year = int.parse('20${parts[1]}');

    final now = DateTime.now();
    final lastDateOfMonth = DateTime(year, month + 1, 0);

    if (lastDateOfMonth.isBefore(now)) {
      return "Card has expired";
    }

    return null;
  }
}
