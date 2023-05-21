import 'package:advance_notification/advance_notification.dart';
import 'package:e_commerce_flutter/model/base_model.dart';
import 'package:flutter/material.dart';

import '../data/app_data.dart';

class AddToCart {
  static void addToCart(Base data, BuildContext context) {
    bool contains = itemsOnCart.contains(data);

    if (contains) {
      const AdvanceSnackBar(
              textSize: 14.0,
              bgColor: Colors.red,
              message: "Cet element existe deja dans votre panier",
              mode: Mode.ADVANCE,
              duration: Duration(seconds: 5))
          .show(context);
    } else {
      itemsOnCart.add(data);
      const AdvanceSnackBar(
              textSize: 14.0,
              bgColor: Colors.green,
              message: "Element ajoute avec succes",
              mode: Mode.ADVANCE,
              duration: Duration(seconds: 5))
          .show(context);
    }
  }
}
