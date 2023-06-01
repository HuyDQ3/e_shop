import 'package:e_shop/export.dart';

class CustomerNotification extends StatefulWidget {
  const CustomerNotification({Key? key}) : super(key: key);

  @override
  _CustomerNotificationState createState() => _CustomerNotificationState();
}

class _CustomerNotificationState extends State<CustomerNotification> {
  late Widget _appBar = Search(isTapped: false);

  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = Scaffold(
      appBar: PreferredSize(
          child: _appBar,
          preferredSize: Size.fromHeight(HeightAndWidth().appBarHeight)),
      body: Wrap(
        children: [
          Text('CustomerNotification'),
        ],
      ),
    );
    return scaffold;
  }
}
