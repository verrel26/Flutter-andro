import 'package:flutter/material.dart';
import 'package:myapp/pages/product_page.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/models/product_model.dart'; // Pastikan Anda mengimpor model yang benar

class ProductTile extends StatelessWidget {
  final ProductModel product; // Ubah tipe data ke ProductModel
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    print('produk image:');
    print(
      product.galleries![0].url!,
    );
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductPage(product), // Pastikan ProductModel dikirim
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                product.galleries![0].url!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, StackTrace) {
                  return Icon(Icons.error);
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category!.name!,
                  style: secondaryTextStyle.copyWith(
                      fontSize: 15, color: const Color(0xFF757486)),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
