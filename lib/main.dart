import 'package:e_shop/export.dart';

// import 'package:flutter_web_plugins/url_strategy.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://degfvhnmsyqvjtluvtim.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRlZ2Z2aG5tc3lxdmp0bHV2dGltIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQzMTU3ODAsImV4cCI6MTk5OTg5MTc4MH0.kg0HcZCyyWfc4Kz6ZPuVIAfBHHheBouawMSWSoRK5DE',
  );
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

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp.router(
  //     routerConfig: _routerConfig,
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Supabase Flutter',
  //     theme: ThemeData.dark().copyWith(
  //       primaryColor: Colors.green,
  //       textButtonTheme: TextButtonThemeData(
  //         style: TextButton.styleFrom(
  //           foregroundColor: Colors.green,
  //         ),
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ElevatedButton.styleFrom(
  //           foregroundColor: Colors.white,
  //           backgroundColor: Colors.green,
  //         ),
  //       ),
  //     ),
  //     initialRoute: '/',
  //     routes: <String, WidgetBuilder>{
  //       '/': (_) => const SplashPage(),
  //       '/login': (_) => const LoginPage(),
  //       '/account': (_) => const AccountPage(),
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
