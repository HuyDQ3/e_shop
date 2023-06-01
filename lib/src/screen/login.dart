import 'package:e_shop/export.dart';

class Login extends Screen {
  // String _pre = addresses.location('First');
  // final String _name = 'Huy';

  Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: addresses.preArrowBackButton(context, widget._now),
          title: const Text('Login')),
      body: Wrap(
        children: [
          ElevatedButton(
              onPressed: () {
                // context.go(widget._pre);
                context.go('/');
              },
              child: const Text('return First')),
          ElevatedButton(
              onPressed: () {
                // addresses.changeLocation(context,
                //     replaceLocation: widget._next['Home'],
                //     extraObject: widget._name);
                // addresses.addOneParamInPath(
                //     addresses.path('Home'), widget._name);
                context.go('/home');
                // context.go('home/Huy');
              },
              child: const Text('login success with username: Huy -> Home')),
          ElevatedButton(
              onPressed: () {
                // context.go(widget._next['Forgot']!);
                context.push('/forgot');
              },
              child: const Text('Forgot')),
          ElevatedButton(
              onPressed: () {
                context.push('/register');
              },
              child: const Text('Register')),
          ElevatedButton(
              onPressed: () {
                context.push('/about');
              },
              child: const Text('About')),
        ],
      ),
    );
  }
}
