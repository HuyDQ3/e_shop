import 'package:e_shop/export.dart';

class Login extends Screen {
  // String _pre = addresses.location('First');
  final String _now = addresses.path('Login');
  final Map<String, String> _next = {
    'Home': addresses.path('Home'),
    'Forgot': addresses.path('Forgot'),
    'Register': addresses.path('Register'),
  };
  final String _name = 'Huy';

  Login({super.key});

  @override
  _LoginState createState() => _LoginState();

  Map<String, String> get next => _next;

  // String get pre => _pre;

  String get now => _now;
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: addresses.preArrowBackButton(context, widget._now),
          title: const Text('Login')),
      body: Wrap(
        children: [
          ElevatedButton(
              onPressed: () {
                // context.go(widget._pre);
                addresses.goPreLocation(context, widget._now);
              },
              child: const Text('return First')),
          ElevatedButton(
              onPressed: () {
                // addresses.changeLocation(context,
                //     replaceLocation: widget._next['Home'],
                //     extraObject: widget._name);
                // addresses.addOneParamInPath(
                //     addresses.path('Home'), widget._name);
                addresses.changeLocation(
                  context,
                  replaceLocation: widget._next['Home'],
                );
                // context.go('home/Huy');
              },
              child: const Text('login success with username: Huy -> Home')),
          ElevatedButton(
              onPressed: () {
                // context.go(widget._next['Forgot']!);
                addresses.changeLocation(context,
                    replaceLocation: widget._next['Forgot']);
              },
              child: const Text('Forgot')),
          ElevatedButton(
              onPressed: () {
                addresses.changeLocation(context,
                    replaceLocation: widget._next['Register']);
              },
              child: const Text('Register')),
        ],
      ),
    );
  }
}
