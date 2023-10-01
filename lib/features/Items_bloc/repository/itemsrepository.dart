import '../Model/items.dart';
import '../Model/itemsjson.dart';

abstract class itemsrepository{
  Future<itemsjson> getdata (Items? items);
}