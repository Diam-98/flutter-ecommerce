import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_flutter/data/app_data.dart';
import 'package:e_commerce_flutter/model/base_model.dart';
import 'package:e_commerce_flutter/model/category_model.dart';
import 'package:e_commerce_flutter/screens/detail.dart';
import 'package:e_commerce_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Top two text
              FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                            text: "E-Comm",
                            style: theme.headline1,
                            children: [
                              TextSpan(
                                text: "Style",
                                style: theme.headline1?.copyWith(
                                  color: primaryColor,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold
                                )
                              )
                            ]
                          )
                      ),
                      RichText(
                          text: const TextSpan(
                              text: "Soyez plus style",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),
                              children: [
                                TextSpan(
                                  text: "Suggestions :)",

                                )
                              ]
                          )
                      )
                    ],
                  ),
                ),
              ),

              //Categories
              FadeInUp(
                delay: const Duration(milliseconds: 45),
                child: Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: size.width,
                  height: size.height * 0.14,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (ctx, index){
                        Category current = categories[index];

                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(current.imageUrl),
                              ),
                              SizedBox(
                                height: size.height * 0.008,
                              ),
                              Text(
                                current.title,
                                style: theme.subtitle1,
                              )
                            ],
                          ),
                        );
                  }),
                ),
              ),

              //Product grid
              FadeInUp(
                delay: const Duration(milliseconds: 750),
                child: Container(
                  width: size.width,
                  height: size.height * 0.74,
                  color: Colors.white,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                      itemCount: mainList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        childAspectRatio: 0.63
                      ),
                      itemBuilder: (ctx, index){
                        Base current = mainList[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)
                                    => Details(data: mainList[index],)
                                )
                            );
                          },
                          child: Column(
                            children: [
                              Hero(
                                tag: current.id,
                                child: Container(
                                  width: size.width * 0.5,
                                  height: size.height * 0.3,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    image: DecorationImage(
                                      image: AssetImage(current.imageUrl),
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  current.name,
                                  style: theme.headline2,
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                    text: "FCFA",
                                    style: theme.subtitle2?.copyWith(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                    children: [
                                      TextSpan(
                                        text: current.price.toString(),
                                        style: theme.subtitle2?.copyWith(
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    ]
                                  )
                              )
                            ],
                          ),
                        );
                      }
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
