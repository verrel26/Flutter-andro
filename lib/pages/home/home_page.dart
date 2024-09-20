// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:myapp/models/category_model.dart';
import 'package:myapp/models/user_model.dart';
import 'package:myapp/providers/auth_provider.dart';
// import 'package:myapp/providers/category_provider.dart';
import 'package:myapp/providers/product_provider.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/widgets/product_cart.dart';
import 'package:myapp/widgets/product_tile.dart';
// import 'package:myapp/widgets/category_cart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user!;

    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    // print('profile: ');
    // print(user.profilePhotoUrl);

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
                    'Hallo xx ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    user.username,
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ClipOval(
              child: SvgPicture.network(
                user.profilePhotoUrl,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      );
    }

    // Categories
    Widget categories() {
      // final categoryProvider = Provider.of<CategoryProvider>(context);

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
                'All Product',
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
              ),
            ),
            // Tambahkan kategori lain...
          ],
        ),
      );
    }

    // Popular Product Title/Judul
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
              Row(
                children: productProvider.products
                    .map(
                      (product) => ProductCart(product),
                    )
                    .toList(),
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
        child: Column(
          children: productProvider.products
              .map(
                (product) => ProductTile(product),
              )
              .toList(),
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
