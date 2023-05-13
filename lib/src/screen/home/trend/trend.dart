import 'package:e_shop/export.dart';

class Trend extends StatefulWidget {
  const Trend({Key? key}) : super(key: key);

  @override
  _TrendState createState() => _TrendState();
}

class _TrendState extends State<Trend> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text('Index 1'),
      ],
    );
  }
}
