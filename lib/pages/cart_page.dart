import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/store.dart';
import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Cart".text.make(),
        ),
        body: Column(children: [
          _cartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ]));
  }
}

class _cartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //
            VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, store, status) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl4
                    .color(MyTheme.darkbluecolor)
                    .make();
              },
            ),

            30.widthBox,
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    MyTheme.darkbluecolor,
                  ),
                  shape: WidgetStateProperty.all(StadiumBorder())),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying not supported yet.".text.make()));
              },
              child: "Check Out".text.color(Colors.white).make(),
            ).h(40)
          ],
        ));
  }
}

//list use to display checkout items
class _cartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    return VxBuilder(
        mutations: {RemoveMutation},
        builder: (context, store, status) {
          return _cart.items.isEmpty
              ? "Nothing to Show".text.xl3.makeCentered()
              : ListView.builder(
              

                  itemCount: _cart.items.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0),
                    child: Container(
                    
                    
                      decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        // leading: Icon(Icons.done),
                        leading: Image.asset(_cart.items[index].image,fit:BoxFit.cover,width:50,height:50),
                        // title: _cart.items[index].name.text.xl.make(),
                        subtitle: '\$${_cart.items[index].price}'.text.xl.bold.make(),
                        
                        title: _cart.items[index].name.text.make(),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () => RemoveMutation(_cart.items[index]),
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
