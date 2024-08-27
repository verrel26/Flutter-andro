import 'package:flutter/material.dart';
import 'package:myapp/theme.dart';
import 'package:myapp/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Message Support',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    // Empty Chat
    // Widget emptyChat() {
    //   return Expanded(
    //     child: Container(
    //       width: double.infinity,
    //       color: backgroundColor3,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Image.asset(
    //             'assets/images/headshet.png',
    //             width: 100,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           Text(
    //             'Opps no message yet?',
    //             style:
    //                 primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
    //           ),
    //           const SizedBox(
    //             height: 12,
    //           ),
    //           Text(
    //             'You have never done a transaction',
    //             style: subtitleTextStyle,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           // ignore: sized_box_for_whitespace
    //           Container(
    //             height: 44,
    //             child: TextButton(
    //               onPressed: () {},
    //               style: TextButton.styleFrom(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 24,
    //                   vertical: 10,
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

    // content
    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColor3,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ChatTile(),
              const ChatTile(),
              const ChatTile(),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
