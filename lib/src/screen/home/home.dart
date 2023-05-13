// import 'dart:js_interop';
import 'package:e_shop/export.dart';
import 'package:e_shop/src/screen/home/account/account.dart';
import 'package:e_shop/src/screen/home/trend/trend.dart';

class Home extends Screen {
  String _now = addresses.path('Home');
  final Map<String, String> _next = {
    'Login': addresses.path('Login'),
  };
  // Map<String, String>? _login;
  String? _name;

  Home({Key? key, required String? name})
      : _name = name,
        super(key: key);

  // TODO: implement _next
  Map<String, String> get next => _next;

  // @override
  // // TODO: implement preRoute
  // String get pre => _pre;

  // TODO: implement _now
  String get now => _now;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions = [
    Shop(),
    Trend(),
    Account(now: addresses.path('Home'), name: widget._name ?? '?'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _title(int index) {
    switch (index) {
      case 0:
        return Text('title 0');
      case 1:
        return Text('title 1');
      case 2:
        return Text('title 2');
      default:
        return Text('title default');
    }
  }

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Icon(Icons.notifications)],
        // title: widget._name == null
        //     ? throw 'error, username is null'
        //     : Text('Welcome ${widget._name}!'),
        title: _title(_selectedIndex),
      ),
      body: Wrap(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {
          //       Login().setIsLoggedIn(false);
          //     });
          //     context.go('/${Login()._next}');
          //   },
          //   child: const Text('logout'),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.shop), label: 'Shop', tooltip: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_down),
              label: 'Trend',
              tooltip: 'Trend'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_rounded),
              label: 'Account',
              tooltip: 'Account'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
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
