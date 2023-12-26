import 'package:flutter/material.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/individual_profile.dart';

class FriendRequestScreen extends StatefulWidget {
  const FriendRequestScreen({super.key});

  @override
  State<FriendRequestScreen> createState() => _FriendRequestScreenState();
}

class _FriendRequestScreenState extends State<FriendRequestScreen> {
  var object= Constants();
  late List requestSenders;
  late List senderPhoto;

  @override
  void initState() {
    super.initState();
    assign();

  }
  assign(){
    senderPhoto=object.senderpic;
    requestSenders=object.sendername;
  }

  @override
  Widget build(BuildContext context) {
    double textSize=MediaQuery.of(context).size.width*0.04;
    var mediaWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.black12 ,
        body: SingleChildScrollView(
          child: Column(
          children: [
             Container(
               color: object.appbarcolor,
               child: Padding(
                 padding:  EdgeInsets.all(8),
                 child: Column(
                   children: [
                     const Row(
                       children: [
                         Text('Friends',
                           style: TextStyle(
                             fontSize: 25,
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                           ),),
                         Expanded(child: SizedBox()),
                         CircleAvatar(
                           backgroundColor: Colors.black26,
                           radius: 16,
                           child: Icon(Icons.search,
                             color: Colors.black,
                             size: 25,
                           ),
                         ),
                       ],
                     ),
                     const SizedBox(height: 8,),
                     Row(
                       children: [
                         GestureDetector(
                           onTap:(){},
                           child: Container(
                             height:35,
                             width: 130,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color:Colors.black12,
                             ),
                             child: Center(child: Text('Suggestions',
                             style: TextStyle(
                               fontSize: textSize,
                             ),
                             ),
                             ),
                           ),
                         ),
                        const SizedBox(width: 5,),
                         GestureDetector(
                           onTap:(){},
                           child: Container(
                             height:35,
                             width: 130,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30),
                               color:Colors.black12,
                             ),
                             child: Center(child: Text('Your Friends',
                               style: TextStyle(
                                 fontSize: textSize,
                               ),
                             ),
                             ),
                           ),
                         ),

                       ],
                     )
                   ],
                 )
               ),
             ),
            const SizedBox(height: 1,),
            // Friend Request
            Container(
              color: object.appbarcolor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                child: Column(
                  children: [
                  Row(
                      children: [
                         Text('Friend requests',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: textSize,
                          ),
                        ),
                       const SizedBox(width: 4,),
                        Text(object.sendername.length.toString(),
                          style:  TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: textSize,
                            color: Colors.red,
                          ),
                        ),
                       const Expanded(child: SizedBox()),
                        Text('See all',
                          style: TextStyle(
                            fontSize: textSize,
                            color: object.iconcolor,
                          ),
                        ),
                      ],
                    ), 
                  const SizedBox(height: 5,),  
                  ListView.builder(
                    itemCount: requestSenders.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0,top: 8,),
                        child: SizedBox(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>UserProfile(name: requestSenders[index],imageUrl:senderPhoto[index],)
                                      ));
                                },
                                child: ClipOval(
                                  child: Image.network(senderPhoto[index],
                                    fit: BoxFit.cover,
                                    width: mediaWidth*0.16,
                                    height:  mediaWidth*0.16,
                                  ),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:mediaWidth*0.75,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context)=>UserProfile(name: object.sendername[index],imageUrl:senderPhoto[index],)
                                                ));
                                          },
                                          child: Text(requestSenders[index],
                                          style: TextStyle(
                                            fontSize: textSize,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100,
                                          ),
                                          ),
                                        ),
                                        Text('${index+1}y',
                                          style:TextStyle(
                                            color: Colors.black45,
                                            fontSize: textSize,
                                          ),),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Image.network(object.profilepic[index+1],
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 5,),
                                      Text('${(index+1)*3}Mutual Friends',
                                        style: TextStyle(
                                          fontSize: textSize*0.8,
                                        ),)
                                    ],
                                  ),
                                 const  SizedBox(height: 3,),
                                  Container(
                                    width:mediaWidth*0.76,
                                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color:  object.iconcolor,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child:
                                            Center(
                                              child:
                                              TextButton(
                                                onPressed: (){
                                                  setState(() {
                                                    var snackBar= SnackBar(
                                                      backgroundColor: object.iconcolor,
                                                      content: Center(
                                                          child://${requestSenders[index]
                                                          Text('Now you become friends with ${requestSenders[index]}',
                                                          style: const TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w500
                                                          ),)),
                                                      duration:const Duration(milliseconds:1000 ),

                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                    requestSenders.removeAt(index);
                                                    senderPhoto.removeAt(index);
                                                  });
                                                },
                                              child: Text('Confirm',
                                                  style: TextStyle(
                                                    fontSize: textSize,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            ),
                                          ),
                                        ),
                                       const SizedBox(width: 10,),
                                        Expanded(
                                          child: Container(

                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                    color:  Colors.black12,
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Center(
                                                    child:
                                                    TextButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          var snackBar= SnackBar(
                                                            backgroundColor: object.iconcolor,
                                                            content: Center(
                                                                child:Text('You deleted request of ${requestSenders[index]}',
                                                                  style: const TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w500
                                                                  ),)),
                                                            duration:const Duration(milliseconds:1000 ),

                                                          );
                                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                          requestSenders.removeAt(index);
                                                          senderPhoto.removeAt(index);
                                                        });
                                                      },
                                                      child:Text('Delete',
                                                      style: TextStyle(
                                                        fontSize: textSize,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w500,
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ],
                ),
              ),
            )
          ],
         ),
        ),
    );
  }
}
