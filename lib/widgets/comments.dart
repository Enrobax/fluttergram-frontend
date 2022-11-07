import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  final String testo;
  final void Function()? delete;
  const Comment({Key? key, required this.testo, this.delete}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  bool like = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onLongPressStart: (details)=>showMenu(
          context: context,
          position: RelativeRect.fill,
          items: [
            PopupMenuItem(
              onTap: widget.delete != null ? widget.delete! : null,
                child: SizedBox(child: Text('Elimina'),))
          ]),

      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.blue),
        title: Text(widget.testo),
        subtitle: Row(
          children: [
            Text('time'),
            TextButton(onPressed: null, child: Text('12 like')),
            TextButton(onPressed: null, child: Text('Rispondi'))
          ],
        ),
        trailing: IconButton(
          onPressed: (){
            setState(() {
              like=!like;
            });
          },
          icon: Icon( like ? Icons.favorite : Icons.favorite_border_outlined, size: 17, color: like ? Colors.red : null),
        ),
      ),

    );
  }
}
