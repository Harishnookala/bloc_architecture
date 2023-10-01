import 'package:bloc_architecture/features/Items_bloc/Model/itemsjson.dart';

abstract class itemsState{}

class itemsIntial extends itemsState{}
class itemsFetchCompleted extends itemsState{
  itemsjson? items;
  itemsFetchCompleted({this.items});
}