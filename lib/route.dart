import 'package:go_router/go_router.dart';
import 'package:hello/ui/pages/pages.dart';
import 'package:hello/ui/widget/widgets.dart';

final GoRouter route = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithFadeTransition(
        context: context,
        state: state,
        child: const InitPageRoute(),
      ),
    ),
    GoRoute(
      path: '/text',
      pageBuilder: (context, state) => buildPageWithFadeTransition(
        context: context,
        state: state,
        child: const TextPageRoute(),
      ),
    ),
    GoRoute(
      path: '/container',
      pageBuilder: (context, state) => buildPageWithFadeTransition(
        context: context,
        state: state,
        child: const ContainerPageRoute(),
      ),
    ),
    GoRoute(
      path: '/state',
      pageBuilder: (context, state) => buildPageWithFadeTransition(
        context: context,
        state: state,
        child: const StatePageRoute(),
      ),
    ),
    GoRoute(
      path: '/bottom-nav-bar',
      pageBuilder: (context, state) => buildPageWithFadeTransition(
        context: context,
        state: state,
        child: const BottomNavBarPageRoute(),
      ),
    ),
    GoRoute(
      path: '/transition',
      pageBuilder: (context, state) => buildPageWithFadeTransition(
        context: context,
        state: state,
        child: TransitionPageRoute(),
      ),
    ),
  ],
);
