import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_flutter/data/app_data.dart';
import 'package:e_commerce_flutter/main_wrapper.dart';
import 'package:e_commerce_flutter/model/base_model.dart';
import 'package:e_commerce_flutter/widget/reusable_cart_for_row.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double calculateSubTotalPrice() {
    double total = 0.0;
    if (itemsOnCart.isEmpty) {
      total = 0.0;
    } else {
      for (Base data in itemsOnCart) {
        total = total + data.price * data.value;
      }
    }
    return total;
  }

  double calculateShipping() {
    double shipping = 0.0;
    if (itemsOnCart.isEmpty) {
      shipping = 0.0;
    } else if (itemsOnCart.length <= 4) {
      shipping = 1000.0;
    } else {
      shipping = 2000.0;
    }

    return shipping;
  }

  double calculateTotalPrice() {
    double total = 0.0;
    if (itemsOnCart.isEmpty) {
      total = 0.0;
    } else {
      total = calculateSubTotalPrice() + calculateShipping();
    }

    return total;
  }

  void onDelete(Base data) {
    setState(() {
      if (itemsOnCart.length == 1) {
        itemsOnCart.clear();
      } else {
        itemsOnCart.removeWhere((element) => element.id == data.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Mon panier",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                color: Colors.black,
              ))
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.6,
              child: itemsOnCart.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: itemsOnCart.length,
                      itemBuilder: (context, index) {
                        var current = itemsOnCart[index];
                        return FadeInUp(
                          delay: Duration(milliseconds: 100 * index + 80),
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            width: size.width,
                            height: size.height * 0.25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5.0),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(current.imageUrl),
                                          fit: BoxFit.cover),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            blurRadius: 4,
                                            color: Color.fromARGB(61, 0, 0, 0))
                                      ]),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.52,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              current.name,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                            IconButton(
                                                onPressed: () =>
                                                    onDelete(current),
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.grey,
                                                ))
                                          ],
                                        ),
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
                                                text: current.price.toString(),
                                                style: theme.subtitle2
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold))
                                          ])),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: size.height * 0.09),
                                        width: size.width * 0.4,
                                        height: size.height * 0.04,
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.all(4.0),
                                              width: size.width * 0.065,
                                              height: size.height * 0.045,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                onTap: () {
                                                  setState(() {
                                                    if (current.value > 1) {
                                                      current.value--;
                                                    } else {
                                                      onDelete(current);
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  size: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      size.width * 0.02),
                                              child: Text(
                                                current.value.toString(),
                                                style: theme.subtitle2
                                                    ?.copyWith(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.all(4.0),
                                              width: size.width * 0.065,
                                              height: size.height * 0.045,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                onTap: () {
                                                  setState(() {
                                                    current.value >= 0
                                                        ? current.value++
                                                        : null;
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  size: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                  : Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 200),
                          child: const Image(
                            image: AssetImage("assets/images/empty.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 250),
                          child: const Text(
                            "Votre panier est vide veuillez ajouter des produits !",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 300),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainWrapper()));
                            },
                            icon: const Icon(Icons.add_shopping_cart),
                          ),
                        )
                      ],
                    ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.36,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 12.0),
                  child: Column(
                    children: [
                      FadeInUp(
                        delay: const Duration(milliseconds: 350),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Promo/Student Code or vourcher",
                              style: theme.headline3?.copyWith(fontSize: 16),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      FadeInUp(
                          delay: const Duration(milliseconds: 400),
                          child: ReusableCartForRow(
                              price: calculateTotalPrice(),
                              text: 'Sous Total')),
                      FadeInUp(
                          delay: const Duration(milliseconds: 450),
                          child: ReusableCartForRow(
                              price: calculateShipping(), text: 'Livraison')),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      FadeInUp(
                          delay: const Duration(milliseconds: 500),
                          child: ReusableCartForRow(
                              price: calculateSubTotalPrice(), text: 'Total')),
                      FadeInUp(
                          delay: const Duration(milliseconds: 550),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15.0),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Cart()));
                              },
                              minWidth: size.width + 0.9,
                              height: size.height * 0.07,
                              color: const Color(0xff141414),
                              child: const Text(
                                "Payer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
