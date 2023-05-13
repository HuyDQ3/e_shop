import 'package:e_shop/export.dart';

class Account extends StatefulWidget {
  String _now;
  String _name;
  Account({Key? key, required String now, required String name})
      : _now = now,
        _name = name,
        super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late String _title = 'Welcome ${widget._name}';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(_title),
        ElevatedButton(
          // onPressed: () => context.go('/${Login().now}'),
          onPressed: () {
            addresses.goPreLocation(context, widget._now);
          },
          child: const Text('Go back to the First screen (logout)'),
        ),
      ],
    );
  }
}
