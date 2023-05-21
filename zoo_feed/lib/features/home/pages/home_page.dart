import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';
import 'package:zoo_feed/features/home/pages/sub_home_page/animal_page.dart';
import 'package:zoo_feed/features/home/pages/sub_home_page/habitats_page.dart';
import 'package:zoo_feed/features/home/pages/sub_home_page/typeclass_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

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

  void _toggleSearchBar() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        title: _isSearching
            ? TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.75)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              )
            : Container(
                child: GestureDetector(
                  onTap: _toggleSearchBar,
                  child: Text(
                    "Hello, Michael!",
                    style: TextStyle(fontSize: 15, fontFamily: "inter"),
                  ),
                ),
              ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            _isSearching ? Icons.clear : Icons.search,
            color: Colors.white,
          ),
          onPressed: _toggleSearchBar,
        ),
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
      bottomNavigationBar: bottomnavbar(data: 0),
      body: TabBarView(
        controller: _tabController,
        children: [
          AnimalPage(),
          HabitatPage(),
          TypeclassPage(),
        ],
      ),
    );
  }
}
