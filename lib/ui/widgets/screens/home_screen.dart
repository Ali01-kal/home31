import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hww31/data/dto/product_dto.dart';
import 'package:hww31/storage/token_storage.dart';
import 'package:hww31/ui/widgets/product_tile.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.products, required this.localeNotifier});

  final List<ProductDto> products;
  final ValueNotifier<Locale> localeNotifier;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tokenStorage = TokenStorage();
  String? _token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final t = await _tokenStorage.readToken();
    setState(() => _token = t);
  }

  Future<void> _saveDemoToken() async {
    await _tokenStorage.saveToken('demo_token_123');
    await _loadToken();
  }

  Future<void> _deleteToken() async {
    await _tokenStorage.deleteToken();
    await _loadToken();
  }

  void _toggleLocale() {
    widget.localeNotifier.value =
        widget.localeNotifier.value.languageCode == 'ru' ? const Locale('en') : const Locale('ru');
  }

  @override
  Widget build(BuildContext context) {
    final locale = widget.localeNotifier.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Home (${locale.languageCode})'),
        actions: [
          IconButton(
            onPressed: _toggleLocale,
            icon: const Icon(Icons.language),
            tooltip: 'Switch ru/en',
          ),
          IconButton(
            onPressed: () => context.go('/profile/beka'),
            icon: const Icon(Icons.person),
            tooltip: 'Profile',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(child: Text('Token: ${_token ?? "null"}')),
                TextButton(onPressed: _saveDemoToken, child: const Text('Save token')),
                TextButton(onPressed: _deleteToken, child: const Text('Delete')),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: widget.products.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, i) {
                final p = widget.products[i];
                return ProductTile(
                  product: p,
                  onTap: () => context.go('/details/${p.id}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
