part of 'post_list_bloc.dart';

class PostsListState {}

class PostsListInitial extends PostsListState {}

class GetPostsListStateLoading extends PostsListState{}

class GetPostsListStateSuccess extends PostsListState{
  final Response response;

  GetPostsListStateSuccess({required this.response});
}

class GetPostsListStateFailure extends PostsListState{
  final Response response;

  GetPostsListStateFailure({required this.response});
}