import 'package:e_shop/export.dart';

class Forgot extends Screen {
  Forgot({Key? key}) : super(key: key);

  final String _now = addresses.path('Forgot');
  final Map<String, String> _next = {
    'ByMail': addresses.path('ByMail'),
    'ByPhone': addresses.path('ByPhone'),
    'Login': addresses.path('Login'),
  };
  @override
  _ForgotState createState() => _ForgotState();

  Map<String, String> get next => _next;

  String get now => _now;
}

class _ForgotState extends State<Forgot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('Forgot'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/forgot/bymail');
            },
            child: const Text('by email'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/forgot/byphone');
            },
            child: const Text('by phone'),
          ),
        ],
      ),
    );
  }
}
