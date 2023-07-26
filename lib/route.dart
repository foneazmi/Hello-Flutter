import 'package:get/get.dart';
import 'package:hello/ui/pages/pages.dart';

final getPages = [
  GetPage(name: '/', page: () => const InitPage()),
  GetPage(name: '/template', page: () => const TemplatePage()),
  GetPage(name: '/text', page: () => const TextPage()),
  GetPage(name: '/container', page: () => const ContainerPage()),
  GetPage(name: '/state', page: () => const StatePage()),
  GetPage(name: '/bottom-nav-bar', page: () => const BottomNavBarPage()),
  GetPage(name: '/http', page: () => const HttpPage()),
];
