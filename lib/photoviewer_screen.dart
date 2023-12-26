import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:untitled/comment_section.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:untitled/constant_values.dart';

class PhotoViewer1 extends StatefulWidget {
  var imageURL;
  var name;
   PhotoViewer1({super.key,required this.imageURL,required this.name});

  @override
  State<PhotoViewer1> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer1> {
  bool isLiked=false;
  var object=Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const  IconThemeData(size: 25,color: Colors.white),
        backgroundColor: Colors.black,
        title:Row(
          children: [
            const Spacer(),
            IconButton(
                onPressed: (){
                  setState(() {
                    showModalBottomSheet(
                        context: context,
                        useSafeArea: true,
                        isScrollControlled: true,
                        builder:(context){
                          return  Container(
                            height: 240,
                            child: Column(
                              children: [
                               InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    height: 60,
                                    child:const Padding(
                                      padding:  EdgeInsets.only(left: 20.0),
                                      child:   Row(
                                        children: [
                                          Icon(Icons.download_outlined,
                                            size: 25,
                                          ),
                                          SizedBox(width: 10,),
                                          Text('Save to phone',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: ()async{
                                    final response = await http.get(Uri.parse(widget.imageURL));
                                    final  bytes = response.bodyBytes;
                                    final temp=await getTemporaryDirectory();
                                    final path='${temp.path}/image.jpg';
                                    File(path).writeAsBytesSync(bytes);
                                    await Share.shareFiles([path],  text: 'this photo is coming from facebook clone!');

                                  },
                                  child: Container(
                                    height: 60,
                                    child:const Padding(
                                      padding:  EdgeInsets.only(left: 20.0),
                                      child:   Row(
                                        children: [
                                          Icon(Icons.share_rounded,
                                            size: 25,
                                          ),
                                          SizedBox(width: 10,),
                                          Text('Share external',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    height: 60,
                                    child:const Padding(
                                      padding:  EdgeInsets.only(left: 20.0,),
                                      child:   Row(
                                        children: [
                                          Icon(Icons.messenger_outline,
                                            size: 25,
                                          ),
                                          SizedBox(width: 10,),
                                          Text('Send in Messenger',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    height: 60,
                                    child:const Padding(
                                      padding:  EdgeInsets.only(left: 20.0,),
                                      child:   Row(
                                        children: [
                                          Icon(Icons.report_problem_outlined,
                                            size: 25,
                                          ),
                                          SizedBox(width: 10,),
                                          Text('Report photo',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  });
                },
                icon:const Icon(Icons.more_vert)
            )
          ],
        )
      ),
      body:Stack(
        children:[
          PhotoView(
            minScale: 0.3,
            maxScale: 4.0,
            imageProvider: NetworkImage(widget.imageURL,),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(widget.name,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      overflow:TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500
                  ),),
                const Text('JUL 14 AT 03:20',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),),
                const Row(
                  children: [
                    SizedBox(
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
                    Text(' 86',
                        style: TextStyle(
                          fontSize:16,
                          color: Colors.white,
                        )),
                     Expanded(child: SizedBox()),
                    Text('26 comments',
                        style: TextStyle(
                          fontSize:16,
                          color: Colors.white,
                        )),
                  ],
                ),
                const Divider(height: 1,),
                Row(
                  children: [
                    TextButton(
                      onPressed:(){
                        setState(() {
                          isLiked==true?isLiked=false:isLiked=true;

                        });
                      },
                      child:Row(
                        children: [
                          Icon(
                            isLiked?Icons.thumb_up:
                            Icons.thumb_up_outlined,
                            size:18,
                            color: isLiked?object.iconcolor:Colors.white,
                          ),
                          const SizedBox(width: 5,),
                          Text('Likes',
                            style: TextStyle(
                              color: isLiked?object.iconcolor:Colors.white,
                              fontSize:18,
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
                      child:const  Row(
                        children: [
                          Icon(
                            Icons.mode_comment_outlined,
                            size:18,
                            color: Colors.white,
                          ),
                          Text('Comment',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                    const  Expanded(child: SizedBox()),
                    TextButton(
                      onPressed: ()async{
                        final response = await http.get(Uri.parse(widget.imageURL));
                        final  bytes = response.bodyBytes;
                        final temp=await getTemporaryDirectory();
                        final path='${temp.path}/image.jpg';
                        File(path).writeAsBytesSync(bytes);
                        await Share.shareFiles([path],  text: 'this photo is coming from facebook clone!');

                      },

                      child:const Row(
                        children: [
                          Icon(
                            Icons.share_rounded,
                            size:18,
                            color: Colors.white,
                          ),
                           SizedBox(width: 5,),
                          Text('Share',
                            style:TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
       ]
      )
    );
  }
}
