import 'package:e_shop/export.dart';

class About extends Screen {
  About({super.key});

  final String _now = addresses.path('About');
  final Map<String, String> _next = {
    'Login': addresses.path('Login'),
    'First': addresses.path('First'),
  };

  @override
  _AboutState createState() => _AboutState();

  // TODO: implement _next
  Map<String, String> get next => _next;

  // TODO: implement now
  String get now => _now;
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('about'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('Go back to the First screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            child: const Text('Go back to the Login screen'),
          ),
        ],
      ),
    );
  }
}
