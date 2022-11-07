import 'dart:math';

import 'package:flutter/material.dart';

class StoriesBuilder extends StatelessWidget {
  final int number;
  final bool storiaInEvidenza;
  const StoriesBuilder({Key? key, required this.number, required this.storiaInEvidenza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(storiaInEvidenza){
    return profileStories();
    }else{
      return feedStories();
    }
  }

  Widget feedStories(){
    List<String> nomiAmici = [];
    for(int i=0; i<= number; i++){
      nomiAmici.add('amico_$i');
    }

    final random = new Random();

    return ListView.builder(
        shrinkWrap: true,
        itemCount: number,
        scrollDirection: Axis.horizontal,
        itemBuilder: (build, index){
          if (index ==0) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), shape: BoxShape.circle),
                    child: Container(
                      height: 69,
                      width: 69,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                    ),
                  ),
                  Text('nick_name')
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), shape: BoxShape.circle),
                    child: Container(
                      height: 69,
                      width: 69,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255)),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                    ),
                  ),
                  Text(nomiAmici[index])
                ],
              ),
            );
          }
        });

  }

  Widget profileStories(){
    final random = new Random();
    if(number == 0){
      return ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (build, index){
            return index == 0? Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: 69,
                    width: 69,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 30,),
                  ),
                ],
              ),
            ): Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: 69,
                    width: 69,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                  ),
                ],
              ),
            );
          });
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: number,
        scrollDirection: Axis.horizontal,
        itemBuilder: (build, index){
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 2), shape: BoxShape.circle),
                    child: Container(
                      height: 69,
                      width: 69,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255)),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 3),
                      ),
                    ),
                  ),
                  const Text("Titolo Storia")
                ],
              ),
            );
        });
    }
  }
}
