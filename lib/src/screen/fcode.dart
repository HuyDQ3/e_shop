import 'package:e_shop/export.dart';

class Fcode extends Screen {
  Fcode({Key? key}) : super(key: key);

  @override
  _FcodeState createState() => _FcodeState();
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
