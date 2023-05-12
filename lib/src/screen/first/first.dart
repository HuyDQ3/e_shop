import 'package:e_shop/export.dart';
// import 'package:e_shop/main.dart';

class First extends Screen {
  First({super.key});

  final String _now = addresses.path('First');
  final Map<String, String> _next = {
    'Login': addresses.path('Login'),
    'About': addresses.path('About'),
  };
  // String _pre = '/';

  @override
  _FirstState createState() => _FirstState();

  void fixAddress() {
    addresses.fixAddressIfNonLinearAccess(_now);
  }

  void adrs() {
    print(addresses.foldAddress());
  }

  // TODO: implement _next
  Map<String, String> get next => _next;

  // @override
  // // TODO: implement preRoute
  // String get pre => _pre;

  // TODO: implement now
  String get now => _now;
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    // widget
    // ..adrs()
    // .fixAddress()
    // ..adrs();
    // widget.fixAddress();
    return Scaffold(
      appBar: AppBar(title: const Text('First')),
      body: Wrap(
        children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // context.go(widget._next['Login'] ?? widget._now);
                    addresses.goLocation(context,
                        now: widget._now, next: widget._next['Login']);
                  },
                  child: const Text('Login')),
              ElevatedButton(
                  onPressed: () {
                    // context.go(widget._next['About']!);
                    addresses.goLocation(context,
                        now: widget._now, next: widget._next['About']);
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
