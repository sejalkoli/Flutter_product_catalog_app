import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://img.freepik.com/free-vector/smiling-young-girl-vector-portrait_1308-165628.jpg?t=st=1720277548~exp=1720281148~hmac=e20ba2bc1cf4d10236175022fa69df27b0135d5345e00357c83e02ffe0975fb5&w=740";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            // margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text(
                "Sejal Koli",
                // style: TextStyle(fontSize: 25),
              ),
              accountEmail: Text("s@gmail.com"),
              // decoration: BoxDecoration(color: Colors.red),
              // for the image
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.white),
            title: Text(
              "Email me",
              style: TextStyle(color: Colors.white),
              textScaleFactor: 1.2,
            ),
          ),
        ]),
      ),
    );
  }
}
