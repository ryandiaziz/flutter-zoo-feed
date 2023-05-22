import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../common/utils/coloors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoo_feed/common/widgets/custom_small_card.dart';
import 'package:zoo_feed/common/widgets/custom_small_card_buy.dart';

class AnimalDetailPage extends StatefulWidget {
  final int animalId;

  const AnimalDetailPage({required this.animalId});

  @override
  _AnimalDetailPageState createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  dynamic animalDetail;
  dynamic users;

  @override
  void initState() {
    getAnimalDetail();
    getUserData();
    super.initState();
  }

  Future<void> getUserData() async {
    final pref = await SharedPreferences.getInstance();
    final userData = pref.getString('user_data');
    if (userData != null) {
      setState(() {
        users = jsonDecode(userData);
      });
    }
  }

  Future<void> getAnimalDetail() async {
    final response = await http.get(Uri.parse(
        'http://192.168.1.2:3000/api/animals/detail/${widget.animalId}'));
    if (response.statusCode == 200) {
      setState(() {
        animalDetail = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to fetch animal detail');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (animalDetail == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 285,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              title: Text(
                '${animalDetail['resultAF']['name']}',
                style: const TextStyle(
                    fontSize: 25,
                    fontFamily: "inter",
                    fontWeight: FontWeight.w900),
              ),
              centerTitle: true,
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
                            'http://192.168.1.2:3000/${users['imageUrl']}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final top = constraints.biggest.height;
                  return Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: top - 150,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Coloors.green,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(37),
                              bottomRight: Radius.circular(37),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: top / 3.5,
                        left: -10,
                        right: 20,
                        child: Card(
                          elevation: 8,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(37),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(37),
                            child: Container(
                              height: 200,
                              color: Colors.transparent,
                              child: Image(
                                image: NetworkImage('http://192.168.1.2:3000/' +
                                    animalDetail['resultAF']['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        children: [
                          smallcard(
                              imageUrl: '',
                              text: '${animalDetail['resultAF']['age']}+',
                              destext: 'Age'),
                          SizedBox(width: 10),
                          smallcard(
                            imageUrl: '',
                            text: animalDetail['resultAF']['sex'],
                            destext: 'Sex',
                            fontsize: 25,
                          ),
                          SizedBox(width: 10),
                          smallcard(
                              imageUrl: '',
                              text: animalDetail['resultAF']['like'],
                              destext: 'Like'),
                          SizedBox(width: 10),
                          smallcard(
                            imageUrl: animalDetail['classTypeData'][0]
                                ['imageUrl'],
                            text: animalDetail['classTypeData'][0]['name'],
                            destext: 'Class',
                            fontsize: 15,
                          ),
                          SizedBox(width: 10),
                          smallcard(
                            imageUrl: animalDetail['habitatData'][0]
                                ['imageUrl'],
                            text: animalDetail['habitatData'][0]['name'],
                            destext: 'Class',
                            fontsize: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      ' ${animalDetail['resultAF']['description']}',
                      style:
                          const TextStyle(fontSize: 15.0, fontFamily: 'inter'),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    child: Center(
                      child: Text(
                        ' FOOD',
                        style: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'inter',
                            color: Coloors.green,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  //     child: Row(
                  //       children: [
                  //         smallcard(
                  //             imageUrl: '',
                  //             text: '${animalDetail['resultAF']['age']}+',
                  //             destext: 'Age'),
                  //         SizedBox(width: 10),
                  //         smallcard(
                  //           imageUrl: '',
                  //           text: animalDetail['resultAF']['sex'],
                  //           destext: 'Sex',
                  //           fontsize: 25,
                  //         ),
                  //         SizedBox(width: 10),
                  //         smallcard(
                  //             imageUrl: '',
                  //             text: animalDetail['resultAF']['like'],
                  //             destext: 'Like'),
                  //         SizedBox(width: 10),
                  //         smallcard(
                  //           imageUrl: animalDetail['classTypeData'][0]
                  //               ['imageUrl'],
                  //           text: animalDetail['classTypeData'][0]['name'],
                  //           destext: 'Class',
                  //           fontsize: 15,
                  //         ),
                  //         SizedBox(width: 10),
                  //         smallcard(
                  //           imageUrl: animalDetail['habitatData'][0]
                  //               ['imageUrl'],
                  //           text: animalDetail['habitatData'][0]['name'],
                  //           destext: 'Class',
                  //           fontsize: 15,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
