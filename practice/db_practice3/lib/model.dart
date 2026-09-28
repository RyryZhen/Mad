import 'dart:ui';

class Item {
  int? id;
  late String name;
  //Color color;

  Item({this.id, required this.name, });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(name: map['name'], id: map['id']);
  // }
}
