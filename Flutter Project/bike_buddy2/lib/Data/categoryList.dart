import 'package:bike_buddy2/Models/categoryCard.dart';
import 'package:flutter/material.dart';

//lib\Data\categoryList.dart
List<BikeCategory> categories = [
  BikeCategory(
    id: 1,
    type: 'ROAD',
    color: Color.fromARGB(255, 113, 155, 174),
    iconPath: 'assets/catIcon/roadbike.png',
  ),
  BikeCategory(
    id: 2,
    type: 'MOUNTAIN',
    color: Color(0xFF2E7D32),
    iconPath: 'assets/catIcon/mountain.png',
  ),
  BikeCategory(
    id: 3,
    type: 'X-CROSS',
    color: Color(0xFFFF8F00),
    iconPath: 'assets/catIcon/xc.png',
  ),
  BikeCategory(
    id: 4,
    type: 'CRITERIUM',
    color: Color(0xFF283593),
    iconPath: 'assets/catIcon/crit.png',
  ),
  BikeCategory(
    id: 5,
    type: 'FIXIE',
    color: Color(0xFFC62828),
    iconPath: 'assets/catIcon/fixie.png',
  ),
];
