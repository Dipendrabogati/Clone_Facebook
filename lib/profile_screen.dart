import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/friend_requestscreen.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/individual_profile.dart';
import 'package:untitled/login_screen.dart';
import 'package:untitled/marketplace_screen.dart';
import 'package:untitled/video_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var object= Constants();
  SharedPreferences? preferences;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor:const Color.fromRGBO(250, 255, 245, 0.9) ,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                SizedBox(width: 8,),
                Text('Menu',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 16,
                  child: Icon(Icons.settings,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                SizedBox(width: 7,),
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 16,
                  child: Icon(Icons.search,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                SizedBox(width: 8,),
              ],
            ),
            Container(
              margin: const EdgeInsets.all( 8),
              height:60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: object.appbarcolor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 0.5,
                  color: Colors.black12,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>UserProfile(name: object.names[0],imageUrl:object.profilepic[0]),
                            ));
                      },
                      child: ClipOval(
                        child: Image.network(object.profilepic[0],
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>UserProfile(name: object.names[0],imageUrl:object.profilepic[0],)
                            ));
                      },
                      child: Text(object.names[0],style:TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )),
                    ),
                    const Expanded(child: SizedBox()),
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 16,
                      child: Icon(Icons.expand_more_sharp,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Row(
              children: [
                SizedBox(width: 8,),
                Text('Your shortcuts',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Row( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8,),
                Container(
                  width: 80,
                  child:
                  Column(
                    children: [
                      Stack(
                        children:[ Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 50,
                          height:50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(object.profilepic[0],),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                          Positioned(
                            right: 0,
                            bottom: -1,
                            child: Stack(
                              children: [
                              Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: object.appbarcolor,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 0.7,
                                  color: Colors.black26,

                                )
                              ),
                              ),
                                Positioned(
                                  right: 4.2,
                                  bottom:4.1,
                                  child: Container(
                                    height: 16,
                                    width:16,
                                    decoration: BoxDecoration(
                                      color:  object.iconcolor,
                                      borderRadius: BorderRadius.circular(100),
                                    ),

                                    child: Icon(
                                      Icons.groups_3_outlined,
                                      size: 11,
                                      color: object.appbarcolor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                         ],
                          ),
                      const SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text('Richard Feynman',
                               style: TextStyle(
                                 color: Color.fromRGBO(0, 0, 0,1),
                                 fontSize: 13,
                               ),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  width: 80,
                  child:
                  Column(
                    children: [
                      Stack(
                        children:[
                          Container(
                          margin:const EdgeInsets.symmetric(horizontal: 10),
                          width: 50,
                          height:50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(object.profilepic[2],),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                          Positioned(
                              right: 0,
                              bottom: -1,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    color: object.appbarcolor,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      width: 0.7,
                                      color: Colors.black26,
                                    )
                                ),
                                child:
                              const Icon(
                                Icons.flag,
                                size: 16,
                                color: Colors.red,
                              ),
                              ),
                          ),
                        ],
                      ),
                      const  SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            child:const Padding(
                              padding:  EdgeInsets.only(left: 15),
                              child: Text('Doti,Nepal',
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0,1),
                                  fontSize: 13,
                                ),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                  Container(
                  width: 80,
                  child:
                  Column(
                    children: [
                      Stack(
                        children:[
                          Container(
                            margin:const EdgeInsets.symmetric(horizontal: 10),
                            width: 50,
                            height:50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(object.profilepic[3],),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: -1,
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: object.appbarcolor,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                    width: 0.7,
                                    color: Colors.black26,
                                  )
                              ),
                              child:
                              const Icon(
                                Icons.flag,
                                size: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            child:const Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text('Meme\'s World',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            const Row(
              children: [
                SizedBox(width: 8,),
                Text('All shortcuts',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            GridView.builder(
                itemCount: object.icon.length,
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 7,
                  childAspectRatio: size.height/size.width*1.25,
                ) , itemBuilder:(context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: (){
                        switch(index){
                          case 0 : Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>const VideoScreen())
                                );
                          case 4 :Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const MarketPlace())
                          );
                          case 5:Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const FriendRequestScreen())
                          );
                          case 6:Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>const HomePage())
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              offset: Offset(0,2),
                            )
                          ],
                            color:object.appbarcolor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width:0.5,
                            color: Colors.black26,
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(object.icon[index],
                              size: 24,
                                color: object.iconcolor1[index],
                              ),
                              const SizedBox(height: 5,),
                              Text(object.iconname[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
            }
            ),
            const SizedBox(height: 20,),
            Container(
              height: 40,
              margin:const  EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(child: Text('See less',
              style: object.textstyle,)),
            ),
            const SizedBox(height: 20,),
            const Divider(height: 1,),
           Container(
             height: 50,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children: [
                   Container(
                       height: 30,
                       width: 30,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(100),
                         color: Colors.black12,
                       ),
                       child: const Icon(Icons.question_mark_sharp,
                         size: 24,
                       ),
                     ),
                   const SizedBox(width: 10,),
                   const Text('Help & Support',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),),
                   const Expanded(child: SizedBox()),
                   const Icon(Icons.expand_more_sharp,size: 24,)
                 ],
               ),
             ),
           ),
            const Divider(height: 1,),
            Container(
              height: 50,
              child:const  Padding(
                padding:  EdgeInsets.all(8.0),
                child: Row(
                  children: [
                     Icon(Icons.settings_outlined,
                    size: 30,
                    ),
                     SizedBox(width: 10,),
                    Text('Setting & Privacy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),),
                    Expanded(child: SizedBox()),
                    Icon(Icons.expand_more_sharp,size: 24,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: ()async{
                preferences = await SharedPreferences.getInstance();
                preferences!.clear();
                showDialog(context: context,
                    builder:(BuildContext context){
                    return  AlertDialog(
                      title: Text('Log out of your account?'),
                    actions:[
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text('CANCEL',
                                style: TextStyle(
                                  color: Colors.black,
                                ),),
                          ),
                          SizedBox(width: 8,),

                          TextButton(
                              onPressed: (){
                                Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (context) => const  LoginScreen( )),
                                      (route)=>false,
                                );
                            },
                          child:Text('LOG OUT',
                              style: TextStyle(
                                color: Colors.red,
                              ),),
                         ),
                        ],
                      ),
                      ],
                    );
                    });
              },
              child: Container(
                height: 40,
                margin:const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(child: Text('Log out',
                  style: object.textstyle,)),
              ),
            ),
            const  SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
