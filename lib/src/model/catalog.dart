class Item {
  int id;
  String name;
  // Color color;
  num price;

  // Item({
  //   required this.id,
  //   required this.name,
  // }) : color = Colors.primaries[id % Colors.primaries.length];

  Item({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

class CatalogModel {
  static List<String> itemNames = [
    'dien thoai',
    'tu lanh',
    'quan ao',
    'do gia dung',
    'do an',
  ];

  static List<num> itemPrices = [
    100.1,
    72.7,
    88,
    66,
    44.5,
  ];

  Item getById(int id) =>
      Item(id: id, name: itemNames[id], price: itemPrices[id]);

  Item getByPosition(int position) => getById(position);

  List<String> get getNames => itemNames;
}
