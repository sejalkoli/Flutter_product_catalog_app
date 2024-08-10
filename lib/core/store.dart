import 'package:flutter_application_3/models/cart.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

// we have to add our model in this store 
// it stores strings and all operations
// provider also use
class MyStore extends VxStore{
  late CatalogModel catalog;
  late CartModel cart;

  MyStore(){
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }

}