import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/photoviewer_screen.dart';

class UserProfile extends StatefulWidget {
  late  var name;
  late  var imageUrl;
  UserProfile({super.key,required this.name,required this.imageUrl});
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var object= Constants();
  File? _image;
  var savedImage;
  bool selectPhoto=false;
  SharedPreferences? preferences;

  @override
  void initState() {
    super.initState();
    getSavedImage();
    }

  getSavedImage()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      savedImage = preferences.getString("imagePath");
      print("savedImage -->"+savedImage.toString());
    });
  }

  Future<void> pickImage() async {

    final ImagePicker picker = ImagePicker();
    preferences = await SharedPreferences.getInstance();

    if(selectPhoto==true){
      selectPhoto=false;

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {

        setState(() {
          _image = File(image.path);
          print("imageG gallery --> "+_image.toString());
          preferences!.setString("imagePath", _image!.path.toString());
        });
      }
    }else{
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {

        setState(() {
          _image = File(image.path);
          print("imageG camera --> "+_image.toString());
          preferences!.setString("imagePath", _image!.path.toString());
        });
    }
   }
  }

  @override
  Widget build(BuildContext context) {
    double textSize=MediaQuery.of(context).size.width*0.035;
    var mediaHeight=MediaQuery.of(context).size.height;
    var mediaWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: object.appbarcolor,
      appBar: AppBar(
        backgroundColor: object.appbarcolor,
       title: Row(
          children: [
           const Expanded(child: SizedBox()),
            Text(widget.name,
              style: TextStyle(
                fontSize: textSize*1.2,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Expanded(child: SizedBox()),
            IconButton(
                onPressed:(){

                },
                icon:const Icon(Icons.search,
                size: 30,
                color: Colors.black,
                )
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mediaHeight*0.47,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mediaHeight*0.32,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>PhotoViewer1(name:widget.name,imageURL:widget.imageUrl),
                                ));
                          },
                          child: Container(
                            height: mediaHeight*0.25,
                            width: double.infinity,
                            child: Image.network(widget.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          bottom:25,
                          child: Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                color: object.appbarcolor,
                                //shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  width: 3,
                                  color: object.appbarcolor,
                                )
                            ),
                            child:widget.name=='Dipak Bogati'?
                            Stack(
                              children:[
                                GestureDetector(
                                  onTap:(){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>PhotoViewer1(name:widget.name,imageURL:_image!=null?_image:widget.imageUrl),
                                        ));
                                  },
                                  child: ClipOval(
                                    child:_image!=null?
                                    Image.file(File(_image!.path),
                                      height: 85,
                                      width: 85,
                                      fit: BoxFit.cover,
                                    ):
                                    savedImage!=null?
                                    Image.file(File(savedImage),
                                      height: 85,
                                      width: 85,
                                      fit: BoxFit.cover,
                                    ):
                                    Image.network(widget.imageUrl,
                                      height: 85,
                                      width: 85,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right:0,
                                  bottom: 2,
                                  child: GestureDetector(
                                    onTap: (){
                                      showDialog(context: context,
                                      builder:(BuildContext context)
                                      {
                                        return AlertDialog(
                                          actions: [
                                            Row(
                                              children: [
                                                const Expanded(child: SizedBox()),
                                                Column(
                                                  children: [
                                                    const SizedBox(height: 20,),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(context,
                                                                    MaterialPageRoute(builder: (context)=>PhotoViewer1(name:widget.name,imageURL:_image!=null?_image.toString():widget.imageUrl),
                                                                    ));
                                                      },
                                                      child: Text('View profile picture',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        selectPhoto=true;
                                                        pickImage();
                                                        Navigator.of(context).pop();
                                                      },
                                                      child:const Text(
                                                        'take photo from gallery',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                        ),),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        pickImage();
                                                        Navigator.of(context).pop();
                                                      },
                                                      child:const Text(
                                                        'take photo from camera',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                                const Expanded(child: SizedBox())
                                              ],
                                            ),
                                          ],
                                        );
                                      },);
                                    },
                                    child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                            width: 1,
                                          )
                                        ),
                                        child: const Icon(Icons.camera_alt,size:20,color: Colors.black,)),
                                  ),
                                )
                              ]
                            ):
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>PhotoViewer1(name:widget.name,imageURL:widget.imageUrl),
                                    ));
                              },
                              child: ClipOval(
                                child: Image.network(widget.imageUrl,
                                  height: 85,
                                  width: 85,
                                   fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(widget.name,
                      style: TextStyle(
                        fontSize: textSize*1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child:Text('( Application Designer & Developer)',
                     style: TextStyle(
                       fontSize: textSize,
                     )),
                  ),
                 const Expanded(child: SizedBox(),),
                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       margin: const EdgeInsets.symmetric(horizontal: 10),
                       width:mediaWidth*0.35,
                       height: 40,
                       decoration: BoxDecoration(
                         color: Colors.black12,
                         borderRadius: BorderRadius.circular(5),
                       ),
                       child:  Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                            Icon(Icons.person,
                           size: textSize*1.3,
                           color: Colors.black,
                           ),

                            Text('Friends',
                           style: TextStyle(
                             fontWeight: FontWeight.w600,
                             fontSize: textSize,
                           ),)
                         ],
                       ),
                     ),
                     Container(
                       margin: const EdgeInsets.only(right: 8),
                       width:mediaWidth*0.45,
                       height: 40,
                       decoration: BoxDecoration(
                         color: object.iconcolor,
                         borderRadius: BorderRadius.circular(5),
                       ),
                       child:  Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                            Icon(Icons.message,
                             size: textSize*1.2,
                             color: Colors.white,
                           ),
                           const SizedBox(width: 5,),
                           Text('Message',
                             style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontSize: textSize,
                               color: Colors.white,
                             ),)
                         ],
                       ),
                     ),
                     Container(
                       margin: const EdgeInsets.only(right: 8),
                       width:mediaWidth*0.08,
                       height: 40,
                       decoration: BoxDecoration(
                         color: Colors.black12,
                         borderRadius: BorderRadius.circular(5),
                       ),
                       child: const Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.more_horiz,
                             size: 16,
                             color: Colors.black,
                           ),

                         ],
                       ),
                     ),
                   ],
                 )
                ],
              ),
            ),
            const Divider(thickness: 8,),
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text('Posts',
                        style: TextStyle(
                          color: object.iconcolor,
                          fontSize: textSize,
                        ),),
                      ),
                    ),
                    const SizedBox(width: 15,),
                  Text('Reels',
                      style: TextStyle(
                        fontSize: textSize,
                      ),),
                  ],
                ),
               const Divider(thickness: 1,),
                Text('Details',
                style: TextStyle(
                  fontSize: textSize*1.3,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                Row(
                  children: [
                    Icon(Icons.shopping_bag,
                    size: textSize*1.3,),
                    const SizedBox(width: 8,),
                    Text('Studied at Kailaki Model Higher Secondary School',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                    fontSize: textSize,
                      fontWeight: FontWeight.w300,
                    ),),
                  ],
                ),
               const SizedBox(height: 10,),
                  Row(
                  children: [
                     Icon(Icons.house_sharp,
                     size: textSize*1.3,),
                     const SizedBox(width: 8,),
                     Text('Lives in '  , style: TextStyle(
                       fontSize: textSize,
                       fontWeight: FontWeight.w300,
                     ),),
                     Text('Jodhpur',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: textSize,
                    ),),
                  ],
                ),
              const  SizedBox(height: 10,),
             Row(
                  children: [
                    Icon(Icons.location_on,
                    size: textSize*1.3,
                    ),
                    const  SizedBox(width: 8,),
                    Text('From ',   style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.w300,
                    ),),
                    Text('Doti,Nepal',
                      style: TextStyle(
                        color: Colors.black,
                          fontWeight: FontWeight.bold,
                        fontSize: textSize,
                      ),),
                  ],
                ),
               const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.more_horiz,
                    size: textSize*1.3,
                    ),
                    const SizedBox(width: 8,),
                    Text('See more About Info ',   style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.w300,
                    ),),
                  ],
                ),
               const SizedBox(height: 30,),
                 Text('Friends',
                  style: TextStyle(
                    fontSize: textSize*1.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
               const  SizedBox(height: 5,),
               Text('2 mutual friends',   style: TextStyle(
                 fontSize: textSize,
                  fontWeight: FontWeight.w300,
                ),),
               const SizedBox(height: 10,),
                Row(children: [
                 Column(
                   children: [
                     ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.network(object.profilepic[0],
                       fit:BoxFit.cover,
                       height: mediaWidth*0.3,
                       width:mediaWidth*0.3,
                       ),
                     ),
                     Text('Lionel Messi',style: object.textstyle,),
                   ],
                 ),
                 const SizedBox(width: 5,),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(object.profilepic[3],
                          fit:BoxFit.cover,
                          height: mediaWidth*0.3,
                          width:mediaWidth*0.3,
                        ),
                      ),
                      Text('Dhirendra Bogati',style: object.textstyle,),
                    ],
                  ),
                ],
                ),
               const SizedBox(height: 10,),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text('See all friends',
                    style: object.textstyle,),
                  ),
                )
              ],
            ),
          ),
            const Divider(thickness: 6,),
            Container(
              margin:const  EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                    Text(widget.name,
                        style:   TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          fontSize: textSize*1.1,
                        ),
                      ),
                         Text('\'s posts',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          fontSize: textSize*1.1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(thickness: 6,),
          ],

        ),
      ),
    );
  }
}
