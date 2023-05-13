import 'package:e_shop/export.dart';
import 'package:e_shop/src/screen/home/search.dart';
// import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // usePathUrlStrategy();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig(),
    );
  }

  GoRouter _routerConfig() {
    // login -> home
    GoRoute login = GoRoute(
      path: addresses.path('Login'),
      builder: (context, state) => Login(),
      routes: <RouteBase>[],
    );
    // register
    GoRoute register = GoRoute(
      path: addresses.path('Register'),
      builder: (context, state) => Register(),
    );
    // forgot -> bymail/byPhone -> fCode
    GoRoute fCode = GoRoute(
      path: addresses.path('Fcode'),
      builder: (context, state) => Fcode(),
    );
    GoRoute byPhone = GoRoute(
      path: addresses.path('ByPhone'),
      builder: (context, state) => ByPhone(),
      routes: <RouteBase>[
        fCode,
      ],
    );
    GoRoute byMail = GoRoute(
      path: addresses.path('ByMail'),
      builder: (context, state) => ByMail(),
      routes: <RouteBase>[
        fCode,
      ],
    );
    GoRoute forgot = GoRoute(
      path: addresses.path('Forgot'),
      builder: (context, state) => Forgot(),
      routes: <RouteBase>[
        byMail,
        byPhone,
      ],
    );
    // about
    GoRoute about = GoRoute(
      path: addresses.path('About'),
      builder: (context, state) => About(),
    );
    // search
    GoRoute search = GoRoute(
      path: addresses.path('Search'),
      builder: (context, state) => Search(),
    );
    // home -> search
    GoRoute home = GoRoute(
      // path: '${addresses.path('Home')}/:name',
      // builder: (context, state) {
      //   return Home(name: state.params['name']);
      // }
      path: addresses.path('Home'),
      builder: (context, state) => Home(name: 'Huy'),
      routes: <RouteBase>[],
    );
    // first -> login -> forgot || register || about
    // login success -> home
    // register success -> home
    // forgot success -> home
    GoRoute first = GoRoute(
      path: addresses.path('First'),
      builder: (context, state) => First(),
      routes: <RouteBase>[
        login,
        forgot,
        about,
        register,
        home,
        search,
      ],
    );

    final GoRouter routerConfig = GoRouter(
      // errorBuilder: (context, state) {
      //   return Row();
      // },
      // redirect: (context, state) {
      //   if (Login().getIsLoggedIn) {
      //     return '/${Home().now}';
      //   }
      //   return Login().now;
      // },

      errorBuilder: (context, state) {
        return const RouteNameError();
      },
      routes: [
        first,
      ],
    );
    return routerConfig;
  }
}
