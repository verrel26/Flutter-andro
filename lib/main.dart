import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/sign_in_page.dart';
import 'pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
      },
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
