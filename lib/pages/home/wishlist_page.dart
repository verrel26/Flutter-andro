import 'package:flutter/material.dart';
import 'package:myapp/widgets/wishlist_card.dart';
import '../../theme.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Header
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Favorite Shoes',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    // EmptyWishlist
    // Widget emptywishList() {
    //   return Expanded(
    //     child: Container(
    //       width: double.infinity,
    //       color: backgroundColor3,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Image.asset(
    //             'assets/images/favourite.png',
    //             width: 74,
    //           ),
    //           SizedBox(
    //             height: 23,
    //           ),
    //           Text(
    //             ' You don\'t have dream shoes ?',
    //             style: primaryTextStyle.copyWith(
    //               fontWeight: medium,
    //               fontSize: 12,
    //             ),
    //           ),
    //           SizedBox(
    //             height: 12,
    //           ),
    //           Text(
    //             'Let\'s find your favourite shoes',
    //             style: secondaryTextStyle,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             height: 44,
    //             child: TextButton(
    //               onPressed: () {},
    //               style: TextButton.styleFrom(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 10,
    //                   horizontal: 24,
    //                 ),
    //                 backgroundColor: primaryColor,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(12),
    //                 ),
    //               ),
    //               child: Text(
    //                 'Explore Store',
    //                 style: primaryTextStyle.copyWith(
    //                   fontSize: 16,
    //                   fontWeight: medium,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    //  Content
    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColor3,
          child: ListView(
            children: const [
              WishlistCard(),
              WishlistCard(),
              WishlistCard(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        // emptyWishList(),
        content(),
      ],
    );
  }
}
