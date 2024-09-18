import 'package:bloc_clean_code/bloc/favourite/favourite_app_bloc.dart';
import 'package:bloc_clean_code/bloc/favourite/favourite_app_event.dart';
import 'package:bloc_clean_code/bloc/favourite/favourite_app_state.dart';
import 'package:bloc_clean_code/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteAppBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        centerTitle: true,
        actions: [
          BlocBuilder<FavouriteAppBloc, FavouriteItemStates>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempfavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteAppBloc>().add(DeleteEvent());
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.orange,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavouriteAppBloc, FavouriteItemStates>(
            builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return Text("something went wrong");
            case ListStatus.success:
              return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: state.tempfavouriteItemList.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value!) {
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(SelecctedItem(item: item));
                              } else {
                                context
                                    .read<FavouriteAppBloc>()
                                    .add(UnSelecctedItem(item: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel itemModel = FavouriteItemModel(
                                  id: item.id,
                                  value: item.value,
                                  isFavourite: item.isFavourite ? false : true);
                              context
                                  .read<FavouriteAppBloc>()
                                  .add(FavouriteItem(item: itemModel));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline)),
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
