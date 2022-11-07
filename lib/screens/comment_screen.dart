import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/widgets/comments.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}



class _CommentsScreenState extends State<CommentsScreen> {

  List<String> commenti = [];
  TextEditingController controller = TextEditingController();

  void addToText(){

  }

  void addComment(TextEditingController controller){
    setState(() {
      commenti.add(controller.text);
      controller.clear();
    });
  }

  void removeComment(int index){
    setState(() {
      commenti.removeAt(index);
    });
  }

  Widget buildCommentsList(){
    return ListView.builder(
        itemCount: commenti.length,
        itemBuilder: (context,index){
          return Comment(testo: commenti[index], delete: ()=>removeComment(index));
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> emoticons = [];
    return GestureDetector(
      onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Commenti',
            style: TextStyle(
              color: Colors.white,
              fontSize:  23,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined,
              color: Colors.white,),
          ),
          actions: [
            IconButton(onPressed: null,
              icon: Icon(Icons.more_vert_outlined),
              color: Colors.white,
            ),
          ],
        ),
        body: Column(children: [Expanded(child: buildCommentsList())]),
        bottomSheet: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.black26,
          child: Column(
            children: [
              Container(
                color: Colors.redAccent,
                child: Row(children:
                emoticons,),
              ),
              Container(
                color: Colors.black26,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                      ),),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 40,
                          child: TextField(
                            focusNode: FocusScopeNode(),
                            controller: controller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: 'Aggiungi un commento',
                              border: InputBorder.none,
                              suffix: InkWell(
                                onTap: ()=> addComment(controller),
                                child: Text('Pubblica', style: TextStyle(color: Colors.blueAccent),),
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }


}
