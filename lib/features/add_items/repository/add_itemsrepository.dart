import '../../Items_bloc/Model/items.dart';
import '../../Items_bloc/Model/itemsjson.dart';

abstract class AddItemsRepository{
  Future<List<itemsjson>> getAdditems(List<Items>? items);
}