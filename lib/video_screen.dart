import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/comment_section.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/individual_profile.dart';
import 'package:untitled/photoviewer_screen.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  var object= Constants();
  List<bool> isLiked=[false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    double textSize=MediaQuery.of(context).size.width*0.031;
    Size size = MediaQuery.of(context).size;
    double iconSize=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      backgroundColor: Colors.grey,
      body:
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 100,
              color: object.appbarcolor,
              child: Column(
                children: [
                  const Padding(
                    padding:  EdgeInsets.only( top: 6.0,left: 8,right: 8),
                    child: Row(
                      children: [
                        Text('Video',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),),
                        Expanded(child: SizedBox()),
                        CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 16,
                          child: Icon(Icons.person,
                          color: Colors.black,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 10,),
                        CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 16,
                          child: Icon(Icons.search,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 7,),
                      ],
                    ),
                  ),

             Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed:(){

                    },
                    child:Text('For you',
                    style: TextStyle(
                      fontSize: textSize*1.1,
                      fontWeight: FontWeight.w600,
                    ),
                    )
                ),
                TextButton(
                    onPressed:(){

                    },
                    child:Text('Live',
                      style:TextStyle(
                        fontSize: textSize*1.1,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                ),
                TextButton(
                    onPressed:(){

                    },
                    child:Text('Gaming',
                      style:TextStyle(
                        fontSize: textSize*1.1,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                ),
                TextButton(
                    onPressed:(){

                    },
                    child:Text('Reels',
                      style:TextStyle(
                        fontSize: textSize*1.1,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                ),
                TextButton(
                    onPressed:(){

                    },
                    child:Text('Following',
                      style:TextStyle(
                        fontSize: textSize*1.1,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                ),
              ],
            ),
                ],
              ),
            ),
            const Divider(
              height:2 ,
            ),
            ListView.builder(
              itemCount: object.names.length-6,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:(context,i){
                return  Padding(
                  padding:  EdgeInsets.only(
                    top: i==0?0:6,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: object.appbarcolor,
                        ),
                        child:
                        Column(
                          children: [
                            Container(
                              height: 130,
                              color: object.appbarcolor,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 5,),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context)=>UserProfile(name: object.names[6+i],imageUrl:object.profilepic[6+i],)
                                              ));
                                        },
                                        child: ClipOval(
                                          child: Image.network('${object.profilepic[i+6]}',
                                            height:45,
                                            width: 45,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Column( crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context)=>UserProfile(name: object.names[6+i],imageUrl:object.profilepic[6+i],)
                                                  ));
                                            },
                                            child: Text(object.names[6+i],
                                              style:const TextStyle(
                                                fontSize: 18,
                                                //fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text('${(i+1)*2}h',style:  TextStyle(
                                                fontSize: textSize,
                                              ),),
                                              const Text('.'),
                                             const Icon(Icons.public,
                                                size: 15,),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      IconButton(
                                        onPressed:(){

                                        },
                                        icon: Icon(
                                          Icons.more_horiz,
                                          size: iconSize,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed:(){

                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          size:iconSize,
                                        ),
                                      ),

                                    ],
                                  ),
                                  Container(
                                    width: size.width*0.95,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                      child: Text(object.caption[6+i],
                                        style: TextStyle(
                                          fontSize: textSize*1.01,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>PhotoViewer1(name: object.names[i+6],imageURL:object.videopic[i]),
                                    ));
                              },
                              child: Container(
                                height: 280,
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children:[
                                    Image.network(
                                    object.videopic[i],
                                    height:280,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                    Center(
                                      child: Icon(Icons.play_circle_outline_sharp,
                                      color: object.appbarcolor,
                                        size: 60,
                                      ),
                                    )
                                ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:43 ,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 35,
                                      child: Stack(
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: Colors.blue,
                                            child: Icon(Icons.thumb_up,
                                              color: Colors.white,
                                              size: 13,
                                            ),
                                          ),
                                          Positioned(
                                            right:0,
                                            top:0,
                                            child: CircleAvatar(
                                                radius: 10,
                                                backgroundColor: Colors.red,
                                                child: Icon(Icons.favorite,
                                                  color: Colors.white,
                                                  size: 13,)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text('${(i+4)*3}K',
                                    style: TextStyle(
                                      fontSize: textSize,
                                    ),),
                                    const Expanded(child: SizedBox()),
                                    Text('${(i+3)*2}K comments',style: TextStyle(
                                      fontSize: textSize,
                                    ),),
                                    const Expanded(child: SizedBox()),
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 2,),
                                        Text('.',style: TextStyle(
                                          fontSize: 18,
                                        ),),
                                        Expanded(child: SizedBox())
                                      ],
                                    ),
                                    Text('${(i+3)*23} shares',style: TextStyle(
                                      fontSize: textSize,
                                    ),),
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 2,),
                                        Text('.',style: TextStyle(
                                          fontSize: 18,
                                        ),),
                                        Expanded(child: SizedBox())
                                      ],
                                    ),const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(height: 2,),
                                        Text('.',style: TextStyle(
                                          fontSize: 18,
                                        ),),
                                        Expanded(child: SizedBox())
                                      ],
                                    ),
                                    Text('${(i+4)*20}K views ',style: TextStyle(
                                      fontSize: textSize,
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                           const  Divider(
                              height: 1,
                            ),
                            Container(
                              height: 46,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                   TextButton(
                                      onPressed:(){
                                        setState(() {
                                          isLiked[i]==true?isLiked[i]=false:isLiked[i]=true;

                                        });
                                      },
                                      child:Row(
                                        children: [
                                          Icon(
                                            isLiked[i]?Icons.thumb_up:
                                            Icons.thumb_up_outlined,
                                            size: iconSize,
                                            color: isLiked[i]?object.iconcolor:Colors.black,
                                          ),
                                          Text('Likes',
                                            style: TextStyle(
                                              fontSize: textSize,
                                              color: isLiked[i]?object.iconcolor:Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Expanded(child: SizedBox()),
                                    TextButton(
                                        onPressed: (){
                                          setState(() {
                                            showModalBottomSheet(
                                                context: context,
                                                useSafeArea: true,
                                                isScrollControlled: true,
                                                builder:(context){
                                                  return const CommentSection();
                                                }
                                            );
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                                Icons.mode_comment_outlined,
                                              size: iconSize,
                                                color: Colors.black
                                            ),
                                            Text('Comment',
                                              style: TextStyle(
                                                fontSize: textSize,
                                                  color: Colors.black
                                              ),),
                                          ],
                                        )
                                    ),
                                    const Expanded(child: SizedBox()),
                                    TextButton(
                                        onPressed: (){},
                                        child: Row(
                                          children: [
                                            Icon(
                                                Icons.star_border_outlined,
                                              size: iconSize,
                                                color: Colors.black
                                              ),
                                            Text('Give',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textSize,
                                              ),),
                                          ],
                                        ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    TextButton(
                                        onPressed: ()async{
                                        final response = await http.get(Uri.parse(object.profilepic[i+6]));
                                        final  bytes = response.bodyBytes;
                                        final temp=await getTemporaryDirectory();
                                        final path='${temp.path}/image.jpg';
                                        File(path).writeAsBytesSync(bytes);
                                        await Share.shareFiles([path],  text: 'this photo is coming from facebook clone!');
                                        },
                                      child:  Row(
                                          children: [
                                            Icon(
                                              Icons.share_rounded,
                                                size: iconSize,
                                                color: Colors.black
                                            ),
                                            Text('Share',
                                              style: TextStyle(
                                                fontSize: textSize,
                                                color: Colors.black
                                              ),),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
