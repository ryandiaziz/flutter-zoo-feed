import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/pages/profile_page.dart';
import 'package:zoo_feed/pages/ticket_page.dart';
import 'package:zoo_feed/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;
  int _bottomNavIndex = 0;

  List<Tab> myTab = [
    Tab(text: "Animals"),
    Tab(text: "Class"),
    Tab(text: "Habitat"),
  ];

  List<Widget> appTitles = [
    Text(
      "Your Favorite Zoo",
      style: TextStyle(
        fontSize: 30,
        fontFamily: "inter",
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    Text(
      "Class of the Animals",
      style: TextStyle(
        fontSize: 30,
        fontFamily: "inter",
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    Text(
      "Habitats in our Zoo",
      style: TextStyle(
        fontSize: 30,
        fontFamily: "inter",
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTab.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _tabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Container(
              height: 50,
              width: 300,
              child: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontWeight: FontWeight.w800),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                padding: EdgeInsets.only(bottom: 10.0),
                indicator: BoxDecoration(
                  color: Color(0xFFFB983E),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(251, 152, 62, 0.5),
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                tabs: myTab,
              ),
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
                width: 400,
                padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
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
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                      child: appTitles[_tabIndex],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(37),
            topRight: Radius.circular(37),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(37),
            topRight: Radius.circular(37),
          ),
          child: Container(
            height: 70,
            color: Color(0xFF019267),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Color(0xFF019267),
              ),
              child: BottomNavigationBar(
                selectedItemColor: Color(0xFFFB983E),
                unselectedItemColor: Colors.white,
                currentIndex: _bottomNavIndex,
                onTap: (int index) {
                  if (_bottomNavIndex != index) {
                    setState(() {
                      _bottomNavIndex = index;
                      _tabController.index = index;
                    });
                  }

                  if (index == 1) {
                    Navigator.pushNamed(context, ProfilePage.routeName);
                  } else if (index == 2) {
                    Navigator.pushNamed(context, TicketPage.routeName);
                  } else if (index == 3) {
                    Navigator.pushNamed(context, CartPage.routeName);
                  }
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.confirmation_number),
                    label: 'Ticket',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text("Animals"),
          ),
          Center(
            child: Text("Class"),
          ),
          Center(
            child: Text("Habitat"),
          ),
        ],
      ),
    );
  }
}
