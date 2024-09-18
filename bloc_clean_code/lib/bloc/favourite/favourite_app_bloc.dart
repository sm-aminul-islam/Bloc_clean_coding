import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/bloc/favourite/favourite_app_event.dart';
import 'package:bloc_clean_code/bloc/favourite/favourite_app_state.dart';
import 'package:bloc_clean_code/model/favourite_item_model.dart';
import 'package:bloc_clean_code/repository/favourite_repositroy.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteItemStates> {
  FavouriteRepositroy favouriteRepositroy;
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempfovouriteList = [];
  FavouriteAppBloc(this.favouriteRepositroy) : super(FavouriteItemStates()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavourite);
    on<SelecctedItem>(_selectItem);
    on<UnSelecctedItem>(_unselectItem);
    on<DeleteEvent>(_deleteItem);
  }
  void fetchList(
      FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteList = await favouriteRepositroy.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavourite(
      FavouriteItem event, Emitter<FavouriteItemStates> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);
    favouriteList[index] = event.item;
    emit(state.copyWith(
      favouriteItemList: List.from(favouriteList),
    ));
  }

  void _selectItem(
      SelecctedItem event, Emitter<FavouriteItemStates> emit) async {
    tempfovouriteList.add(event.item);
    emit(state.copyWith(
      tempfavouriteItemList: List.from(tempfovouriteList),
    ));
  }

  void _unselectItem(
      UnSelecctedItem event, Emitter<FavouriteItemStates> emit) async {
    tempfovouriteList.remove(event.item);
    emit(state.copyWith(
      tempfavouriteItemList: List.from(tempfovouriteList),
    ));
  }

  void _deleteItem(DeleteEvent event, Emitter<FavouriteItemStates> emit) {
    for (int i = 0; i < tempfovouriteList.length; i++) {
      favouriteList.remove(tempfovouriteList[i]);
    }
    tempfovouriteList.clear();
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempfavouriteItemList: List.from(tempfovouriteList),
      ),
    );
  }
}
