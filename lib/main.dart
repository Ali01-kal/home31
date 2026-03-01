import 'package:flutter/material.dart';
import 'app_router.dart';
import 'data/dto/product_dto.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final localeNotifier = ValueNotifier<Locale>(const Locale('ru'));

  late final List<ProductDto> products = [
    ProductDto(
      id: 1,
      title: 'MacBook Pro',
      price: 1999.99,
      imageUrl: 'https://picsum.photos/id/180/200/200',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    ProductDto(
      id: 2,
      title: 'iPhone 15',
      price: 1299.50,
      imageUrl: 'https://picsum.photos/id/0/200/200',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    ProductDto(
      id: 3,
      title: 'Headphones',
      price: 149.90,
      imageUrl: 'https://picsum.photos/id/29/200/200',
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: localeNotifier,
      builder: (_, locale, __) {
        final router = createRouter(localeNotifier: localeNotifier, products: products);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: locale, // ru/en switch
          routerConfig: router,
          theme: ThemeData(useMaterial3: true),
        );
      },
    );
  }
}
