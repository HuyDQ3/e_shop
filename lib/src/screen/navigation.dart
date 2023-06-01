import 'package:e_shop/export.dart';

class ShellNavigatior extends StatefulWidget {
  Widget child;

  ShellNavigatior({required this.child, Key? key}) : super(key: key);

  @override
  _ShellNavigatiorState createState() => _ShellNavigatiorState();
}

class _ShellNavigatiorState extends State<ShellNavigatior> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: _calculateSelectedAppBarTitle(context),
      //   backgroundColor: StyleColor().backgroundTitle,
      //   automaticallyImplyLeading: false,
      // ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop_2_outlined),
            activeIcon: Icon(Icons.shop_2),
            label: 'Shop',
            tooltip: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications),
            label: 'Notify',
            tooltip: 'Notify',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            activeIcon: Icon(Icons.account_box_rounded),
            label: 'Account',
            tooltip: 'Account',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        selectedItemColor: StyleColor().selectedItemNavigator,
        unselectedItemColor: StyleColor().unselectedItemNavigator,
        backgroundColor: StyleColor().backgroundNavigator,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: StyleColor().background,
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  Widget _calculateSelectedAppBarTitle(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      print(location);
      return Search(isTapped: false);
    }
    if (location.startsWith('/shop')) {
      print(location);
      return Search(isTapped: false);
    }
    if (location.startsWith('/notification')) {
      print(location);
      return Search(isTapped: false);
    }
    if (location.startsWith('/account')) {
      print(location);
      return Text('Title Account');
    }
    return Text('Title Default');
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/home')) {
      print(location);
      return 0;
    }
    if (location.startsWith('/shop')) {
      print(location);
      return 1;
    }
    if (location.startsWith('/notification')) {
      print(location);
      return 2;
    }
    if (location.startsWith('/account')) {
      print(location);
      return 3;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/shop');
        break;
      case 2:
        context.go('/notification');
        break;
      case 3:
        context.go('/account');
        break;
      default:
        context.go('/home');
        break;
    }
  }
}
