import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constant_values.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  var object= Constants();
  var editText='';
  List names=[];
  List comments=[];
  List pictures=[];
  var isLiked=[];
  TextEditingController textController=TextEditingController();
  initLists(){
    names=object.names;
    comments=object.caption;
    pictures=object.profilepic;
    isLiked=List.generate(names.length, (index) => false);

  }
  @override
  void initState() {
    super.initState();
    initLists();
  }
  @override
  Widget build(BuildContext context) {
    double textSize=MediaQuery.of(context).size.width*0.031;
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        color: object.appbarcolor,
        child:Column(
          children: [
            SizedBox(height: 30,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child:
                    Row(
                      children: [
                        Icon(Icons.emoji_emotions,
                          color: Colors.amber[200],
                          size: 20,
                        ),
                        Icon(Icons.thumb_up,
                          color: object.iconcolor,
                          size: 20,
                        ),
                        const Icon(Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        ),
                        const Text('513'),
                        const Icon(Icons.arrow_forward_ios,
                          size: 20,
                        ),
                        const Expanded(child: SizedBox()),
                        const Icon(Icons.thumb_up_alt_outlined,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
            ),
                  const SizedBox(height: 18,),
                 Expanded(
                   child: SizedBox(
                     child: SingleChildScrollView(
                       child: Column(
                         children: [
                           Row(
                             children: [
                               const SizedBox(width: 8,),
                               Text('Most relevant',
                                 style:TextStyle(
                                   fontSize: textSize*1.2,
                                   fontWeight: FontWeight.w600,
                                 ),
                               ),
                               const Icon(Icons.expand_more_outlined,
                                 size: 30,
                               ),
                             ],
                           ),
                           ListView.builder(
                             itemCount: names.length,
                               physics:const NeverScrollableScrollPhysics(),
                               shrinkWrap: true,
                               itemBuilder:(context,index){
                                 return Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           ClipOval(
                                             child: Image.network(pictures[index],
                                               height: size.width*0.12,
                                               width: size.width*0.12,
                                             fit: BoxFit.cover,
                                             ),
                                           ),
                                           InkWell(
                                             onLongPress: (){
                                               setState(() {
                                                 showDialog(context: context,
                                                     builder:(BuildContext context){
                                                       return  AlertDialog(
                                                         //title: Text('Log out of your account?'),
                                                         actions:[
                                                           Center(
                                                             child: Row(
                                                               children: [
                                                                 const Expanded(child: SizedBox()),

                                                                 TextButton(
                                                                     onPressed: (){
                                                                       Navigator.of(context).pop();
                                                                     },
                                                                     child:const Text('Cancel')),
                                                                 const SizedBox(width: 8,),
                                                                 TextButton(
                                                                     onPressed: (){
                                                                       //comments[index]=textController.text;
                                                                       setState(() {
                                                                         showModalBottomSheet(
                                                                             context: context,
                                                                             useSafeArea: true,
                                                                             builder:(context){
                                                                               return
                                                                                 Column(
                                                                                 children: [
                                                                                   const Spacer(),
                                                                                   const Divider(thickness: 1,),
                                                                                   Row(
                                                                                     children: [
                                                                                       const Expanded(child: SizedBox()),
                                                                                       Container(
                                                                                         height: 35,
                                                                                         width:size.width*0.85,
                                                                                         decoration: BoxDecoration(
                                                                                           color:  Colors.black12,
                                                                                           borderRadius: BorderRadius.circular(25),
                                                                                         ),
                                                                                         child:TextFormField(
                                                                                           controller: textController,
                                                                                           cursorWidth: 1,
                                                                                           decoration: const InputDecoration(
                                                                                               hintText: 'Comment as Dipendra Bogati',
                                                                                               contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                                                                               border:OutlineInputBorder(
                                                                                                 borderSide: BorderSide.none,
                                                                                               )
                                                                                           ),
                                                                                         ),
                                                                                       ),
                                                                                       const SizedBox(width: 8,),
                                                                                       GestureDetector(
                                                                                         onTap: (){
                                                                                           setState(() {
                                                                                             comments[index]=editText;
                                                                                             textController.clear();
                                                                                             Navigator.of(context).pop();                                                                                         });
                                                                                         },
                                                                                         child: Icon(Icons.send,
                                                                                           size: 30,
                                                                                           color: object.iconcolor,
                                                                                         ),
                                                                                       ),
                                                                                       const SizedBox(width: 8,),
                                                                                     ],
                                                                                   ),
                                                                                   const SizedBox(height: 8,)
                                                                                 ],
                                                                               );
                                                                             }
                                                                         );
                                                                       });
                                                                     },
                                                                     child: const Text('Edit')),
                                                                 const SizedBox(width: 8,),
                                                                 TextButton(
                                                                   onPressed: (){
                                                                     setState(() {
                                                                       comments.removeAt(index);
                                                                       names.removeAt(index);
                                                                       pictures.removeAt(index);
                                                                       isLiked.removeAt(index);
                                                                       Navigator.of(context).pop();
                                                                     });
                                                                   },
                                                                   child:const Text('Delete',
                                                                     style: TextStyle(
                                                                       color: Colors.red,
                                                                     ),),
                                                                 ),
                                                               ],
                                                             ),
                                                           ),
                                                         ],
                                                       );
                                                     });

                                               });
                                             },
                                             child: Container(
                                               margin:const EdgeInsets.only(left: 8),
                                               width: size.width*0.8,
                                               child: Container(
                                                decoration: BoxDecoration(
                                                  color:const Color.fromRGBO(152, 145, 145, 0.3),
                                                  borderRadius: BorderRadius.circular(15),
                                                ),

                                                 child: Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Column(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: [
                                                         Text(names[index],
                                                         style: const TextStyle(
                                                           fontWeight: FontWeight.w700,
                                                           fontSize: 16,
                                                         ),),
                                                       Text(comments[index],
                                                         style:const  TextStyle(
                                                           fontWeight: FontWeight.w500,
                                                           fontSize: 16,
                                                         ),),
                                                     ],
                                                   ),
                                                 ),

                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                       const SizedBox(height: 5,),
                                       Row(
                                         children: [
                                           SizedBox( width: size.width*0.15,),
                                           Text(names[index]=='Dipendra Bogati'?'0m':'${(index*2)+2}m',
                                           style: const TextStyle(
                                             color: Colors.black54,
                                             fontSize: 15,
                                           ),),
                                           const SizedBox( width: 10,),
                                           GestureDetector(
                                             onTap: (){
                                               setState(() {
                                                 isLiked[index]==true?isLiked[index]=false:isLiked[index]=true;
                                               });
                                               },
                                             child:  Text('Like',
                                               style: TextStyle(
                                                   fontSize: 15,
                                                 color:isLiked[index]==true?object.iconcolor: Colors.black54,
                                                 fontWeight: FontWeight.w700
                                               ),),
                                           ),
                                           const SizedBox( width: 10,),
                                           const Text('Reply',
                                             style: TextStyle(
                                                 fontSize: 15,
                                               color: Colors.black54,
                                                 fontWeight: FontWeight.w700
                                             ),),
                                           const SizedBox( width: 10,),
                                           if(isLiked[index]==true)
                                             const Text('1',
                                               style: TextStyle(
                                                   fontSize: 15,
                                                   color: Colors.black54,
                                                   fontWeight: FontWeight.w700
                                               ),),
                                           if(isLiked[index]==true)
                                              Icon(Icons.thumb_up,
                                              size: 18,
                                              color: object.iconcolor,
                                              )
                                         ],
                                       )
                                     ],
                                   ),
                                 );
                               }
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
            const Divider(thickness: 1,),
            Row(
              children: [
              const Expanded(child: SizedBox()),
                Container(
                  height: 35,
                  width:size.width*0.85,
                  decoration: BoxDecoration(
                    color:  Colors.black12,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child:TextFormField(
                    controller: textController,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                        hintText: 'Comment as Dipendra Bogati',
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border:OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )
                    ),
                  ),
                ),
                const SizedBox(width: 8,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      comments.add(textController.text);
                      names.add('Dipendra Bogati');
                      pictures.add(object.senderpic[2]);
                      isLiked.add(false);
                      textController.clear();
                    });
                  },
                  child: Icon(Icons.send,
                  size: 30,
                    color: object.iconcolor,
                  ),
                ),
                const SizedBox(width: 8,),
              ],
            ),
            const SizedBox(height: 8,)
          ],
        ),
    );
  }
}
