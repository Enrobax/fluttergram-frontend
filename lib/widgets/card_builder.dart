import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/screens/comment_screen.dart';
import 'package:http/http.dart';

import '../models/post.dart';

class CardBuilder extends StatefulWidget {
  final Post post;
  const CardBuilder({Key? key, required this.post}) : super(key: key);


  @override
  State<CardBuilder> createState() => _CardBuilderState();
}

class _CardBuilderState extends State<CardBuilder> {

  late bool liked;
  List<String> urls =['https://picsum.photos/300/400', 'https://picsum.photos/300/400'];

  @override
  void initState() {
    liked = false;
    urls.clear();
    urls.add(widget.post.url1!);
    if(widget.post.url2 != null){
      urls.add(widget.post.url2!);
    }
    if(widget.post.url3 != null){
      urls.add(widget.post.url3!);
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    if(post != null){
    return Padding(
      padding: const EdgeInsets.only(top: 1.0, bottom: 10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               ListTile(
                 dense: true,
               leading: Container(
                 decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1), shape: BoxShape.circle),
                 child: Container(
                 height: 40,
                 width: 40,
                 decoration: BoxDecoration(
                 color: Colors.green,
                 border: Border.all(color: Colors.black, width: 2),
              shape: BoxShape.circle),
                 ),
               ),
               title: Text(widget.post.user!.username!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                 subtitle: Text(widget.post.position != null? widget.post.position! : ""),
               trailing: Icon(Icons.more_vert),
    ),
            SizedBox(
              height: 350,
              width: double.infinity,
                child: ImageBuilder(urls)),
            Row(children: [
              IconButton(onPressed: () {
                setState(() {
                  liked= !liked;
                });
              }, icon: Icon(
                liked ? Icons.favorite :  Icons.favorite_border_outlined, color: liked? Colors.red : Colors.white)),
              IconButton(onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CommentsScreen()),
              );
              }, icon: Icon(Icons.messenger_outline_rounded, color: Colors.white)),
              IconButton(onPressed: null, icon: Icon(Icons.near_me_outlined, color: Colors.white))
            ],),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text.rich(TextSpan(
                    text: widget.post.user!.username!,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    children: [TextSpan(text: ' ${widget.post.text}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal))]
                ), textAlign: TextAlign.start)
            )
          ]
      ),
    );}
    else{return Container();}
  }

   Widget ImageBuilder(List<String> url){
     return PageView.builder(
         itemCount: url.length,
         scrollDirection: Axis.horizontal,
         itemBuilder: (build, index){
           return InkWell(
             onDoubleTap: (){
               setState(() {
                 liked= true;
               });
             },
             child: SizedBox(
               width: MediaQuery.of(context).size.width,
               child: Image(fit:BoxFit.cover, image: NetworkImage(url[index])),
             ),
           );
         });
   }

}
