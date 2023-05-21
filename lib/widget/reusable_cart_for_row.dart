import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ReusableCartForRow extends StatelessWidget {
  const ReusableCartForRow({Key? key, required this.price, required this.text})
      : super(key: key);
  final double price;
  final String text;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: theme.headline5?.copyWith(color: Colors.grey, fontSize: 16),
          ),
          RichText(
              text: TextSpan(
                  text: "FCFA",
                  style: theme.subtitle2?.copyWith(
                      color: primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                    text: price.toString(),
                    style:
                        theme.subtitle2?.copyWith(fontWeight: FontWeight.bold))
              ]))
        ],
      ),
    );
  }
}
