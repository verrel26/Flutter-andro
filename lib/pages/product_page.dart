import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/product_model.dart';
import '../theme.dart';

class ProductPage extends StatefulWidget {
  // const ProductPage({super.key});
  final ProductModel product;
  const ProductPage(this.product, {super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // const ProductPage({super.key});

  // Untuk gambar carousel
  List images = [
    'assets/images/tas2.png',
    'assets/images/tas3.png',
    'assets/images/tas4.png',
  ];

  // Untuk gambar Familiar Bag
  List familiarBag = [
    'assets/images/tas.png',
    'assets/images/tas2.png',
    'assets/images/tas3.png',
    'assets/images/tas4.png',
    'assets/images/tas5.png',
    'assets/images/tas6.png',
    'assets/images/tas7.png',
    'assets/images/tas8.png',
    'assets/images/tas9.png',
    'assets/images/tas10.png',
  ];

  int curentIndex = 0;
  // untuk like product
  bool isWishList = false;

  @override
  Widget build(BuildContext context) {
    // Fungsi Alert
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/check.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successsfully',
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View My Chart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    // Indikator
    // Widget indicator(index) {
    //   return Container(
    //     width: curentIndex == index ? 16 : 4,
    //     height: 4,
    //     margin: const EdgeInsets.symmetric(
    //       horizontal: 3,
    //     ),
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10),
    //       color: curentIndex == index ? primaryColor : const Color(0xffC4C4C4),
    //     ),
    //   );
    // }

    // FamiliarBag
    Widget familiarBagCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffC4C4C4),
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    // Header
    Widget header() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: backgroundColor1,
                )
              ],
            ),
          ),
          // Carousel
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CarouselSlider(
              items: widget.product.galleries!
                  .map(
                    (image) => Image.network(
                      image.url!,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      curentIndex = index;
                    });
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: widget.product.galleries.map!,
          //   ((e) {
          //     index++;
          //     return indicator(index);
          //   }).toList(),
          // ),
        ],
      );
    }

    // Content
    Widget content() {
      int index = 0;
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // JUDUL
            Container(
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
                          widget.product.name!,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        // Text(
                        //   widget.product.category.name!,
                        //   style: secondaryTextStyle.copyWith(
                        //     fontSize: 14,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isWishList = !isWishList;
                      });
                      // Fungsi untk love product
                      if (isWishList) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              'Has been added to the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              'Has been removed from the wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      isWishList
                          ? 'assets/images/favourite.png'
                          : 'assets/images/favourite1.png',
                      width: 45,
                    ),
                  ),
                ],
              ),
            ),

            // UNTUK HARGA
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Baru',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),

            // DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    widget.product.description!,
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    // Membuat rata kanan kiri
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            // UNTUK SARAN PRODUK
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                    ),
                    child: Text(
                      'Familiar Bag',
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  // GAMBAR
                  Padding(
                    padding: EdgeInsets.only(
                      left: defaultMargin,
                      right: defaultMargin,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: familiarBag.map((image) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarBagCard(image),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                ],
              ),
            ),

            // PESAN DAN ADD TO CARD
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail-chat');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/chat2.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: primaryColor,
                        ),
                        child: Text(
                          'Add to Chart',
                          style: primaryTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
