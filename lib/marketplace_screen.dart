import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/photoviewer_screen.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({super.key});

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  var object= Constants();
  @override
  Widget build(BuildContext context) {
    double textSize=MediaQuery.of(context).size.width*0.031;
    var mediaHeight=MediaQuery.of(context).size.height;
    var mediaWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: 
          [
            Container(
              height: 90,
              color: object.appbarcolor,
              child: Padding(
                padding: const EdgeInsets.only( top: 6.0,left: 8,right: 8),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text('Marketplace',
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

                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){},
                          child: Container(
                            height:35,
                            width: mediaWidth*0.475,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color:Colors.black12,
                            ),
                            child: Row( mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               const Icon(CupertinoIcons.square_pencil_fill,
                                size: 20,
                                ),
                                const SizedBox(width: 4,),
                                Text('Sell',
                                  style: object.textstyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:(){},
                          child: Container(
                            height:35,
                            width: mediaWidth*0.475,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color:Colors.black12,
                            ),
                            child: Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.list_bullet,
                                  size: 20,
                                ),
                                const SizedBox(width: 4,),
                                Text('Categories',
                                  style: object.textstyle,
                                ),
                              ],
                            ),
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Container(
              color: object.appbarcolor,
              child:
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 8,),
                      Text('Today\'s picks',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize:textSize*1.1,
                       ),
                      ),
                      const Expanded(child: SizedBox()),
                      Icon(Icons.location_on,
                       size: 15,
                      color: object.iconcolor,
                      ),
                      const SizedBox(width: 4,),
                      Text('Jodhpur',
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: textSize*1.1,
                          color: object.iconcolor,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        children: [
                          Center(
                            child: Text('.',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                                color: object.iconcolor,
                              ),
                            ),
                          ),
                          const  SizedBox(height: 10,),
                        ],
                      ),
                      const SizedBox(width: 3,),
                      Text('10 km',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: textSize*1.1,
                          color: object.iconcolor,
                        ),
                      ),
                      const SizedBox(width: 8,),
                    ],
                  ),
              GridView.builder(
                   shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: object.productDetail.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>PhotoViewer1(name: object.productDetail[index],imageURL:object.product[index]),
                                ));
                          },
                          child: Container(
                            height:mediaHeight*0.19,
                            width: mediaWidth*0.9,
                            child: Image.network(object.product[index],
                             fit:BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(object.productDetail[index],
                          softWrap: false,
                          style: TextStyle(
                            overflow:TextOverflow.ellipsis,
                            color:Colors.black,
                            fontSize: textSize,
                          ),
                        ),
                      ],
                    );
                  }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
