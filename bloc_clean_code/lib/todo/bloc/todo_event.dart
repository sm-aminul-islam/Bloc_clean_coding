part of 'todo_bloc.dart';

class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddToDoEvent extends TodoEvent {
  final String task;
  AddToDoEvent({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveTodoEvent extends TodoEvent {
  final Object task;
  RemoveTodoEvent({required this.task});
  @override
  List<Object> get props => [task];
}
