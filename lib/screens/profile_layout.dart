import 'package:flutter/material.dart';

import '../widgets/grid_post.dart';
import '../widgets/stories_builder.dart';

class ProfileLayout extends StatefulWidget {
  const ProfileLayout({Key? key}) : super(key: key);

  @override
  State<ProfileLayout> createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  late bool visible;
  List<String> urlList = [
    'https://www.motori.it/aid8kYlS2xOlXsX5RpprOOnqsgY=/720x495/smart/uploads/2020/11/angelourbano-12596.jpg',
    'https://preview.redd.it/tie7zuqunaw01.jpg?width=640&crop=smart&auto=webp&s=52428b31704d0bc3a4a5f89ebb97745a288315c5',
    'http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcT09XrYh-k_OCd0ERoA22SzGGV3dpudenQzt3zJKEy7ZpDqE_Gudv7wY70Sey9IhroKHBgOqtTvRSBu3qHk2xQ',
    'https://images.unsplash.com/photo-1611915387288-fd8d2f5f928b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80'
  ];

  @override
  void initState() {
    visible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'nick_name',
        ),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.add_box_outlined, color: Colors.white)),
          IconButton(
              onPressed: null,
              icon: Icon(Icons.menu_outlined, color: Colors.white))
        ],
      ),
      body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, _){
              return [
                SliverList(delegate: SliverChildListDelegate([
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red, width: 2),
                                      shape: BoxShape.circle),
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
                                const Text.rich(
                                    TextSpan(
                                        text: '79',
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: '\npost',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal))
                                        ]),
                                    textAlign: TextAlign.center),
                                const Text.rich(
                                    TextSpan(
                                        text: '379',
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: '\nfollower',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal))
                                        ]),
                                    textAlign: TextAlign.center),
                                const Text.rich(
                                    TextSpan(
                                        text: '211',
                                        style: TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text: '\nseguiti',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal))
                                        ]),
                                    textAlign: TextAlign.center)
                              ]),
                          const Padding(
                              padding: EdgeInsets.only(bottom: 2.0, top: 10.0),
                              child: Text('Nick Name')),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text('Biografia'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 2.0, bottom: 10.0),
                            child: Text('Link'),
                          ),
                          SizedBox(
                            height: 30,
                            child: Row(
                              children: const [
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: null,
                                        child: Text('Modifica profilo',
                                            style: TextStyle(color: Colors.white)))),
                                SizedBox(width: 5),
                                ElevatedButton(
                                    onPressed: null,
                                    child: Icon(Icons.person_add, color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                    TextSpan(
                                        text: 'Storie in evidenza',
                                        style: TextStyle(
                                            fontSize: 15, fontWeight: FontWeight.bold),
                                        children: [
                                          TextSpan(
                                              text:
                                              '\nConserva le tue storie preferite sul tuo profilo',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal))
                                        ]),
                                    textAlign: TextAlign.start),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                    icon: visible == true
                                        ? const Icon(
                                      Icons.keyboard_arrow_up_outlined,
                                      color: Colors.white,
                                    )
                                        : const Icon(
                                        Icons.keyboard_arrow_down_outlined))
                              ],
                            ),
                          ),
                          Visibility(
                            visible: visible,
                            child: const SizedBox(
                              height: 110,
                              width: double.infinity,
                              child: StoriesBuilder(number: 0, storiaInEvidenza: true),
                            ),
                          )
                        ],
                      ))
                ]))
              ];
            },
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorWeight: 2,
                    indicatorColor: Colors.white,
                    tabs: [
                  Tab(icon: Icon(Icons.grid_on_outlined)),
                  Tab(icon: Icon(Icons.movie_outlined)),
                  Tab(icon: Icon(Icons.perm_contact_cal_outlined))
                ]),
                Expanded(
                  child: TabBarView(children: [
                    GridPost(
                      urlPost: urlList,
                      isReel: false,
                    ),
                    GridPost(
                      urlPost: urlList,
                      isReel: true,
                    ),
                    GridPost(
                      urlPost: urlList,
                      isReel: false,
                    )
                  ]),
                )
              ],
            ),
          )),

    );
  }
}
