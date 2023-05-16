// import 'dart:js_interop';
import 'package:e_shop/export.dart';

class Home extends Screen {
  // Map<String, String>? _login;
  String? _name;

  Home({Key? key, required String? name})
      : _name = name,
        super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget _appBar = Search(isTapped: false);

  Widget _home(String? name) {
    return Text('Halo $name');
  }

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: PreferredSize(
          child: _appBar,
          preferredSize: Size.fromHeight(HeightAndWidth().appBarHeight)),
      body: Wrap(
        children: [_home(widget._name)],
      ),
    );
    // return WillPopScope(
    //   onWillPop: () =>
    //       addresses.onWillPop(context, widget._now, action: 'logout'),
    //   child: scaffold,
    // );
    return scaffold;
  }
}
