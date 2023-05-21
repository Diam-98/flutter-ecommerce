import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_flutter/model/base_model.dart';
import 'package:e_commerce_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

import '../data/app_data.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              ///Search field
              FadeInUp(
                delay: const Duration(milliseconds: 50),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: TextField(
                      controller: _controller,
                      onChanged: (value){},
                      style: theme.headline3?.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                _controller.clear();
                              });
                            },
                            icon: const Icon(Icons.close)
                        ),
                        hintStyle: theme.headline3?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey[600]
                        ),
                        hintText: "Chaussures",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(13)
                        )
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
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
                          onTap: (){},
                          child: Column(
                            children: [
                              Container(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
