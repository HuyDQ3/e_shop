import 'package:e_shop/export.dart';

class PageNotFound extends Error {
  const PageNotFound({super.key});

  @override
  _PageNotFoundState createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('cannot find link \'${widget.getNow}\''),
        title: const Text('Page not found!'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => context.go('/'), child: const Text('First Page')),
      ),
    );
  }
}
