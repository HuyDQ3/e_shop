// import 'dart:js_interop';

import 'package:e_shop/export.dart';

Address addresses = Address();

class Address {
  // Map<String, String> _location = {
  //   'First': '/${First().now}',
  //   'Login': '/${Login().now}',
  //   'About': '/${About().now}',
  //   'Home': '/${Home().now}',
  //   'Register': '/${Register().now}',
  //   // forgot -> byphone || bymail -> fcode
  //   'Forgot': '/${Forgot().now}',
  //   'ByPhone': '/${Forgot().now}/${ByPhone().now}',
  //   'ByMail': '/${Forgot().now}/${ByMail().now}',
  //   'FcodeMail': '/${Forgot().now}/${ByMail().now}/${Fcode().now}',
  //   'FcodePhone': '/${Forgot().now}/${ByPhone().now}/${Fcode().now}',
  //   // 'x': '/${x().now}',
  // };

  Queue<String> _address = ListQueue<String>();

  Map<String, String> _path = {
    'Error': 'error',
    'First': '/',
    'Login': 'login',
    'About': 'about',
    'Home': 'home',
    'Register': 'register',
    // forgot -> byphone || bymail -> fcode
    'Forgot': 'forgot',
    'ByPhone': 'byphone',
    'ByMail': 'bymail',
    'Fcode': 'fcode',
    // 'x': '/${x().now}',
  };

  Map<String, Iterable<String>> _location = {
    '/': [],
    'Login': ['/login'],
    'About': ['/about'],
    'Home': ['/home'],
    'Register': ['/register'],
    // forgot -> byphone || bymail -> fcode
    'Forgot': ['/forgot'],
    'Byphone': ['/forgot', '/byphone'],
    'Bymail': ['/forgot', '/bymail'],
    'Fcodemail': ['/forgot', '/bymail/', 'fcode'],
    'Fcodephone': ['/forgot', '/byphone', '/fcode'],
    // 'x': '/${x().now}',
  };

  String changeKeyToRighFormat(String str,
      {required bool path, required location}) {
    late String formatedKey;
    if (path == location) throw 'cannot formated because path == location';
    if (path) formatedKey = '${str[0].toUpperCase()}${str.substring(1)}';
    if (location) {
      formatedKey = '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}';
    }
    return formatedKey;
  }

  String changePathToRightFormat(String path) {
    String formatedPath = path;
    if (!path.startsWith('/', 0)) formatedPath = '/$formatedPath';
    return formatedPath;
  }

  void addOneParamInPath(String path, String? param) {
    String formatedPath =
        changeKeyToRighFormat(path, path: true, location: false);
    if (_path.containsKey(formatedPath) &&
        _path['path'] != null &&
        param != null &&
        param.isNotEmpty) {
      _path['path'] = '${_path['path']}/:$param';
      print('addOneParamInPath: ${_path['path']}, address: ${foldAddress()}');
    } else {
      throw 'cannot add one param: address = ${foldAddress()}, _path[\'path\'] = ${_path['path']}, string path = $formatedPath, containsKey = ${_path.containsKey(formatedPath)}, string param = $param';
    }
  }

  void renewAddressFromLocation(String key) {
    String formatedKey =
        changeKeyToRighFormat(key, location: true, path: false);
    Iterable<String>? list = addresses.location(formatedKey);
    _address.clear();
    if (list != null) {
      _address.addAll(list);
    } else {
      throw 'renewAddressFromLocation error because address.location == null';
    }
  }

  Iterable<String>? location(String key) {
    String formatedKey =
        changeKeyToRighFormat(key, location: true, path: false);
    if (_location.containsKey(formatedKey)) return _location[formatedKey];
    throw 'location key error $formatedKey';
  }

  String path(String key) {
    key = changeKeyToRighFormat(key, location: false, path: true);
    // print(key);
    if (_path.containsKey(key) && _path[key] != null) {
      return _path[key].toString();
    }
    throw 'path key error, _path.constrainsKey = ${_path.containsKey(key)}, key = $key';
  }

  void fixAddressIfNonLinearAccess(String now) {
    // if (!now.startsWith('/', 0)) now = '/$now';
    String formatedPath = changePathToRightFormat(now);
    print(formatedPath);
    String formatedKey =
        changeKeyToRighFormat(now, location: true, path: false);
    print(formatedKey);
    // print(formatedKey);
    if (existInAddress(formatedPath)) {
      removeFromLastElementTo(formatedPath);
    } else {
      renewAddressFromLocation(formatedKey);
    }
  }

  IconButton preArrowBackButton(BuildContext context, String now,
      {IconData? iconData}) {
    Icon icon = Icon(iconData ?? Icons.arrow_back);

    IconButton iconButton = IconButton(
      icon: icon,
      onPressed: () => addresses.goPreLocation(context, now),
    );
    return iconButton;
  }

