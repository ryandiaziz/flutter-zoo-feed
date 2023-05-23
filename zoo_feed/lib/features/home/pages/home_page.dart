import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoo_feed/common/widgets/costom_bottom_navigation_bar.dart';
import 'package:zoo_feed/features/home/pages/sub_home_page/animal_page.dart';
import 'package:zoo_feed/features/home/pages/sub_home_page/habitats_page.dart';
import 'package:zoo_feed/features/home/pages/sub_home_page/typeclass_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;
  bool _isSearching = false;
  Map<String, dynamic> users = {};
  TextEditingController _searchController = TextEditingController();

  List<Tab> myTab = const [
    Tab(text: "Animals"),
    Tab(text: "Class"),
    Tab(text: "Habitat"),
  ];

  List<Widget> appTitles = const [
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

  Future<void> fetchUser() async {
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString('access_token');
    final url = Uri.parse('http://192.168.1.6:3000/api/users/account');
    Map<String, String> headers = {
      'access_token': accessToken!,
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body);
      });
      await pref.setString('user_data', response.body);
    } else {
      throw Exception('Failed to fetch animals');
    }
  }

  @override
  void initState() {
    fetchUser();
    _tabController = TabController(length: myTab.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(37),
            bottomRight: Radius.circular(37),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xFF019267),
        title: _isSearching
            ? TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.75)),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              )
            : GestureDetector(
                onTap: _toggleSearchBar,
                child: Text(
                  'Hello, ${users['name']}!',
                  style: const TextStyle(fontSize: 15, fontFamily: "inter"),
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
            padding: const EdgeInsets.only(right: 25),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'http://192.168.1.6:3000/${users['imageUrl']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(37),
              bottomRight: Radius.circular(37),
            ),
            child: SizedBox(
              height: 50,
              width: 300,
              child: TabBar(
                controller: _tabController,
                labelStyle: const TextStyle(fontWeight: FontWeight.w800),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.normal),
                padding: const EdgeInsets.only(bottom: 10.0),
                indicator: BoxDecoration(
                  color: const Color(0xFFFB983E),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(251, 152, 62, 0.5),
                      offset: Offset(3.0, 3.0),
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
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(37),
            bottomRight: Radius.circular(37),
          ),
          child: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: Container(
              color: const Color(0xFF019267),
              alignment: Alignment.center,
              child: Container(
                height: 110,
                width: 400,
                padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Explore",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "inter",
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
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
      body: TabBarView(
        controller: _tabController,
        children: [
          AnimalPage(),
          TypeclassPage(),
          HabitatPage(),
        ],
      ),
    );
  }
}
