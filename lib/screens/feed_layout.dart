import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/Bloc/post_list_bloc/post_list_bloc.dart';
import 'package:fluttergram/screens/direct_screen.dart';

import '../models/post.dart';
import '../widgets/card_builder.dart';
import '../widgets/stories_builder.dart';

class FeedLayout extends StatefulWidget {
  const FeedLayout({Key? key}) : super(key: key);

  @override
  State<FeedLayout> createState() => _FeedLayoutState();
}

class _FeedLayoutState extends State<FeedLayout> {
  List<Post> posts = [];
  late PostsListBloc _postsListBloc;
  bool liked = false;

  @override
  void initState() {
    _postsListBloc = BlocProvider.of<PostsListBloc>(context)
      ..add(GetPostsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostsListBloc, PostsListState>(listener: (context, state){
           if(state is GetPostsListStateLoading){
             showDialog(
                 context: context,
                 builder: (context) => Center(
                     child: CircularProgressIndicator(color: Colors.blue)));
           }
           if(state is GetPostsListStateSuccess){
             if(state.response.statusCode == 200){
               Navigator.pop(context);
               final fetchedItems = jsonDecode(state.response.body);
               posts.clear();
               for(var item in fetchedItems){
                 posts.add(Post.fromJson(item));
               }
               debugPrint("success loading");
             }
           }
           if(state is GetPostsListStateFailure){
             Navigator.pop(context);
             showDialog(
                 context: context,
                 builder: (context) {
                   return Center(
                     child: SizedBox(
                       width: 300,
                       child: Card(
                         child: Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Column(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Row(
                                 children: [
                                   const Expanded(
                                     child: Text('ERRORE',
                                         style: TextStyle(
                                             fontSize: 20,
                                             fontWeight: FontWeight.bold)),
                                   ),
                                   InkWell(
                                     onTap: () {
                                       Navigator.pop(context);
                                     },
                                     child: const Icon(
                                       Icons.close,
                                       color: Colors.black38,
                                       size: 20,
                                     ),
                                   ),
                                 ],
                               ),
                               const Padding(
                                 padding: EdgeInsets.only(bottom: 11.0, top: 18),
                                 child: Divider(
                                   height: 1,
                                   color: Colors.grey,
                                 ),
                               ),
                               Text(
                                   'Si è verificato un errore. StatusCode errore: ${state.response.statusCode}')
                             ],
                           ),
                         ),
                       ),
                     ),
                   );
                 });
           }
        })
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Fluttergram', style: TextStyle(fontFamily: 'Satisfy', color: Colors.white, fontSize: 27)),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.add_box_outlined, color: Colors.white)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border_outlined, color: Colors.white)),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DirectScreen()));
            }, icon: const Icon(Icons.near_me_outlined, color: Colors.white)),],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 105,
              child: Row(
                children: const [
                  Flexible(child: StoriesBuilder(number: 50, storiaInEvidenza: false))],
              ),
            ),
            const Divider(height: 1, color: Colors.white),
            Container(
                height: 500,
                child: postBuilder())

          ],
        ),
      ),
    );
  }

  Widget postBuilder(){
    return ListView.builder(
      itemCount: posts.length,
        itemBuilder: (context, index){
        return CardBuilder(post: posts[index]);
    });
  }

}
