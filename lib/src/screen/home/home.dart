// import 'dart:js_interop';
import 'package:e_shop/export.dart';
import 'package:e_shop/src/screen/home/account/account.dart';
import 'package:e_shop/src/screen/home/search.dart';
import 'package:e_shop/src/screen/home/trend/trend.dart';

class Home extends Screen {
  String _now = addresses.path('Home');
  final Map<String, String> _next = {
    'Login': addresses.path('Login'),
    'Search': addresses.path('Search'),
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
  bool _isSearch = false;
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

  void _onSearchTapped(bool isSearch) {
    setState(() {
      _isSearch = isSearch;
    });
  }

  Widget _search() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: SizedBox(
            // constraints: BoxConstraints.tightForFinite(
            //     height: 40, width: double.infinity),
            height: 40,
            child: TextButton(
              onPressed: () {
                addresses.changeLocation(context,
                    replaceLocation: widget._next['Search']);
              },
              child: Row(
                children: [
                  Text(
                    'Search product!',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            // child: TextField(
            //   canRequestFocus: false,
            //   onTap: () {
            //     addresses.changeLocation(context,
            //         replaceLocation: widget._next['Search']);
            //   },
            //   decoration: InputDecoration(
            //     // icon: Icon(Icons.search),
            //     prefixIcon: Icon(Icons.search),
            //     hintText: 'Search here!',
            //     // border: OutlineInputBorder(
            //     //   borderSide: BorderSide(width: 2, color: Colors.white),
            //     // ),
            //     // enabledBorder: OutlineInputBorder(
            //     //   borderSide: BorderSide(width: 2, color: Colors.white),
            //     // ),
            //     border: InputBorder.none,
            //   ),
            // ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 50,
          // height: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ),
        SizedBox(
          width: 50,
          // height: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ),
      ],
    );
  }

  Widget _title(int index) {
    switch (index) {
      case 0:
        return _search();
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
        leading: IconButton(
          onPressed: () {
            addresses.changeLocation(context,
                replaceLocation: widget._next['Search']);
          },
          icon: Icon(Icons.search),
        ),
        backgroundColor: Colors.deepOrange[200],
        automaticallyImplyLeading: false,
        // actions: [Icon(Icons.notifications)],
        // title: widget._name == null
        //     ? throw 'error, username is null'
        //     : Text('Welcome ${widget._name}!'),
        // actions: <Widget>[
        //   Icon(Icons.search),
        // ],
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
            icon: Icon(Icons.shop_2_outlined),
            activeIcon: Icon(Icons.shop_2),
            label: 'Shop',
            tooltip: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_outlined),
            activeIcon: Icon(Icons.trending_up),
            label: 'Trend',
            tooltip: 'Trend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            activeIcon: Icon(Icons.account_box_rounded),
            label: 'Account',
            tooltip: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange[200],
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
