import 'package:bloc_clean_code/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();
  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteAppEvent {}

class FavouriteItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  FavouriteItem({required this.item});
}

class SelecctedItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  SelecctedItem({required this.item});
}

class UnSelecctedItem extends FavouriteAppEvent {
  final FavouriteItemModel item;
  UnSelecctedItem({required this.item});
}

class DeleteEvent extends FavouriteAppEvent {}
