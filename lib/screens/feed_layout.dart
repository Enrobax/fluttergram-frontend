import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/screens/direct_screen.dart';

import '../widgets/card_builder.dart';
import '../widgets/stories_builder.dart';

class FeedLayout extends StatefulWidget {
  const FeedLayout({Key? key}) : super(key: key);

  @override
  State<FeedLayout> createState() => _FeedLayoutState();
}

class _FeedLayoutState extends State<FeedLayout> {

  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const CardBuilder(
              name: 'cat_lover99',
              url: ['http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT09XrYh-k_OCd0ERoA22SzGGV3dpudenQzt3zJKEy7ZpDqE_Gudv7wY70Sey9IhroKHBgOqtTvRSBu3qHk2xQ',
                    'https://images.unsplash.com/photo-1611915387288-fd8d2f5f928b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
              ]
          ),
          const CardBuilder(
              name:'pinco.pallino',
              url: ['https://cdn.pixabay.com/photo/2021/01/24/21/52/grand-canyon-5946657_960_720.jpg']
          ),
          const CardBuilder(
              name: 'mariolino87',
              url: ['https://cdn.pixabay.com/photo/2012/03/04/00/09/lions-21787_960_720.jpg']
          )
        ],
      ),
    );
  }

}
