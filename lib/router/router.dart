import 'package:go_router/go_router.dart';
import 'package:my_tracker/view/home_page.dart';

import 'package:riverpod/riverpod.dart';

final routerProvider = Provider<GoRouter>((ref){

  return GoRouter(routes: [
    GoRoute(name:HomePage.name ,path: '/',builder: (_,__)=>const HomePage())
  ]);

});