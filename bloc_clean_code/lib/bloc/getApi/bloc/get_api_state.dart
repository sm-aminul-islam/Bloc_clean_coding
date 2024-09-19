import 'package:bloc_clean_code/model/post_api_model.dart';
import 'package:bloc_clean_code/utils/enum.dart';
import 'package:equatable/equatable.dart';

class GetApiStates extends Equatable {
  final PostStatus postStatus;
  final List<PostApiModel> postList;
  final List<PostApiModel> tempostList;
  final String message;
  final String searchMessage;

  GetApiStates(
      {this.postStatus = PostStatus.loading,
      this.postList = const <PostApiModel>[],
      this.message = "",
      this.searchMessage = '',
      this.tempostList = const <PostApiModel>[]});
  GetApiStates copyWith(
      {PostStatus? postStatus,
      List<PostApiModel>? postList,
      List<PostApiModel>? tempostList,
      String? message,
      String? searchMessage}) {
    return GetApiStates(
        postList: postList ?? this.postList,
        tempostList: tempostList ?? this.tempostList,
        postStatus: postStatus ?? this.postStatus,
        message: message ?? this.message,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [postStatus, postList, message, tempostList, searchMessage];
}
