import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To Do App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var addNoteController =TextEditingController();

  void clearTextfield(){
    addNoteController.clear();
  }

  List<String> toDoList =[
    'Going for Game',
    'Paying Electricity Bills',
    'Having lunch with Friends',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Todo App',style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),),

        ),

        backgroundColor: Colors.blue.shade500,
        elevation: 10,
              ),
      body: ListView.builder(
        itemCount: toDoList.length,
          itemBuilder: (_, index){
        return InkWell(
          onTap: (){
            showModalBottomSheet(context: context, builder: (_){
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red.shade400,),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text("Update Note",style: TextStyle(
                        fontSize: 25,
                      ),),
                      SizedBox(height: 20,),
                      TextField(
                        controller: addNoteController,
                        decoration: InputDecoration(

                          label: Text(toDoList[index]),
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                toDoList[index]= addNoteController.text.toString();
                                setState(() {

                                });
                                Navigator.pop(context);
                              },
                              child: Text("update")),
                          SizedBox(width: 50,),
                          ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
          },
          child: ListTile(
            title: Text(toDoList[index]),
            trailing: InkWell(
              onTap: (){

              },
                child: InkWell(
                  onTap: (){
                    showDialog(
                        context: context, builder: (_){
                          return AlertDialog(
                            title: Text("Delete"),
                            content: Text("Really Wants to Delete This Record..?"),
                            actions: [
                              TextButton(
                                  onPressed:(){
                                    toDoList.removeAt(index);
                                    setState(() {

                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Delete")),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel")),
                            ],
                          );
                    });
                  },
                    child: Icon(Icons.delete,color: Colors.red,))),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          showModalBottomSheet(context: context, builder: (_){
            return Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              color: Colors.blue.shade400,),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text("Add Note",style: TextStyle(
                      fontSize: 25,
                    ),),
                    SizedBox(height: 20,),
                    TextField(
                      controller: addNoteController,
                      decoration: InputDecoration(

                        label: Text("Enter New Note.."),
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: (){
                              toDoList.add(addNoteController.text.toString());
                              setState(() {
                              });
                              clearTextfield();
                              Navigator.pop(context);
                            },
                            child: Text("Add")),
                        SizedBox(width: 50,),
                        ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("Cancel")),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
