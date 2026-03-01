import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hww31/ui/widgets/screens/details_screen.dart';
import 'package:hww31/ui/widgets/screens/home_screen.dart';
import 'package:hww31/ui/widgets/screens/profile_screen.dart';
import 'data/dto/product_dto.dart';


GoRouter createRouter({
  required ValueNotifier<Locale> localeNotifier,
  required List<ProductDto> products,
}) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => HomeScreen(products: products, localeNotifier: localeNotifier),
      ),
      GoRoute(
        path: '/details/:id',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          final product = products.firstWhere((p) => p.id == id);
          return DetailsScreen(product: product, localeNotifier: localeNotifier);
        },
      ),
      GoRoute(
        path: '/profile/:username',
        builder: (_, state) {
          final username = state.pathParameters['username']!;
          return ProfileScreen(username: username);
        },
      ),
    ],
  );
}
