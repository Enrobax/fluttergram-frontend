
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';

import '../../network/api.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostsListBloc extends Bloc<PostListEvent, PostsListState> {
  final ApiCalls apiCalls;
  PostsListBloc({required this.apiCalls}) : super(PostsListInitial()) {
    on<GetPostsListEvent>(_onGetPostsList);
  }

  void _onGetPostsList(GetPostsListEvent event, Emitter<PostsListState> emitter) async{

    emitter(GetPostsListStateLoading());

    var response = await apiCalls.getAllPosts();

    if(response.statusCode == 200){
      emitter(GetPostsListStateSuccess(response: response));
    }
    else{
      emitter(GetPostsListStateFailure(response: response));
    }
  }
}
