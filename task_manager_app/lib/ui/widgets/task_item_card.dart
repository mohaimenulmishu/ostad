import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(margin: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title will be there",style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w500),),
            Text("Description"),
            Text("Date"),
            SizedBox(height: 8,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text("New"),backgroundColor: Colors.lightBlueAccent,),
                Wrap(
                  children: [
                    Icon(Icons.delete_forever),
                    Icon(Icons.edit),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}



