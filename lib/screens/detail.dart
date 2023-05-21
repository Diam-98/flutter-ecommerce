import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_flutter/methodes/add_to_cart.dart';
import 'package:e_commerce_flutter/model/base_model.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.data}) : super(key: key);
  final Base data;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedSize = 2;
  int selectedColor = 4;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    Base current = widget.data;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Hero(
                    tag: current.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(current.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: gradient,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                  )
                ],
              ),
            ),

            ///Product info
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            current.name,
                            style: theme.headline3?.copyWith(fontSize: 23),
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
                                        ?.copyWith(fontWeight: FontWeight.bold))
                              ]))
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            current.star.toString(),
                            style: theme.headline5,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${current.review} k+ commentaires",
                            style:
                                theme.headline5?.copyWith(color: Colors.grey),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.grey,
                            size: 15,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///Select size
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
                child: Text(
                  "Choisir une taille",
                  style: theme.headline3,
                ),
              ),
            ),

            ///Sizes
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.08,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: sizes.length,
                    itemBuilder: (context, index) {
                      var current = sizes[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSize = index;
                          });
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.all(10.0),
                          duration: const Duration(milliseconds: 200),
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                              color: selectedSize == index
                                  ? primaryColor
                                  : Colors.transparent,
                              border: Border.all(color: primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              current,
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: selectedSize == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),

            ///Select color
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 18.0, bottom: 10.0),
                child: Text(
                  "Choisir une couleure",
                  style: theme.headline3,
                ),
              ),
            ),

            ///Colors
            FadeInUp(
              delay: const Duration(milliseconds: 700),
              child: SizedBox(
                width: size.width,
                height: size.height * 0.08,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: colors.length,
                    itemBuilder: (context, index) {
                      var currentColor = colors[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedColor = index;
                          });
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.all(10.0),
                          duration: const Duration(milliseconds: 200),
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                              color: currentColor,
                              border: Border.all(
                                  color: selectedColor == index
                                      ? primaryColor
                                      : Colors.transparent,
                                  width: selectedColor == index ? 2 : 1),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    }),
              ),
            ),

            ///Add cart button
            FadeInUp(
                delay: const Duration(milliseconds: 800),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: MaterialButton(
                    onPressed: () {
                      AddToCart.addToCart(current, context);
                    },
                    minWidth: size.width + 0.9,
                    height: size.height * 0.07,
                    color: const Color(0xff141414),
                    child: const Text(
                      "ajouter dans panier",
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
    );
  }
}
