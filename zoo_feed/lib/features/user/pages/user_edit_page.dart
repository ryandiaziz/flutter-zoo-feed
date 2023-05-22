import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoo_feed/common/widgets/custom_elevated_button.dart';
import 'package:zoo_feed/common/widgets/custom_textfield.dart';

import '../../../common/utils/coloors.dart';

class UserEditPage extends StatefulWidget {
  final Map<String, dynamic> users;
  const UserEditPage({super.key, required this.users});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  @override
  void initState() {
    nameC.text = widget.users['name'];
    emailC.text = widget.users['email'];
    ageC.text = widget.users['age'] == 0
        ? 'Belum diisi'
        : widget.users['age'].toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
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
                      child: Image.network(
                        'http://192.168.1.2:3000/${widget.users['imageUrl']}',
                        fit: BoxFit.cover,
                      ),
                    ),
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
                          onPressed: () {},
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
                image: 'assets/icon/Mail.png',
                controller: nameC,
                hintText: 'Name',
                keyBoardType: TextInputType.name,
                read: false,
              ),
              CustomTextField(
                image: 'assets/icon/Mail.png',
                controller: ageC,
                hintText: 'Age',
                keyBoardType: TextInputType.name,
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
                onPressed: () {},
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
