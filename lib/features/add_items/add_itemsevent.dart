import '../Items_bloc/Model/items.dart';
import '../Items_bloc/Model/itemsjson.dart';

abstract class itemsevent{}
class add_itemsevent extends itemsevent{
  itemsjson? items;
  List<Items>?listOfItems =[];
  List? product_items =[];
  add_itemsevent({this.items,this.product_items});
}