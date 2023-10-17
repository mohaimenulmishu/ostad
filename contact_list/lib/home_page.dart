import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Contact List")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: "Contact Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "Contact Number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = "";
                          contactController.text = "";
                          contacts.add(Contact(name: name, contact: contact));
                        });
                      }
                    },
                    child: const Text("save")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("update")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            contacts.isEmpty
                ? const Text("No contact yet")
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.pinkAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contacts[index].name),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  },
                  child: const Icon(Icons.delete)),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                  onTap: () {
                    //
                    setState(() {
                      nameController.text = contacts[index].name;
                      contactController.text = contacts[index].contact;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
            ],
          ),
        ),
      ),
    );
  }
}
