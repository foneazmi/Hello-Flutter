import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hello/ui/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HelloScreen(),
    ),
    GoRoute(
      path: '/styling',
      builder: (context, state) => StylingScreen(),
    ),
    GoRoute(
      path: '/animation',
      builder: (context, state) => AnimationScreen(),
    ),
    GoRoute(
      path: '/template',
      // redirect: (context, state) {
      //   return null;

      //   // if (!AuthState.of(context).isSignedIn) {
      //   //   return '/signin';
      //   // } else {
      //   //   return null;
      //   // }
      // },
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: TemplateScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
