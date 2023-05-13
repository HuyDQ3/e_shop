import 'package:e_shop/export.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text('Index 0 Shop'),
      ],
    );
  }
}
