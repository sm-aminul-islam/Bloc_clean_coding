import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/bloc/getApi/bloc/get_api_event.dart';
import 'package:bloc_clean_code/bloc/getApi/bloc/get_api_state.dart';
import 'package:bloc_clean_code/model/post_api_model.dart';
import 'package:bloc_clean_code/repository/post_repository.dart';
import 'package:bloc_clean_code/utils/enum.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiStates> {
  List<PostApiModel> tempostList = [];
  PostRepository postRepository = PostRepository();
  GetApiBloc() : super(GetApiStates()) {
    on<PostFeatched>(fetchPostApi);
    on<SearchItem>(_filterList);
  }
  void fetchPostApi(PostFeatched event, Emitter<GetApiStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, message: "Success", postList: value));
    }).onError((error, StackTrace) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }

  void _filterList(SearchItem event, Emitter<GetApiStates> emit) async {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempostList: [], searchMessage: ''));
    } else {
      tempostList = state.postList
          .where((element) =>
              element.email.toString().toLowerCase() ==
              event.stSearch.toString().toLowerCase())
          .toList();
      if (tempostList.isEmpty) {
        emit(state.copyWith(
            tempostList: tempostList, searchMessage: "NO Data Found"));
      } else {
        emit(state.copyWith(tempostList: tempostList, searchMessage: ''));
      }
    }
  }
}
