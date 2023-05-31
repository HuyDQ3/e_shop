import 'dart:js';

import 'package:e_shop/export.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatefulWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  _MyCatalogState createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {
  @override
  Widget build(BuildContext context) {
    // return SliverList(
    //   delegate: SliverChildBuilderDelegate(
    //     (context, index) => _MyListItem(
    //        index: index,
    //     ),
    //   ),
    // );
    var catalog = context.read<CatalogModel>();
    return ListView.builder(
      itemBuilder: (context, index) => _MyListItem(index: index),
      itemCount: catalog.getNames.length,
    );
  }
}

class _MyListItem extends StatelessWidget {
  int index;

  _MyListItem({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Item item =
        context.select<CatalogModel, Item>((catalog) => catalog.getById(index));
    return Container(
      child: Row(
        children: [
          Text(item.name),
          _AddButton(item: item),
        ],
      ),
    );
  }
}

// class _AddButton extends StatelessWidget {
// Item item;

// _AddButton({required this.item, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool _isInCart =
//         context.select<CartModel, bool>((cart) => cart.items.contains(item));

//     return Checkbox(value: , onChanged: onChanged);
//   }
// }

class _AddButton extends StatelessWidget {
  Item item;

  _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isInCart =
        context.select<CartModel, bool>((cart) => cart.items.contains(item));

    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Checkbox(
          value: _isInCart,
          onChanged: (value) {
            if (value != null) {
              if (value) {
                cart.add(item);
              } else {
                cart.remove(item);
              }
            } else {}
          },
        );
      },
    );
  }
}
