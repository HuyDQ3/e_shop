import 'package:e_shop/export.dart';
import 'package:e_shop/src/screen/navigation.dart';

// import 'package:flutter_web_plugins/url_strategy.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  // usePathUrlStrategy();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final GoRouter _routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => First(),
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (context, state) => Login(),
            routes: <RouteBase>[],
          ),
          GoRoute(
            path: 'register',
            builder: (context, state) => Register(),
          ),
          GoRoute(
            path: 'forgot',
            builder: (context, state) => Forgot(),
            routes: <RouteBase>[
              GoRoute(
                path: 'byphone',
                builder: (context, state) => ByPhone(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'fcode',
                    builder: (context, state) => Fcode(),
                  ),
                ],
              ),
              GoRoute(
                path: 'bymail',
                builder: (context, state) => ByMail(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'fcode',
                    builder: (context, state) => Fcode(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'about',
            builder: (context, state) => About(),
          ),
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => ShellNavigatior(child: child),
            routes: <RouteBase>[
              GoRoute(
                // path: '${addresses.path('Home')}/:name',
                // builder: (context, state) {
                //   return Home(name: state.params['name']);
                // }
                path: 'home',
                builder: (context, state) => Home(name: 'Huy'),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'search',
                    builder: (context, state) => Search(isTapped: true),
                    routes: <RouteBase>[],
                  ),
                ],
              ),
              GoRoute(
                path: 'account',
                builder: (context, state) => Account(name: 'Huy'),
                routes: <RouteBase>[],
              ),
              GoRoute(
                path: 'trend',
                builder: (context, state) => Trend(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'search',
                    builder: (context, state) => Search(
                      isTapped: true,
                    ),
                    routes: <RouteBase>[],
                  ),
                ],
              ),
              GoRoute(
                path: 'shop',
                builder: (context, state) => Shop(),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'search',
                    builder: (context, state) => Search(
                      isTapped: true,
                    ),
                    routes: <RouteBase>[],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig,
    );
  }

  GoRouter _a() {
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

    // home
    GoRoute home = GoRoute(
      // path: '${addresses.path('Home')}/:name',
      // builder: (context, state) {
      //   return Home(name: state.params['name']);
      // }
      path: addresses.path('Home'),
      builder: (context, state) => Home(name: 'Huy'),
      routes: <RouteBase>[],
    );

    // search
    GoRoute search = GoRoute(
      path: addresses.path('Search'),
      builder: (context, state) => Search(
        isTapped: true,
      ),
    );

    // shop
    GoRoute shop = GoRoute(
      path: addresses.path('Search'),
      builder: (context, state) => Home(name: 'Huy'),
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
        register,
        forgot,
        about,
        home,
        search,
        shop,
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
