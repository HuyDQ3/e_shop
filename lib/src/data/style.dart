import 'package:e_shop/export.dart';

class StyleColor {
  final Color? _button = Colors.deepOrange[300];
  final Color? _searchTitle = Colors.deepOrange[300];
  final Color? _selectedItemNavigator = Colors.deepOrange[300];
  final Color? _unselectedItemNavigator = Colors.deepOrange[300];
  final Color? _backgroundTitle = Colors.deepOrange[300];
  final Color? _backgroundNavigator = Colors.white;
  final Color _text = Colors.white;
  final Color _hintText = Colors.white;
  final Color _labelText = Colors.white;

  Color? get button => _button;
  Color? get searchTitle => _searchTitle;
  Color? get selectedItemNavigator => _selectedItemNavigator;
  Color? get unselectedItemNavigator => _unselectedItemNavigator;
  Color? get backgroundTitle => _backgroundTitle;
  Color? get backgroundNavigator => _backgroundNavigator;
  Color? get text => _text;
  Color? get hintText => _hintText;
  Color? get labelText => _labelText;
}

class HeightAndWidth {
  final double _appBarHeight = 60.0;

  double get appBarHeight => _appBarHeight;
}
