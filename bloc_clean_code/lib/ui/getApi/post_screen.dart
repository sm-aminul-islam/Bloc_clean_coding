import 'package:bloc_clean_code/bloc/getApi/bloc/get_api_bloc.dart';
import 'package:bloc_clean_code/bloc/getApi/bloc/get_api_event.dart';
import 'package:bloc_clean_code/bloc/getApi/bloc/get_api_state.dart';
import 'package:bloc_clean_code/utils/enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetApiBloc>().add(PostFeatched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Screen'),
      ),
      body: BlocBuilder<GetApiBloc, GetApiStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return CircularProgressIndicator();
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.success:
            return Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Search with Email'),
                  onChanged: (filterkey) {
                    context.read<GetApiBloc>().add(SearchItem(filterkey));
                  },
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty
                      ? Center(child: Text(state.searchMessage.toString()))
                      : ListView.builder(
                          itemCount: state.tempostList.isEmpty
                              ? state.postList.length
                              : state.tempostList.length,
                          itemBuilder: (context, index) {
                            if (state.tempostList.isNotEmpty) {
                              final item = state.tempostList[index];
                              return Card(
                                child: ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                ),
                              );
                            } else {
                              final item = state.postList[index];
                              return Card(
                                child: ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                ),
                              );
                            }
                          }),
                )
              ],
            );
        }
      }),
    );
  }
}
