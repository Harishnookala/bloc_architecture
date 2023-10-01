import 'package:bloc_architecture/features/Items_bloc/items_event.dart';
import 'package:bloc_architecture/features/Items_bloc/items_state.dart';
import 'package:bloc_architecture/features/Items_bloc/repository/itemsrepository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'Model/items.dart';

class itemsbloc extends Bloc<items_event,itemsState>{
  itemsrepository? itemsrepo;
  Items? items;

  itemsbloc(this.itemsrepo) : super(itemsIntial()) {
    on((event, emit) async{
       if(event is fetchitems){
         print("Harsih");
         emit(itemsIntial());
         var fetchvalues = await itemsrepo!.getdata(items);
         emit(itemsFetchCompleted(items: fetchvalues));
       }
    });
  }
}