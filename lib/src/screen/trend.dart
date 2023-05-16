import 'package:e_shop/export.dart';

class Trend extends StatefulWidget {
  const Trend({Key? key}) : super(key: key);

  @override
  _TrendState createState() => _TrendState();
}

class _TrendState extends State<Trend> {
  late Widget _appBar = Search(isTapped: false);

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: PreferredSize(
          child: _appBar,
          preferredSize: Size.fromHeight(HeightAndWidth().appBarHeight)),
      body: Wrap(
        children: [
          Text('Trend'),
        ],
      ),
    );
    return scaffold;
  }
}
