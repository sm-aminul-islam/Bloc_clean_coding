import 'package:equatable/equatable.dart';

abstract class GetApiEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class PostFeatched extends GetApiEvent {}

class SearchItem extends GetApiEvent {
  final String stSearch;
  SearchItem(this.stSearch);
}
