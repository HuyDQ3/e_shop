import 'package:e_shop/export.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  late Widget _appBar = Search(isTapped: false);

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: PreferredSize(
          child: _appBar,
          preferredSize: Size.fromHeight(HeightAndWidth().appBarHeight)),
      body: Wrap(
        children: [
          Text('Shop'),
        ],
      ),
    );
    return scaffold;
  }
}
