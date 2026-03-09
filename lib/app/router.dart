import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/filtri.dart';
import 'package:coran/features/task/login.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/home.dart';
import 'package:coran/features/task/ricerca.dart';

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
        if (state.uri.path == '/settings') index = 2;

        return BaseScaffold(
          currentIndex: index,
          
        );
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => Home()),
        GoRoute(path: '/ricerca', builder: (context, state) => Ricerca()),
        GoRoute(path: '/settings', builder: (context, state) => Rdp()),
      ],
    ),
    GoRoute(
          path: '/rdp',
          builder: (context, state) => const Rdp(),
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
  ],
  
);
