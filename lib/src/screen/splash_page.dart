import 'package:e_shop/export.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // bool _redirectCalled = false;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _redirect();
  // }

  // Future<void> _redirect() async {
  //   await Future.delayed(Duration.zero);
  //   if (_redirectCalled || !mounted) {
  //     return;
  //   }

  //   _redirectCalled = true;
  //   final session = supabase.auth.currentSession;
  //   if (session != null) {
  //     Navigator.of(context).pushReplacementNamed('/account');
  //     // context.go('/account');
  //   } else {
  //     Navigator.of(context).pushReplacementNamed('/login');
  //     // context.go('/login');
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold(
  //     body: Center(child: CircularProgressIndicator()),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // await for for the widget to mount
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession;
    if (session == null) {
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
    } else {
      Navigator.of(context)
          .pushAndRemoveUntil(ChatPage.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}
