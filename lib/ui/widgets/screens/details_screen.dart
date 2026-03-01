import 'package:flutter/material.dart';
import 'package:hww31/data/dto/product_dto.dart';
import 'package:intl/intl.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product, required this.localeNotifier});

  final ProductDto product;
  final ValueNotifier<Locale> localeNotifier;

  @override
  Widget build(BuildContext context) {
    final locale = localeNotifier.value.toString(); // "ru" or "en"
    final price = NumberFormat.simpleCurrency(locale: locale).format(product.price);
    final date = DateFormat.yMMMd(locale).add_Hm().format(product.createdAt);

    return Scaffold(
      appBar: AppBar(title: Text('Details #${product.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text('Price: $price'),
            Text('Created: $date'),
            const SizedBox(height: 12),
            Text('Image URL:\n${product.imageUrl}'),
          ],
        ),
      ),
    );
  }
