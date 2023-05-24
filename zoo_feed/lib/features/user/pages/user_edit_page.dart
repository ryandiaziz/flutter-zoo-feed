import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zoo_feed/common/widgets/custom_elevated_button.dart';
import 'package:zoo_feed/common/widgets/custom_textfield.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/utils/coloors.dart';

class UserEditPage extends StatefulWidget {
  final Map<String, dynamic> users;
  const UserEditPage({super.key, required this.users});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = RegExp(p);

class _UserEditPageState extends State<UserEditPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();
  File? image;

  Future getImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final imagePicked = await picker.pickImage(source: source);

    setState(() {
      image = File(imagePicked!.path);
    });
  }

  void update() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    final url = Uri.parse(
        'http://192.168.1.6:3000/api/users/update/${widget.users['id']}');
    final body = {
      'name': nameC.text,
      'age': ageC.text,
      'email': emailC.text,
      'imageUrl': image,
    };
    final headers = {
      'Content-Type': 'multipart/form-data',
      'access_token': accessToken!,
    };

    final response = await http.put(
      url,
      body: body,
      headers: headers,
    );
  }

  void vaildation() async {
    if (emailC.text.isEmpty && ageC.text.isEmpty && nameC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          content: Text("Fields Are Empty"),
        ),
      );
    } else if (emailC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (nameC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Name Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(emailC.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Try Vaild Email"),
        ),
      );
    } else if (ageC.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Age Is Empty"),
        ),
      );
    } else {
      update();
    }
  }

  @override
  void initState() {
    nameC.text = widget.users['name'];
    emailC.text = widget.users['email'];
    ageC.text = widget.users['age'].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomSheetImage() {
      return Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            const Text("Pilih Foto"),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        getImage(ImageSource.camera);
                      },
                      child: const Icon(Icons.camera),
                    ),
                    const Text('Kamera')
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await getImage(ImageSource.gallery);
                      },
                      child: const Icon(Icons.image),
                    ),
                    const Text('Galeri')
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(37),
            bottomRight: Radius.circular(37),
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Coloors.green,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "inter",
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              // profile image
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: image == null
                            ? Image.network(
                                'http://192.168.1.6:3000/${widget.users['imageUrl']}',
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                image!,
                                fit: BoxFit.cover,
                              )),
                  ),
                  Positioned(
                    bottom: -1,
                    right: 1,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Coloors.green,
                      ),
                      child: Center(
                        child: IconButton(
                          color: Colors.amber,
                          tooltip: 'Edit profile',
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (builder) => bottomSheetImage(),
                            );
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              // field
              CustomTextField(
                image: 'assets/icon/user.png',
                controller: nameC,
                hintText: 'Name',
                keyBoardType: TextInputType.name,
                read: false,
              ),
              CustomTextField(
                image: 'assets/icon/calendar.png',
                controller: ageC,
                hintText: 'Age',
                keyBoardType: TextInputType.number,
                read: false,
              ),
              CustomTextField(
                image: 'assets/icon/Mail.png',
                controller: emailC,
                hintText: 'Email',
                keyBoardType: TextInputType.name,
                read: false,
              ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                onPressed: vaildation,
                text: "Submit",
                isOutline: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
