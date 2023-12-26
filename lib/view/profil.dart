import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile3/config/asset.dart';
import 'package:mobile3/controller/Cuser.dart';
import 'package:mobile3/event/eventPref.dart';
// import 'package:mobile3/view/login.dart';

class Profil extends StatelessWidget {
  void logout() async {
    var response = await Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('You sure to logout?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('No')),
          TextButton(
              onPressed: () => Get.back(result: 'yes'),
              child: const Text('Yes')),
        ],
      ),
    );
    if (response == 'yes') {
      await EventPref.deleteUser();
      Get.offNamedUntil('/login', (route) => false);
    }
  }

  final _cUser = Get.put(CUser());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: Asset.colorAccent),
            ),
            child: const Icon(
              Icons.account_circle,
              size: 120,
              color: Asset.colorAccent,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                if (_cUser.user != null) {
                  return Column(
                    children: [
                      BuildItemProfile(
                        icon: Icons.email,
                        data: _cUser.user.email,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      BuildItemProfile(
                        icon: Icons.person,
                        data: _cUser.user.username ?? 'belum ada',
                      ),
                    ],
                  );
                } else {
                  return Text('Data pengguna belum tersedia');
                }
              }),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Material(
                    color: Asset.colorPrimary,
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        logout();
                        print(_cUser.user.username);
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          'LogOut',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: const Color.fromARGB(255, 30, 40, 177),
                    borderRadius: BorderRadius.circular(30),
                    child: InkWell(
                      onTap: () {
                        // logout();
                        // print(_cUser.user.username);
                        // Get.to(EditProfile(
                        //   userName: _cUser.user.username,
                        //   email: _cUser.user.email,
                        //   id_user: _cUser.user.idUser,
                        // ));
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputBorder styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 0,
        color: Asset.colorAccent,
      ),
    );
  }
}

class BuildItemProfile extends StatelessWidget {
  const BuildItemProfile({super.key, required this.icon, required this.data});
  final IconData? icon;
  final String? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Asset.colorAccent,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
            color: Asset.colorPrimary,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            '$data',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
