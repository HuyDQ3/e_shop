import 'package:e_shop/export.dart';

class ByMail extends Screen {
  final String _now = addresses.path('ByMail');
  final Map<String, String> _next = {
    'Fcode': addresses.path('Fcode'),
    'Forgot': addresses.path('Forgot'),
  };

  ByMail({Key? key}) : super(key: key);

  @override
  _ByMailState createState() => _ByMailState();

  // TODO: implement nextRoute
  Map<String, String> get next => _next;

  // TODO: implement now
  String get now => _now;
}

class _ByMailState extends State<ByMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('By mail'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              addresses.goLocation(context,
                  now: widget._now, next: widget._next['Fcode']);
            },
            child: const Text('email is true -> send fcode'),
          ),
          ElevatedButton(
            onPressed: () => {
              addresses.goPreLocation(
                  context, widget._now, widget._next['Forgot'])
            },
            child: const Text('email is false -> return forgot'),
          ),
        ],
      ),
    );
  }
}
