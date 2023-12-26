import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/comment_section.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/individual_profile.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled/photoviewer_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var object= Constants();
  bool isComment=false;
  List<bool> isLiked=[false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    double textSize=MediaQuery.of(context).size.width*0.031;
    Size size = MediaQuery.of(context).size;
    double iconSize=MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      backgroundColor:Colors.grey,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
        ),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //After App Bar
            Container( color: object.appbarcolor,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:12),
                child:
                Row(
                  children: [
                    GestureDetector(
                            onTap: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>UserProfile(name: object.names[0],imageUrl:object.profilepic[0])
                            ));
                          },
                      child: ClipOval(
                        child: Image.network(object.profilepic[0],
                          width: 45,
                          height: 45,
                          fit:BoxFit.cover,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      height: 49,
                      width: MediaQuery.of(context).size.width*0.7,
                      child: TextFormField(
                        decoration:  InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(
                            width:1,
                            )
                          ),
                          hintText: '     Write something here...',
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: textSize*1.2,
                          ),

                        ),
                      ),
                    ),
                   const Expanded(child: SizedBox()),
                    const Icon(Icons.photo_library_outlined,size: 25,
                        color: Colors.green,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6,),
            // For Story
            Container(
              height: MediaQuery.of(context).size.height*0.26,
              color: object.appbarcolor,
              child:
                  ListView.builder(
                      itemCount: object.names.length,
                      scrollDirection: Axis.horizontal,
                      //shrinkWrap: true,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(top:8.0,left: 7,bottom: 8),
                          child:  Container(
                               width: 120,
                               height:MediaQuery.of(context).size.height*0.26-16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(object.profilepic[index],),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children:[
                                 Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                        index==0?const Text(''):Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(100),
                                              border: Border.all(
                                                color:const Color.fromRGBO(50, 50, 255,0.7),
                                                width: 3,
                                              )
                                            ),
                                            child: ClipOval(
                                              child: Image.network(object.profilepic[index],
                                                height: 35,
                                                width: 35,
                                              ),
                                            ),
                                          ),
                                        ),
                                     const Expanded(child: SizedBox()),
                                     index==0?
                                     Row(

                                       children: [
                                         const Expanded(child: SizedBox()),
                                         Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width:3,
                                                color: Colors.white,
                                              ),
                                              borderRadius: BorderRadius.circular(100)
                                            ),
                                           child: CircleAvatar(
                                             radius: 13,
                                               backgroundColor: object.iconcolor,
                                               child: const Icon(Icons.add,size: 22,color: Colors.white,)
                                           ),
                                         ),
                                         const  Expanded(child: SizedBox()),
                                       ],
                                     )
                                        : const Text(''),
                                        Text(index==0?'     Create story':'    ' +object.names[index],
                                          textAlign: TextAlign.center,
                                          style:TextStyle(
                                            color: Colors.white,
                                            fontSize: textSize,
                                            fontWeight: FontWeight.w500,
                                          ) ,
                                        ),
                                      ],
                                 )
                                ],
                              ),
                          ),
                        );
                      }
                  ),
            ),
            // FOR POST
            ListView.builder(
              itemCount: object.names.length-6,
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder:(context,i){
                return  Padding(
                  padding: const  EdgeInsets.only(
                    top: 6,
                  ),
                  child: Container(
                    height: size.height*0.5,
                     decoration: BoxDecoration(
                      color: object.appbarcolor,
                    ),
                    child:
                    Column(
                      children: [
                        Container(
                          height:size.height*0.109,
                          color: object.appbarcolor,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 5,),
                                  GestureDetector(
                                  onTap: (){
                                        Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>UserProfile(name: object.names[i],imageUrl:object.profilepic[i]),
                                      ));
                                  },
                                    child: ClipOval(
                                      child: Image.network(object.profilepic[i],
                                        height:40,
                                        width: 40,
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
                                              MaterialPageRoute(builder: (context)=>UserProfile(name: object.names[i],imageUrl:object.profilepic[i]),
                                              ));
                                              },
                                        child: Text(object.names[i],
                                          style:const TextStyle(
                                            fontSize: 18,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text('${(i+1)*2}h',style: TextStyle(
                                            fontSize:textSize,
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
                                      size:iconSize,
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
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(object.caption[i],
                                    style: TextStyle(
                                      fontSize:textSize*1.01,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: size.height*0.289,
                          width: MediaQuery.of(context).size.width,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>PhotoViewer1(name: object.names[i],imageURL:object.profilepic[i]),
                                  ));
                            },
                            child: Image.network(object.profilepic[i],
                              height: 280,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height:size.height*0.043 ,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child:
                            Row(
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
                                Text('${object.names[1]} and ${(i+4)*3}K others',
                                style: TextStyle(
                                  fontSize: textSize,
                                ),),
                               const Expanded(child: SizedBox()),
                                Text('${(i+3)*2}K comments',
                                  style: TextStyle(
                                    fontSize: textSize,
                                  )),
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
                                Text('${(i+3)*23} shares',
                                  style:  TextStyle(
                                      fontSize: textSize,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Container(
                          height:size.height*0.046,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
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
                                          size:iconSize,
                                          color: isLiked[i]?object.iconcolor:Colors.black,
                                        ),
                                      const SizedBox(width: 5,),
                                      Text('Likes',
                                        style: TextStyle(
                                          color: isLiked[i]?object.iconcolor:Colors.black,
                                          fontSize: textSize,
                                        ),),

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
                                      size:iconSize,
                                      color: Colors.black,
                                    ),
                                    Text('Comment',
                                        style: TextStyle(
                                          fontSize: textSize,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                              const  Expanded(child: SizedBox()),
                                IconButton(
                                    onPressed: (){},
                                    icon: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white54,
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.black,
                                         )
                                       ),
                                      child: Icon(
                                        Icons.call_rounded,
                                        size: iconSize,
                                        color:const Color.fromRGBO(0,0,0,0.9),
                                      ),
                                    )
                                ),
                                Text('Send',
                                  style: TextStyle(
                                    fontSize: textSize,
                                  ),),
                               const Expanded(child: SizedBox()),
                                TextButton(
                                    onPressed: ()async{
                                        final response = await http.get(Uri.parse(object.profilepic[i]));
                                          final  bytes = response.bodyBytes;
                                          final temp=await getTemporaryDirectory();
                                          final path='${temp.path}/image.jpg';
                                          File(path).writeAsBytesSync(bytes);
                                          await Share.shareFiles([path],  text: 'this photo is coming from facebook clone!');

                                          },

                                    child:Row(
                                      children: [
                                      Icon(
                                        Icons.share_rounded,
                                        size:iconSize,
                                        color: Colors.black,
                                     ),
                                      const SizedBox(width: 5,),
                                      Text('Share',
                                        style:TextStyle(
                                          fontSize: textSize,
                                          color: Colors.black,
                                      ),
                                      ),
                                     ],
                                    ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
