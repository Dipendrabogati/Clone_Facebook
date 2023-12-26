
import 'package:flutter/material.dart';
import 'package:untitled/constant_values.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var object= Constants();
  @override
  Widget build(BuildContext context) {
    double textSize=MediaQuery.of(context).size.width*0.036;
    var mediaWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: object.appbarcolor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor:object.appbarcolor ,
            title: Row(
              children: [
                Text('Notification',
                  style: TextStyle(
                    fontSize: textSize*1.42,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Expanded(child: SizedBox()),
                const CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 16,
                  child: Center(
                    child: Icon(Icons.search,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate:
              SliverChildBuilderDelegate((context,index){
                return Container(
                  color: object.appbarcolor,
                  child: index==0||index==6?
                  Row(
                    children: [
                      index==0?
                      Text('  Today',
                        style: TextStyle(
                          fontSize: textSize*1.1,
                          fontWeight: FontWeight.bold,
                        ),)
                          :
                      Text('  Yesterday',
                        style: TextStyle(
                          fontSize: textSize*1.1,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  )
                  :Container(
                    color:index%4==0?object.appbarcolor:const Color.fromRGBO(245,250,245,0.9),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       Stack(
                         children: [
                           ClipOval(
                                   child: Image.network(object.profilepic[index-1],
                                    fit: BoxFit.cover,
                                    width: mediaWidth*0.14,
                                     height:  mediaWidth*0.14,
                                ),
                           ),
                           Positioned(
                             right: 0,
                             bottom: 0,
                             child: Container(
                               height: 25,
                               width: 25,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(100),
                                 color:index==8?Colors.red: Colors.green
                               ),
                                 child:Center(
                                   child: Icon(index==8?Icons.movie
                                       :Icons.chat_bubble_outlined,
                                   size: 18,
                                   color: object.appbarcolor,),
                                 )
                             ),
                           ),
                        ],
                       ),
                        Container(
                         width: mediaWidth*0.78,
                          child:Column(
                            children: [
                              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: mediaWidth*0.7,
                                    child:
                                      RichText(
                                        text: TextSpan(
                                          text: object.names[index],
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: textSize,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:' '+object.notification[index],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: textSize,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ),
                                  Icon(Icons.more_horiz,),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('${index+2} hours ago')
                                ],
                              )
                            ],
                          ),
                        )
                        ],
                      ),
                    ) ,
                  ),
                );
              },
              childCount: object.names.length,
              ),
          ),
        ],
      ),
    );
  }
}
