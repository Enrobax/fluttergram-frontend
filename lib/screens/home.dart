import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/Bloc/post_list_bloc/post_list_bloc.dart';
import 'package:fluttergram/network/api.dart';
import 'package:fluttergram/screens/profile_layout.dart';

import 'feed_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  void changePage(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    ApiCalls apiCalls = ApiCalls();

    return Scaffold(
      backgroundColor: Colors.black38,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints contraints) {
            switch (_currentIndex) {
              case 0:
                return MultiBlocProvider(
                  providers:[
                    BlocProvider<PostsListBloc>(create: (context)=> PostsListBloc(apiCalls: apiCalls))
                  ],
                    child: const FeedLayout());
              case 1:
                return Center(child: Container(color: Colors.grey, child: Text('Pagina $_currentIndex'),));

              case 2:
                return Center(child: Container(color: Colors.grey, child: Text('Pagina $_currentIndex'),));

              case 3:
                return Center(child: Container(color: Colors.grey, child: Text('Pagina $_currentIndex'),));

              case 4:
                return ProfileLayout();
              default:
                return Container();
            }
          }),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          onTap: changePage,
          items: [
            BottomNavigationBarItem(
                icon:
                Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                    _currentIndex == 1 ? Icons.search : Icons.search_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                    _currentIndex == 2 ? Icons.movie : Icons.movie_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(_currentIndex == 3
                    ? Icons.shopping_bag
                    : Icons.shopping_bag_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(_currentIndex == 4
                    ? Icons.person
                    : Icons.person_outline_outlined),
                label: ''),
          ]),
    );
  }
}








