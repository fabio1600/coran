import 'package:coran/features/task/accettazione.dart';
import 'package:coran/features/task/rdp.dart';
import 'package:coran/features/task/pagina_task2.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PaginaTask2(),
    ),
    GoRoute(
      path: '/accettazione',
      builder: (context, state) => const Accettazione(),
    ),
    GoRoute(
      path: '/rdp',
      builder: (context, state) => const Rdp(),
    )
  ],
);
