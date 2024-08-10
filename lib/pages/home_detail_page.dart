import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:flutter_application_3/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_application_3/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.make(),
              AddToCart(catalog: catalog).wh(130, 50),
            ],
          ).p32(),
        ),
        body: SafeArea(
            bottom: false,
            child: Column(children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.asset(catalog.image))
                  .h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(children: [
                      catalog.name.text.xl4
                          .color(MyTheme.darkbluecolor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Culpa et labore mollit deserunt et laborum dolore amet labore sint irure. Enim eu exercitation occaecat veniam. Nulla sint laborum nostrud exercitation labore nulla deserunt cillum cillum do ex cupidatat occaecat. Tempor eu est aliqua pariatur veniam ad."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ]
                    ).py(64),
                  ),
                ),
              )
            ])));
  }
}
