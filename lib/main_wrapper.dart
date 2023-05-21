import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_flutter/screens/cart.dart';
import 'package:e_commerce_flutter/screens/home.dart';
import 'package:e_commerce_flutter/screens/search.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final int _index = 0;
  bool isSearchActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
          color: Colors.black,
        ),
        title: isSearchActive
            ? FadeIn(
                delay: const Duration(milliseconds: 300),
                child: const Text(
                  "Recherche",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )
            : FadeIn(
                delay: const Duration(milliseconds: 300),
                child: const Text(
                  "Accueil",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchActive = !isSearchActive;
                });
              },
              icon: isSearchActive
                  ? const Icon(
                      Icons.search_off,
                      color: Colors.black,
                      size: 30,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
      body: isSearchActive ? const Search() : const Home(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedFontSize: 16.0,
        unselectedFontSize: 16.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Compte',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
            ),
            label: 'Panier',
          ),
        ],
        currentIndex: _index,
        onTap: (index) {},
      ),
    );
  }
}
