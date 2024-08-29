import 'package:flutter/material.dart';
import 'package:myapp/pages/home/chat_page.dart';
import 'package:myapp/pages/home/home_page.dart';
import 'package:myapp/pages/home/profile_page.dart';
import 'package:myapp/pages/home/wishlist_page.dart';
import '../../theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/images/shopping-cart2.png',
          width: 30,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          color: backgroundColor4,
          shape: const CircularNotchedRectangle(),
          notchMargin: 16,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor4,
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                // ignore: avoid_unnecessary_containers
                icon: Container(
                  child: Image.asset(
                    'assets/images/house.png',
                    width: 21,
                    color: currentIndex == 0
                        ? primaryColor
                        : const Color(0xFFE0E0E6),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Image.asset(
                    'assets/images/chat.png',
                    width: 21,
                    color: currentIndex == 1
                        ? primaryColor
                        : const Color(0xFFE0E0E6),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Image.asset(
                    'assets/images/wishlist.png',
                    width: 20,
                    color: currentIndex == 2
                        ? primaryColor
                        : const Color(0xFFE0E0E6),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/user.png',
                  width: 21,
                  color: currentIndex == 3
                      ? primaryColor
                      : const Color(0xFFE0E0E6),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    // Body
    Widget body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();

        case 1:
          return const ChatPage();

        case 2:
          return const WishlistPage();

        case 3:
          return const ProfilePage();

        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
