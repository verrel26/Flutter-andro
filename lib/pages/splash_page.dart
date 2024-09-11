import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Membuat masuk ke halaman awal 3 detik baru masuk ke halaman login
    getInit();

    super.initState();
  }

  getInit() async {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/mobil.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
