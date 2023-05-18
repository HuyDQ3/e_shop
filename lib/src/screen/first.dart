import 'package:e_shop/export.dart';
// import 'package:e_shop/main.dart';

class First extends Screen {
  First({super.key});

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First')),
      body: Wrap(
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // context.go(widget._next['Login'] ?? widget._now);
                    context.go('/login');
                  },
                  child: const Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    // context.go(widget._next['About']!);
                    context.go('/about');
                  },
                  child: const Text('About')),
            ],
          ),
          // Text('${widget._isLoggedIn}'),
        ],
      ),
    );
  }
}
