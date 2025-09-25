import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final String? imageUrl;

  const ProductImageWidget({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return const SizedBox.shrink();

    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[200],
                child: const Icon(
                  Icons.image_not_supported,
                  size: 30,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
