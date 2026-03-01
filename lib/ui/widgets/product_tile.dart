import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../data/dto/product_dto.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product, required this.onTap});

  final ProductDto product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: product.imageUrl,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          placeholder: (_, __) => const SizedBox(
            width: 56,
            height: 56,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
          ),
          errorWidget: (_, __, ___) => const SizedBox(
            width: 56,
            height: 56,
            child: Icon(Icons.broken_image),
          ),
        ),
      ),
      title: Text(product.title),
      subtitle: Text('ID: ${product.id}'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
