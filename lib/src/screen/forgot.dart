import 'package:e_shop/export.dart';

class Forgot extends Screen {
  Forgot({Key? key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
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
              context.push('/forgot/bymail');
            },
            child: const Text('by email'),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/forgot/byphone');
            },
            child: const Text('by phone'),
          ),
        ],
      ),
    );
  }
}
