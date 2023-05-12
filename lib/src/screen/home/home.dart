// import 'dart:js_interop';

import 'package:e_shop/export.dart';

class Home extends Screen {
  final String _now = addresses.path('Home');
  final Map<String, String> _next = {
    'Login': addresses.path('Login'),
  };
  // Map<String, String>? _login;
  final String? _name;

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
  List<Widget> _widgetOptions = [
    Text('Index 0'),
    Text('Index 1'),
    Text('Index 2'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        // leading: addresses.preArrowBackButton(context, widget._now, iconData: Icons.logout),
        title: widget._name == null
            ? throw 'error, username is null'
            : Text('Welcome ${widget._name}!'),
      ),
      body: Wrap(
        children: [
          _widgetOptions.elementAt(_selectedIndex),
          ElevatedButton(
            // onPressed: () => context.go('/${Login().now}'),
            onPressed: () {
              addresses.goPreLocation(context, widget._now);
            },
            child: const Text('Go back to the First screen (logout)'),
          ),
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
    return WillPopScope(
      onWillPop: () =>
          addresses.onWillPop(context, widget._now, action: 'logout'),
      child: scaffold,
    );
    // return scaffold;
  }
}
