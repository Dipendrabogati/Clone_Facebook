import 'package:flutter/material.dart';
import 'package:untitled/constant_values.dart';
import 'package:untitled/individual_profile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  var contain=[];

  bool isFound=false;
  String searchName='';
  var object= Constants();
  var reqIndexlist=[];
  final TextEditingController textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(

        automaticallyImplyLeading: false,
        backgroundColor: object.appbarcolor,
        leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon:const  Icon(Icons.arrow_back),
        ) ,
        title: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width:mediaWidth*0.8 ,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 250, 245, 0.9),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                controller: textController,
                onChanged: (value){
                  searchName =value;
                  if(searchName.isNotEmpty){
                    contain = object.names.where((element) => element.contains(searchName)).toList();
                    print("contain --> "+contain.toString());
                    reqIndexlist.clear();
                    for(int i=0;i<contain.length;i++){
                      for(int j=0;j<object.names.length;j++){
                        if(contain[i]==object.names[j]){
                          reqIndexlist.add(j);
                          print(j);
                        }
                      }
                    }
                  }else{
                    contain.clear();
                    //reqIndexlist.clear();
                    isFound = false;
                    print("contain --> "+contain.toString());
                  }


                  if (contain.isNotEmpty) {
                    isFound = true;
                    } else {
                      isFound = false;
                    }
                    setState(() {});
                  },
                cursorWidth: 1,
                decoration: const InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border:OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: object.appbarcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const Divider(height: 1,),
              const SizedBox(height: 10,),
               isFound==false
                    ?object.searchedName.isEmpty
                   ? const Text('No recent searches',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),)
                   : Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('recent searches',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
                      ListView.builder(
                          itemCount: object.searchedName.length,
                          shrinkWrap: true,
                          itemBuilder:(context,i){
                            return Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)=>UserProfile(name: object.searchedName[i],imageUrl:object.profilepic[reqIndexlist[i]]  ,)
                                          ));
                                    },
                                    child: ClipOval(
                                      child: Image.network(
                                        object.profilepic[reqIndexlist[i]],
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
                                          MaterialPageRoute(builder: (context)=>UserProfile(name: object.searchedName[i],imageUrl:object.profilepic[reqIndexlist[i]]  ,)
                                          ));
                                    },
                                    child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(object.searchedName[i],
                                         ),
                                        const Text('Friend')
                                      ],
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  IconButton(
                                      onPressed:(){
                                        object.searchedName.removeAt(i);
                                        setState(() {
                                        });
                                      },
                                      icon:Icon(Icons.clear,
                                      size: 15,)
                                  )
                                ],
                              );
                          }
                      ),
                    ],
                  )
                   :
               ListView.builder(
                 itemCount: contain.length,
                 shrinkWrap: true,
                 itemBuilder: (context,index){
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: GestureDetector(
                       onTap: (){
                         object.searchedName.add(contain[index]);
                           Navigator.push(context,
                               MaterialPageRoute(builder: (context)=>UserProfile(name: contain[index],imageUrl:object.profilepic[reqIndexlist[index]]  ,)
                               ));
                       },
                       child: Row(
                         children: [
                           ClipOval(
                             child: Image.network(
                               object.profilepic[reqIndexlist[index]],
                               height: 40,
                               width: 40,
                               fit: BoxFit.cover,
                             ),
                           ),
                           const SizedBox(width: 10,),
                           Column( crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(contain[index],
                                 style: const TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                 ),),
                               Text('Friend')
                             ],
                           ),
                           const Expanded(child: SizedBox()),
                           const Icon(Icons.arrow_forward_sharp)
                         ],
                       ),
                     ),
                   );
                 },
               )
             ],
          ),
        ),
      ),
    );
  }
}
