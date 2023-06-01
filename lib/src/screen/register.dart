import 'package:e_shop/export.dart';

class Register extends Screen {
  final String _now = 'register';
  late final Map<String, String> _next = {
    'Home': addresses.path('Home'),
    'Login': addresses.path('Login'),
  };

  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();

  // TODO: implement _next
  Map<String, String> get next => _next;

  // TODO: implement _now
  String get now => _now;
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('Register'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              addresses.changeLocation(context,
                  replaceLocation: widget._next['Login']);
            },
            child: const Text('Go back to the Login screen'),
          ),
          ElevatedButton(
            onPressed: () {
              addresses.changeLocation(context,
                  replaceLocation: widget._next['Home']);
            },
            child:
                const Text('Create account successfully -> Go to Home screen'),
          ),
        ],
      ),
    );
  }
}
