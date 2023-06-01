import 'package:e_shop/export.dart';

class ByMail extends Screen {
  ByMail({Key? key}) : super(key: key);

  @override
  _ByMailState createState() => _ByMailState();
}

class _ByMailState extends State<ByMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: addresses.preArrowBackButton(context, widget._now),
        title: const Text('By mail'),
      ),
      body: Wrap(
        children: [
          ElevatedButton(
            onPressed: () {
              context.push('/forgot/bymail/fcode');
            },
            child: const Text('email is true -> send fcode'),
          ),
          ElevatedButton(
            onPressed: () => {context.pop('/forgot')},
            child: const Text('email is false -> return forgot'),
          ),
        ],
      ),
    );
  }
}
