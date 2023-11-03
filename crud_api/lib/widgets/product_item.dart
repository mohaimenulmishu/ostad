import "package:crud_api/screen/add_new_product_screen.dart";
import "package:flutter/material.dart";

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,


            builder: (context) {
              return productActionDialog(context);
            });
      },
      leading: Image.network(
        "https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fG1vYmlsZXxlbnwwfHwwfHx8MA%3D%3D",
        width: 80,
      ),
      title: const Text("Product Name "),
      subtitle: Text("description"),
      trailing: Text("\$120"),
    );
  }

  AlertDialog productActionDialog(BuildContext context) {
    return AlertDialog(
              title: Center(child: Text("Select Action")),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Edit"),
                    leading: Icon(Icons.edit),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddNewProductScreen()));
                    },
                  ),
                  ListTile(
                    title: Text("Delete"),
                    leading: Icon(Icons.delete),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
  }
}
