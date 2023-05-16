import 'package:e_shop/export.dart';

class Fcode extends Screen {
  Fcode({Key? key}) : super(key: key);

  final String _now = addresses.path('Fcode');
  final Map<String, String> _next = {
    'Home': addresses.path('Home'),
    'Forgot': addresses.path('Forgot'),
  };

  @override
  _FcodeState createState() => _FcodeState();

  // TODO: implement nextRoute
  Map<String, String> get next => _next;

  // TODO: implement now
  String get now => _now;
}

class _FcodeState extends State<Fcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('Fcode'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/home');
            },
            child: const Text('fcode is true -> go to home'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/forgot');
            },
            child: const Text('return to Forgot'),
          ),
        ],
      ),
    );
  }
}
