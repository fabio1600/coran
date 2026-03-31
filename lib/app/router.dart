import 'package:coran/features/task/paginaAccettazione.dart';
import 'package:coran/features/task/account.dart';
import 'package:coran/features/task/cambioPassword.dart';
import 'package:coran/features/task/filtri.dart';
import 'package:coran/features/task/impostazioni.dart';
import 'package:coran/features/task/login.dart';
import 'package:coran/features/task/paginaPreferiti.dart';
import 'package:coran/features/task/paginaRdp.dart';
import 'package:coran/features/task/home.dart';
import 'package:coran/features/task/ricerca.dart';
import 'package:coran/features/task/segnalazione.dart';
import 'package:coran/features/task/veterinari.dart';

import 'package:go_router/go_router.dart';
import 'package:coran/features/task/scaffoldBase.dart';
import 'package:hive_flutter/adapters.dart';


final GoRouter router = GoRouter(
  
  routes: [
   ShellRoute(
      builder: (context, state, child) {
        // child = pagina attuale della bottom bar
        int index = 0;
        if (state.uri.path == '/') index = 0;
        if (state.uri.path == '/ricerca') index = 1;
        if (state.uri.path == '/preferiti') index = 2;
        if (state.uri.path == '/impostazioni') index = 3;

        return BaseScaffold(
          currentIndex: index,
          
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => Home()),
        GoRoute(path: '/ricerca', builder: (context, state) => Ricerca()),
        GoRoute(path: '/preferiti', builder: (context, state) => Paginapreferiti()),
        GoRoute(path: '/impostazioni', builder: (context, state) => Impostazioni()),
      ],
    ),
    GoRoute(
          path: '/rdp',
          pageBuilder: (context, state) => const NoTransitionPage(
    child: Paginardp(),
  ),
        ),
    GoRoute(
          path: '/accettazione/:id',
  builder: (context, state) {
    final id = int.parse(state.pathParameters['id']!);
    return paginaAccettazione(id: id);
  },
        ),
    GoRoute(
          path: '/filtri',
          builder: (context, state) => const Filtri(),
        ),
    GoRoute(
          path: '/login',
          builder: (context, state) => const Login(),
        ),
    GoRoute(
          path: '/account',
          builder: (context, state) => const Account(),
        ),
    GoRoute(
          path: '/password',
          builder: (context, state) => const Cambiopassword(),
        ),
    GoRoute(
          path: '/segnalazione',
          builder: (context, state) => const Segnalazione(),
        ),
    GoRoute(
          path: '/veterinari',
          builder: (context, state) => const Veterinari(),
        ),
        
  ],
  redirect: (context, state) {
    var box = Hive.box('login');
    bool isLogged = box.get('islogged', defaultValue: false);

    if (!isLogged && state.uri.path != '/login') return '/login';
    if (isLogged && state.uri.path == '/login') return '/';
    return null;
  },
);
