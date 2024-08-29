import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key});

  @override
  // Product terbaru
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
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
              child: Image.asset(
                'assets/images/tas.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
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
                  'BackPack',
                  style: secondaryTextStyle.copyWith(
                      fontSize: 15, color: const Color(0xFF757486)),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'BackPack mantap',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '\$68,47',
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