  Future<bool> onWillPop(BuildContext context, String now,
      {String? action}) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: Text('Do you want to ${action ?? 'exit an App'}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // addresses.goPreLocation(context);
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  addresses.goPreLocation(context, now);
                  // Navigator.of(context).pop(true);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        true;
  }

  String foldAddress() {
    return _address
        .toList()
        .fold('', (previousValue, element) => previousValue + element);
  }

  bool existInAddress(String? str) {
    if (_address.lastWhere((element) => element == str,
            orElse: () => 'Error') ==
        'Error') return false;
    return true;
  }

  void removeFromLastElementTo(String str, {String? replace}) {
    if (existInAddress(str)) {
      while (_address.last != str) {
        _address.removeLast();
      }
      if (replace != null) {
        if (_address.isNotEmpty) _address.removeLast();
        _address.addLast(replace);
      }
    } else {
      throw 'cannot remove $str because it is not exist in address';
    }
  }

  void goLocation(BuildContext context,
      {required String? now, required String? next}) {
    if (next == null || now == null) {
      // dua den man hinh hien thi null error
      print('${foldAddress()}:goLocation:Error');
      throw 'cannot goLocation because next == $next and now = $now';
    } else {
      // if (!next.startsWith('/', 0)) next = '/$next';
      String formatedNext = changePathToRightFormat(next);
      print('change path to format: $formatedNext');
      print('goLocation : formatedNext != null : ${foldAddress()}');
      if (existInAddress(formatedNext)) {
        print('------------------');
        print(
            '${foldAddress()}:goLocation: formatedNext exist in address (before)');
        goPreLocation(context, formatedNext);
        print(
            '${foldAddress()}:goLocation: formatedNext exist in address (after)');
        print('------------------');
      } else {
        print('------------------');
        print('before fix address: $_address');
        fixAddressIfNonLinearAccess(now);
        print('after fix address: $_address');
        _address.addLast(formatedNext);
        print('addLast in address: $_address');
        context.go(foldAddress());
        print('${foldAddress()}:goLocation2');
        print('------------------');
      }
    }
  }

  void goPreLocation(BuildContext context, String now, [String? pre]) {
    fixAddressIfNonLinearAccess(now);
    print('goPreLocation: fix address : ${foldAddress()}');
    if (_address.isEmpty) {
      if (pre == null) {
        context.go(path('First'));
      }
      if (pre != null) {
        // loi
        print('address null nhung pre != null => loi');
        throw 'cannot goPreLocaion because adrress == null, pre != null';
      }
    } else {
      if (pre == null) {
        print(
            'goPreLocation: address not empty, pre == null: ${foldAddress()}');
        _address.removeLast();
        print('goPreLocation: removeLast: ${foldAddress()}');
        if (_address.isEmpty) {
          print('goPreLocation: go to ${foldAddress()}');
          context.go(path('First'));
        } else {
          print('goPreLocation: go to ${foldAddress()}');
          context.go(foldAddress());
        }
      }
      if (pre != null) {
        pre = changePathToRightFormat(pre);
        if (!existInAddress(pre)) {
          print('goPreLocation: pre not exist in address: ${foldAddress()}');
          // loi
        } else {
          print('goPreLocation: pre exist in address: ${foldAddress()}');
          removeFromLastElementTo(pre);
          context.go(foldAddress());
        }
      }
    }
  }

  void changeLocation(BuildContext context,
      {required String? replaceLocation,
      String? detailReplaceLocation,
      String? extraObject}) {
    if (_address.isEmpty) {
      throw 'cannot chagneLocation because address == null';
    }
    if (replaceLocation == null) {
      // dua den man hinh hien thi null error
      // print('changelocation:error');
      throw 'cannot changeLocaion because replaceLocation == null';
    }
    if (replaceLocation == '/') {
      _address.clear();
      // context.go(replaceLocation);
      context.go(path('First'));
    } else {
      String replaceLocationPath = changePathToRightFormat(replaceLocation);
      // if (extraObject != null) {}
      if (detailReplaceLocation == null) {
        _address
          ..clear()
          ..add(replaceLocationPath);
        // addOneParamInPath(replaceLocationPath, extraObject);
        context.go(foldAddress());
      } else {
        String detailReplaceLocationPath =
            changePathToRightFormat(detailReplaceLocation);
        if (!existInAddress(detailReplaceLocationPath)) {
          throw 'cannot changeLocation because detailReplaceLocation is not exist in address';
        }
        removeFromLastElementTo(detailReplaceLocationPath,
            replace: replaceLocationPath);
        // addOneParamInPath(replaceLocationPath, extraObject);
        context.go(foldAddress());
      }
    }
  }
}

// class Stack<E> {
//   final _list = <E>[];

//   void push(E value) => _list.add(value);

//   E pop() => _list.removeLast();

//   E get peek => _list.last;

//   bool get isEmpty => _list.isEmpty;
//   bool get isNotEmpty => _list.isNotEmpty;

//   @override
//   String toString() => _list.toString();
// }
