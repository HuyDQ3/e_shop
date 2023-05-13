import 'dart:js_interop';

import 'package:e_shop/export.dart';

class Search extends Screen {
  String _now = addresses.path('Search');
  Map<String, String> _next = {
    'Home': addresses.path('Home'),
  };
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Widget _search() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            child: TextField(
              autofocus: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'What?',
                hintStyle: TextStyle(color: Colors.white),
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(width: 2, color: Colors.white),
                // ),
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(width: 2, color: Colors.white),
                // ),
                border: InputBorder.none,
                // icon: Icon(Icons.search),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        leading: addresses.preArrowBackButton(context, widget._now,
            changeLocation: widget._next['Home']),
        title: _search(),
      ),
    );
  }
}
