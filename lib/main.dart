import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/friend_requestscreen.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/marketplace_screen.dart';
import 'package:untitled/notification_screen.dart';
import 'package:untitled/profile_screen.dart';
import 'package:untitled/search_screen.dart';
import 'package:untitled/splash_screen.dart';
import 'package:untitled/video_screen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook clone',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var object= Constants();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconSize=MediaQuery.of(context).size.width*0.068;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          backgroundColor:Colors.grey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor:object.appbarcolor,
          title:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('facebook',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.width*0.08,
                      color: object.iconcolor,
                      ),
                    ),
                    const  Expanded(child: SizedBox()),
                  PopupMenuButton(

                    itemBuilder: (BuildContext context){
                      return const [
                        PopupMenuItem(
                            child:Row(
                              children: [
                                Icon(Icons.post_add_sharp,size: 20,color: Colors.black,),
                                SizedBox(width: 10,),
                                Text("Post",
                                 style: TextStyle(
                                   fontSize: 16,
                                   color: Colors.black,
                                   fontWeight: FontWeight.w600,
                                 ),),
                              ],
                            )
                        ),
                        PopupMenuItem(
                            child:Row(
                              children: [
                                Icon(Icons.menu_book,size: 20,color: Colors.black,),
                                SizedBox(width: 10,),
                                Text("Story",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ],
                            )
                        ),
                        PopupMenuItem(
                            child:Row(
                              children: [
                                Icon(Icons.video_stable_rounded,size: 20,color: Colors.black,),
                                SizedBox(width: 10,),
                                Text("Reel",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ],
                            )
                        ),
                        PopupMenuItem(
                            child:Row(
                              children: [
                                Icon(Icons.emergency_recording,size: 20,color: Colors.black,),
                                SizedBox(width: 10,),
                                Text("Live",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ],
                            )
                        ),
                      ];
                    },
                    child: Container(
                      height:iconSize*1.6 ,
                      width:iconSize*1.6 ,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[50],
                      ),
                      child:Icon(Icons.add,
                              size: iconSize*1.2,
                              color:Colors.black,
                              ),
                    ),
                  ),
                   const  SizedBox(width: 5,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[50],
                      ),

                      child: IconButton(
                      onPressed: (){
                         Navigator.push(context,
                           MaterialPageRoute(builder: (context) =>const SearchScreen())
                         );
                      },
                      icon: Icon(Icons.search,
                        size: iconSize,
                        color: Colors.black,
                      ),
                    ),
                   ),
                    const SizedBox(width: 5,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[50],
                      ),

                      child: IconButton(
                        onPressed: (){

                        },
                        icon: Icon(CupertinoIcons.chat_bubble_2_fill,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
            bottom:  TabBar(
              labelColor: object.iconcolor,
              indicatorColor:object.iconcolor,
            tabs: [
               Tab(
                child: Icon(CupertinoIcons.house_alt_fill,size: iconSize,),
              ),
               Tab(
                child: Icon(Icons.ondemand_video,size: iconSize,),
              ),
              Tab(
                child: Icon(CupertinoIcons.person_2,size:iconSize,)
              ),
              Tab(
                child: Icon(Icons.card_travel_sharp,size: iconSize,),
              ),
               Tab(
                child: Icon(Icons.notifications_none_rounded,size: iconSize,)
              ),
              Tab(
                child:Stack(
                  children:[ ClipOval(
                    child: Image.network(object.profilepic[0],
                    height: iconSize,
                    width: iconSize,
                      fit: BoxFit.cover,),
                  ),
                   Positioned(
                       right: -2,
                       bottom: -2,
                       child: Container(
                         height: 18,
                         width: 18,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100),
                           color: Colors.black54,
                           border: Border.all(
                             width: 2,
                             color: object.appbarcolor,
                           )
                         ),
                         child: Icon(Icons.menu_rounded,size: 14,
                          color: object.appbarcolor,),
                       ),),
                ],
                ),
              ),
            ],
        ),

        ),
        body: const  TabBarView(
          children: [
            HomePage(),
            VideoScreen(),
            FriendRequestScreen(),
            MarketPlace(),
            NotificationScreen(),
            ProfileScreen(),
          ],
        )
      ),
    );
  }
}


