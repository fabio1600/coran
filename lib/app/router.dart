import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/account.dart';
import 'package:coran/features/task/cambioPassword.dart';
import 'package:coran/features/task/filtri.dart';
import 'package:coran/features/task/impostazioni.dart';
import 'package:coran/features/task/login.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/home.dart';
import 'package:coran/features/task/ricerca.dart';
import 'package:coran/features/task/segnalazione.dart';
import 'package:coran/features/task/veterinari.dart';

import 'package:go_router/go_router.dart';
import 'package:coran/features/task/scaffoldBase.dart';


final GoRouter router = GoRouter(
  routes: [
   ShellRoute(
      builder: (context, state, child) {
        // child = pagina attuale della bottom bar
        int index = 0;
        if (state.uri.path == '/') index = 0;
        if (state.uri.path == '/ricerca') index = 1;
        if (state.uri.path == '/impostazioni') index = 2;

        return BaseScaffold(
          currentIndex: index,
          
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => Home()),
        GoRoute(path: '/ricerca', builder: (context, state) => Ricerca()),
        GoRoute(path: '/impostazioni', builder: (context, state) => Impostazioni()),
      ],
    ),
    GoRoute(
          path: '/rdp',
          pageBuilder: (context, state) => const NoTransitionPage(
    child: Rdp(),
  ),
        ),
    GoRoute(
          path: '/accettazione',
          builder: (context, state) => const Accettazione(),
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
  
);
