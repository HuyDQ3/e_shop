// import 'dart:js_interop';

import 'package:e_shop/export.dart';

class Search extends Screen {
  bool isTapped;

  Search({required this.isTapped, Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _searchTitle() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {
            context.go('${GoRouterState.of(context).location}/search');
          },
          icon: Icon(Icons.search),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: SizedBox(
            // constraints: BoxConstraints.tightForFinite(
            //     height: 40, width: double.infinity),
            height: 40,
            child: TextButton(
              onPressed: () {
                context.go('${GoRouterState.of(context).location}/search');
              },
              child: Row(
                children: [
                  Text(
                    'Search product!',
                    style: TextStyle(color: StyleColor().text),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 50,
          // height: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ),
        SizedBox(
          width: 50,
          // height: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ),
      ],
    );
  }

  Widget _search() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: TextField(
              autofocus: true,
              style: TextStyle(color: StyleColor().text),
              decoration: InputDecoration(
                hintText: 'What?',
                hintStyle: TextStyle(color: StyleColor().hintText),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(width: 2, color: Colors.white),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(width: 2, color: Colors.white),
                // ),
                border: InputBorder.none,
                // icon: Icon(Icons.search),
                labelStyle: TextStyle(color: StyleColor().labelText),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isTapped) {
      return AppBar(
        title: _searchTitle(),
        backgroundColor: StyleColor().backgroundTitle,
        toolbarHeight: HeightAndWidth().appBarHeight,
        // foregroundColor: StyleColor().backgroundNavigator,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          backgroundColor: StyleColor().backgroundTitle,
          title: _search(),
          toolbarHeight: HeightAndWidth().appBarHeight,
        ),
      );
    }
  }
}
