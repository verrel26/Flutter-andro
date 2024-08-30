import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/widgets/product_cart.dart';
import 'package:myapp/widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List view untuk bisa discrol ke bawah
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo Panjul',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@panjul',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/face1.jpg'),
                ),
              ),
            )
          ],
        ),
      );
    }

    // Categories
    Widget categories() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Untuk mengatur margin
            SizedBox(
              width: defaultMargin,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              // untuk mengatur margin ke kanan
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: Text(
                'All Bag',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: subtitleColor,
                ),
                color: transparentColor,
              ),
              child: Text(
                'BackPack',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: subtitleColor,
                ),
                color: transparentColor,
              ),
              child: Text(
                'Waist Bag',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: subtitleColor,
                ),
                color: transparentColor,
              ),
              child: Text(
                'All Bag',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // Popular Product Title
    Widget popularProductsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // Popular Product
    Widget popularProducts() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              const Row(
                children: [
                  ProductCart(),
                  ProductCart(),
                  ProductCart(),
                ],
              ),
            ],
          ),
        ),
      );
    }

    // New Arrival Title
    Widget newArrivalsTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    // New Arrivals
    Widget newArrivals() {
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: const Column(
          children: [
            ProductTile(),
            ProductTile(),
            ProductTile(),
            ProductTile(),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        SizedBox(
          height: defaultMargin,
        ),
        categories(),
        popularProductsTitle(),
        popularProducts(),
        newArrivalsTitle(),
        newArrivals(),
      ],
    );
  }
}
