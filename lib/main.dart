import 'package:flutter/material.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/pages/checkout_page.dart';
import 'package:myapp/pages/checkout_success_page.dart';
import 'package:myapp/pages/detail_chat_page.dart';
import 'package:myapp/pages/edit_profile.dart';
import 'package:myapp/pages/sign_in_page.dart';
import 'package:myapp/pages/sign_up_page.dart';
import 'package:myapp/providers/auth_provider.dart';
import 'package:myapp/providers/product_provider.dart';
// import 'package:myapp/providers/category_provider.dart';
import 'package:myapp/providers/wishlist_provider.dart';
import 'pages/home/main_page.dart';
import 'pages/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
        initialRoute: '/',
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(color: Colors.blue),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image.asset('assets/images/mobil.png'),
//               Text(
//                 'Hello coba',
//                 style: GoogleFonts.poppins(
//                   fontSize: 10,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//                 borderRadius: BorderRadius.circular(18),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     'uhuy',
//                     style:
//                         GoogleFonts.poppins(color: Colors.white, fontSize: 30),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           backgroundColor: Colors.blue,
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
