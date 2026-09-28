// class Item {
//   int? id;
//   String name;

//   Item({this.id, required this.name});

//   Map<String, dynamic> toMap() {
//     return {'id': id, 'name': name};
//   }

//   factory Item.fromMap(Map<String, dynamic> map) {
//     return Item(id: map['id'], name: map['name']);
//   }
// }
// //item.d
class Item {
  int? id;
  String name;
  Item({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(name: map['name'], id: map['id']);
  }
}
