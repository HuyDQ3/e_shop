import 'package:e_shop/export.dart';

class ByPhone extends Screen {
  final String _now = addresses.path('ByPhone');
  late final Map<String, String> _next = {
    'Fcode': addresses.path('Fcode'),
  };

  ByPhone({Key? key}) : super(key: key);

  @override
  _ByPhoneState createState() => _ByPhoneState();

  // TODO: implement nextRoute
  Map<String, String> get next => _next;

  // TODO: implement now
  String get now => _now;
}

class _ByPhoneState extends State<ByPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('By phone'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              addresses.goLocation(context,
                  now: widget._now, next: widget._next['Fcode']);
            },
            child: const Text('phone is true -> send fcode'),
          ),
          ElevatedButton(
            onPressed: () {
              addresses.goPreLocation(context, widget._now);
            },
            child: const Text('phone is false -> return forgot'),
          ),
        ],
      ),
    );
  }
}
