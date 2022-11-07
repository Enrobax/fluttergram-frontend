import 'package:flutter/material.dart';

class DirectScreen extends StatefulWidget {
  const DirectScreen({Key? key}) : super(key: key);

  @override
  State<DirectScreen> createState() => _DirectScreenState();
}

class _DirectScreenState extends State<DirectScreen> {


  @override
  Widget build(BuildContext context) {

    List<Widget> messaggi =[];
    for(int i=0; i<15; i++){
      messaggi.add(messageTiles());
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }
            , icon: Icon(Icons.arrow_back)),
        title: Text("nick_name"),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.video_call_outlined)),
          IconButton(onPressed: null, icon: Icon(Icons.edit_outlined))
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _){
            return[
              SliverList(delegate: SliverChildListDelegate([
                Container(height: 50, color: Colors.red),
                TabBar(
                    tabs: [
                      Tab(child: Text("Chat"),),
                      Tab(child: Text("Generale"),),
                      Tab(child: Text("Richieste"),)
                    ]),
              ]))
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                  ListView(
                    children: messaggi,
                  ),
                  Text("Generale"),
                  Text("Richieste")
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget messageTiles(){
    return  ListTile(
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
      title: Text("Nome Amico", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
      subtitle: Text('Contenuto messaggio...'),
      trailing: Icon(Icons.camera_alt_outlined),
    );
  }
}
