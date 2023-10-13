import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO LIST"),
      ),
      floatingActionButton:FloatingActionButton(
          splashColor: Colors.purple,
        onPressed: (){
            showModalBottomSheet(context: context, builder: (context){
              return Column(
                children: [
                  Text("Create New",style: Theme.of(context).textTheme.titleLarge,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Write your task here",
                        enabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(5),)
                      ),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){}, child: const Text("save"),),
                ],
                
              );
            });
        },
        child: Column(
          children: [
            SizedBox(height: 5),
            Icon(Icons.add,size: 20,),

            Text("ADD"),
          ],
        ),

      ),
    body:ListView.separated(
      itemCount: 20,
        itemBuilder: (context,index){
        return ListTile(
          leading: CircleAvatar(
              child: Text("${index+1}")),
          title: Text("create new task"),
          subtitle: Text("10.09.2023"),
          trailing: Icon(Icons.cloud_upload),
        );
        },
        separatorBuilder: (context,index){
        return const Divider();
        })
    );
  }
}
