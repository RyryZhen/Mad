class Item {
  int? id;
  late var name;

  Item({this.id, required this.name});

  Map<String, dynamic> tomap() {
    var map = {'id': id, 'name': name};
    return map;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(id: map['id'], name: map['name']);
  }
}
