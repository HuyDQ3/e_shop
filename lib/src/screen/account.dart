import 'package:e_shop/export.dart';

class Account extends StatefulWidget {
  String _name;
  Account({Key? key, required String name})
      : _name = name,
        super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late String _title = 'Welcome ${widget._name}';
  AppBar _appBar = AppBar(
    title: Text('Account Title'),
    backgroundColor: StyleColor().backgroundTitle,
    toolbarHeight: HeightAndWidth().appBarHeight,
  );

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: _appBar,
      body: Wrap(
        children: [
          Text(_title),
          ElevatedButton(
            // onPressed: () => context.go('/${Login().now}'),
            onPressed: () {
              context.go('/login');
            },
            child: const Text('Go back to the login screen (logout)'),
          ),
        ],
      ),
    );
    return scaffold;
  }
}
