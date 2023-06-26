import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Drawer(
      width: width/2,
      backgroundColor: Colors.white,
      child: Column(
        children: const [




          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.add_task,color: Colors.black,),
              title: Text("Add",style: TextStyle(fontWeight: FontWeight.bold),),
              trailing: Icon(Icons.arrow_forward,color: Colors.black,),
            ),
          ),
        ],
      ),
    );
  }
}