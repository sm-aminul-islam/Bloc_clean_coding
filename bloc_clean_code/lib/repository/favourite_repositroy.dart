import 'package:bloc_clean_code/model/favourite_item_model.dart';

class FavouriteRepositroy {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_genarateList(10));
  }

  List<FavouriteItemModel> _genarateList(int length) {
    return List.generate(
        length,
        (index) =>
            FavouriteItemModel(id: index.toString(), value: 'Item $index'));
  }
}
