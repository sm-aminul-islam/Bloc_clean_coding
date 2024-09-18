import 'package:bloc_clean_code/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> tempfavouriteItemList;
  final ListStatus listStatus;
  FavouriteItemStates(
      {this.favouriteItemList = const [],
      this.listStatus = ListStatus.loading,
      this.tempfavouriteItemList = const []});

  FavouriteItemStates copyWith(
      {List<FavouriteItemModel>? favouriteItemList,
      List<FavouriteItemModel>? tempfavouriteItemList,
      ListStatus? listStatus}) {
    return FavouriteItemStates(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        tempfavouriteItemList:
            tempfavouriteItemList ?? this.tempfavouriteItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [favouriteItemList, listStatus, tempfavouriteItemList];
}
