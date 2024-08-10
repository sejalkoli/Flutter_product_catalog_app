import 'package:flutter_application_3/core/store.dart';
import 'package:flutter_application_3/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
  

  // catalog field _:private
  late CatalogModel _catalog; 

  // collection of id's - store ids of all items
  final List<int> _itemIds =[];

  // get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in d cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);



}

// mutation means all logic we have to perform
class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform(){
    store!.cart._itemIds.add(item.id); // to add an item
  }
 
}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform(){
    store!.cart._itemIds.remove(item.id); // to remove an item
  }
 
}