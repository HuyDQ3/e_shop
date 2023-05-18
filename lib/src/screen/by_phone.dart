import 'package:e_shop/export.dart';

class ByPhone extends Screen {
  ByPhone({Key? key}) : super(key: key);

  @override
  _ByPhoneState createState() => _ByPhoneState();
}

class _ByPhoneState extends State<ByPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('By phone'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('forgot/byphone/fcode');
            },
            child: const Text('phone is true -> send fcode'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/forgot');
            },
            child: const Text('phone is false -> return forgot'),
          ),
        ],
      ),
    );
  }
}
