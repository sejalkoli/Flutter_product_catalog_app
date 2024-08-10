import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/store.dart';
import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:flutter_application_3/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listening to AddMutation using VxBuilder
    return VxBuilder(
      mutations: {AddMutation, RemoveMutation},
      builder: (context, store, status) {
        final CartModel _cart = (VxState.store as MyStore).cart;

        bool isInCart = _cart.items.contains(catalog);

        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              MyTheme.darkbluecolor,
            ),
            shape: WidgetStateProperty.all(
              StadiumBorder(),
            ),
          ),
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog);
            }
          },
          child: isInCart
              ? Icon(Icons.done, color: Colors.white)
              : Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
        );
      },
    );
  }
}