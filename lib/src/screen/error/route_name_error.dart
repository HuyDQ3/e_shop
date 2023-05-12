import 'package:e_shop/export.dart';

class RouteNameError extends Error {
  const RouteNameError({super.key});

  @override
  _RouteNameErrorState createState() => _RouteNameErrorState();
}

class _RouteNameErrorState extends State<RouteNameError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Text('cannot find page \'${Uri.base.toString()}\''),
              Text(addresses.foldAddress()),
              ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('First Page')),
            ]),
      ),
    );
  }
}
