import 'package:flutter/material.dart';

class myEcommApp extends StatefulWidget {
  const myEcommApp({super.key});

  @override
  State<myEcommApp> createState() => _myEcommAppState();
}

class _myEcommAppState extends State<myEcommApp> {
  TextEditingController searchController = TextEditingController();
  // List<Icon> myIconslist =[
  //   Icons.add_a_photo,
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        leading: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.unfold_more),),
        actions: [
          CircleAvatar(child: Icon(Icons.add_alert_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10,),
                  // TextField(
                  //   controller: searchController,
                  //   decoration: InputDecoration(
                  //     hintText: "Searching...",
                  //   ),
                  // ),
                   Text("Search... "),
                  SizedBox(width: MediaQuery.of(context).size.width*0.6,),
                  Icon(Icons.more_vert),
                  Icon(Icons.unfold_more_outlined),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 35,
                    top: 20,
                    child: Text("Super Sale\nDiscount \nUp to 50%\n",style: TextStyle(
                      fontSize: 28,
                    ),),
                  ),
                  Positioned(
                    top: 150,
                    left: 40,
                    child: ElevatedButton(onPressed: () {
                    },
                        child: Text(" Shop Now", style: TextStyle(
                          color: Colors.orange,
                        ),)),
                  ),
                  Positioned(
                      right: 20,
                      child: Icon(Icons.add_a_photo, size: 200,color: Colors.brown,)),
                  //Image.asset("assets/images/imp_shoes.jpg",fit: BoxFit.fill,),
                ],
              ),
            ),

            Container(
              height: 100,
              child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    child: Icon(Icons.adb_sharp, color: Colors.white,),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
