import 'package:bloc_architecture/features/add_items/repository/add_itemsrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Items_bloc/Model/items.dart';
import 'add_itemsState.dart';
import 'add_itemsevent.dart';

class AddItemsbloc extends Bloc<itemsevent, ItemsState> {
  AddItemsRepository? itemsRepository;
  AddItemsbloc(this.itemsRepository) : super(addeditemsIntial()) {
    List<Items>? items;
    on((event, emit) async {
      if (event is add_itemsevent) {
         emit(addeditemsIntial());
         List addedCart = await itemsRepository!.getAdditems(items);
      }
    });
  }
}
