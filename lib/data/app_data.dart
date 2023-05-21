import 'package:e_commerce_flutter/model/base_model.dart';
import 'package:e_commerce_flutter/model/category_model.dart';

List<Category> categories = [
  Category(imageUrl: "assets/images/kids.jpg", title: "Enfants"),
  Category(imageUrl: "assets/images/mens.jpg", title: "Hommes"),
  Category(imageUrl: "assets/images/women.jpg", title: "Femmes"),
  Category(imageUrl: "assets/images/shoes.jpg", title: "Chaussures"),
  Category(imageUrl: "assets/images/bags.jpg", title: "Sacs"),
  Category(imageUrl: "assets/images/glass.jpg", title: "Lunettes"),
  Category(imageUrl: "assets/images/hat.jpg", title: "Chapeaux"),
];

List<Base> mainList = [
  Base(
      id: 1,
      imageUrl: "assets/images/mens.jpg",
      name: "Pantalons Jeans",
      price: 8500,
      review: 3.6,
      star: 4.8,
      value: 1
  ),
  Base(
      id: 2,
      imageUrl: "assets/images/blazer.jpg",
      name: "Blue Coat",
      price: 7000,
      review: 5.6,
      star: 5.0,
      value: 1
  ),
  Base(
      id: 3,
      imageUrl: "assets/images/jacket.jpg",
      name: "Jacket verte",
      price: 10000,
      review: 2.6,
      star: 3.7,
      value: 1
  ),
  Base(
      id: 4,
      imageUrl: "assets/images/mens.jpg",
      name: "Pantalons Jeans",
      price: 8500,
      review: 3.6,
      star: 4.8,
      value: 1
  ),
  Base(
    imageUrl: "assets/images/shirt.jpg",
    name: "Orange Shirt",
    price: 4000,
    review: 1.4,
    star: 2.4,
    id: 5,
    value: 1,
  ),
  Base(
    imageUrl: "assets/images/sw.jpg",
    name: "Pullover Gris",
    price: 3900,
    review: 4.2,
    star: 1.8,
    id: 6,
    value: 1,
  ),
  Base(
    imageUrl: "assets/images/women.jpg",
    name: "Pullover Sleeveless",
    price: 4000,
    review: 2.1,
    star: 3.1,
    id: 7,
    value: 1,
  ),
  Base(
    imageUrl: "assets/images/womens.jpg",
    name: "Black Coat",
    price: 5000,
    review: 3.1,
    star: 4.8,
    id: 7,
    value: 1,
  ),
  Base(
    imageUrl: "assets/images/t-shirt.jpg",
    name: " T-Shirt blanc",
    price: 4500,
    review: 2.6,
    star: 4.8,
    id: 8,
    value: 1,
  ),
];

List<Base> itemsOnCart = [];
List<Base> itemsOnSearch = [];