import 'package:e_shop/export.dart';
import 'package:e_shop/src/model/cart.dart';
import 'package:provider/provider.dart';

class CustomerCategory extends StatefulWidget {
  CustomerCategory({Key? key}) : super(key: key);

  @override
  _CustomerCategoryState createState() => _CustomerCategoryState();
}

class _CustomerCategoryState extends State<CustomerCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: preArrowBackButton(context),
        title: Text('Category'),
        // centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: _CartList(),
        ),
        _CartTotal(),
      ]),
    );
  }

  IconButton preArrowBackButton(BuildContext context,
      {String? preRouter, IconData? iconData}) {
    Icon icon = Icon(iconData ?? Icons.arrow_back);
    IconButton iconButton = IconButton(
      icon: icon,
      onPressed: () {
        if (preRouter == null) {
          context.go('/home');
        } else {
          context.go(preRouter);
        }
      },
    );
    return iconButton;
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Text('Total: ${cart.totalPrice}');
      },
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Container(
      child: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.cancel_outlined),
            onPressed: () {
              cart.remove(cart.items[index]);
            },
          ),
          title: Text(cart.items[index].name),
        ),
      ),
    );
  }
}
