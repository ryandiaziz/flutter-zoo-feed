import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(37),
              bottomRight: Radius.circular(37),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Color(0xFF019267),
          title: Text(
            "Hello, Michael!",
            style: TextStyle(fontSize: 15, fontFamily: "inter"),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  //   image: DecorationImage(
                  //     image: AssetImage(''),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  // child: IconButton(
                  //   onPressed: () {},
                  //   icon:  ,
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(37),
                bottomRight: Radius.circular(37),
              ),
            ),
          ),
          flexibleSpace: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(37),
              bottomRight: Radius.circular(37),
            ),
            child: PreferredSize(
              preferredSize: Size.fromHeight(200),
              child: Container(
                color: Color(0xFF019267),
                alignment: Alignment.center,
                child: Container(
                  height: 110,
                  width: 300,
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Explore",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "inter",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Your Favorite Zoo",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "inter",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF019267),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chats',
            ),
          ],
        ),
      ),
    );
  }
}
