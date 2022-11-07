import 'package:flutter/material.dart';
import '../screens/comment_screen.dart';

class GridPost extends StatefulWidget {
  final List<String> urlPost;
  final bool isReel;

  const GridPost({Key? key, required this.urlPost, required this.isReel}) : super(key: key);

  @override
  State<GridPost> createState() => _GridPostState();
}

class _GridPostState extends State<GridPost> {

  late bool liked;

  @override
  void initState() {
    liked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return widget.isReel == false ? normalGreed() : reelsGrid();

  }

  Widget normalGreed(){
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemCount: widget.urlPost.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: ()=>showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: CardPost(widget.urlPost),
                  );
                },
                
              ),
              child: Image.network(fit: BoxFit.cover, widget.urlPost[index]));
        });
  }

  Widget reelsGrid(){
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (2/3),
        ),
        itemCount: widget.urlPost.length,
        itemBuilder: (context, index) {
          return Image.network(fit: BoxFit.cover, widget.urlPost[index]);
        });
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

  Widget CardPost(List<String>url){
    return Card(
       color: Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      child:
          Container(
            height: 470,
            child: Column(
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
                  title: Text("nick_name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  subtitle: Text('Location'),
                  trailing: Icon(Icons.more_vert),
                ),
                Container(
                    height: 350,
                    width: double.infinity,
                    child: ImageBuilder(url)
                ),
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
              ],
            ),
          )
    );
  }
}

