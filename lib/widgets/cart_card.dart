import 'package:flutter/material.dart';
import 'package:myapp/models/cart_model.dart';
import 'package:myapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../theme.dart';

class CartCard extends StatelessWidget {
  // const CartCard({super.key});
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    // Fungsi tambah
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    // Fungsi hapus

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      cart.product!.galleries![0].url!,
                    ),
                  ),
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
                      cart.product!.name!,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '\$${cart.product!.price!}',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/images/plus.png',
                      width: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(cart.id!);
                    },
                    child: Image.asset(
                      'assets/images/minus.png',
                      width: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id!);
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/delete.png',
                  width: 10,
                ),
                const SizedBox(
                  width: 4,
                  height: 15,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
