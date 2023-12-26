import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile3/config/api.dart';
import 'package:mobile3/config/asset.dart';
import 'package:http/http.dart' as http;
import 'package:mobile3/model/user.dart';
import 'package:mobile3/view/login.dart';
import 'package:mobile3/view/widgets/info.dart';

class Register extends StatelessWidget {
  var _controllerUserName = TextEditingController();
  var _controllerEmail = TextEditingController();
  var _controllerPassword = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  var _obsecure = true.obs;

  void register() async {
    User user = User(_controllerUserName.text, _controllerEmail.text,
        _controllerPassword.text);
    try {
      var response =
          await http.post(Uri.parse(Api.register), body: user.toJson());
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        if (responseBody['status'] == 200) {
          Get.offNamedUntil('/login', ((route) => false));
          InfoMessage.snackbar(Get.context!, 'Registrasi Success');
        } else {
          InfoMessage.snackbar(Get.context!, 'Registrasi Failed');
        }
      } else {
        InfoMessage.snackbar(Get.context!, 'Registrasi Failed');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/shin.png'),
              ),
            ),
          ),
          top: 100,
          left: 100,
        ),
        Positioned(
          child: Text(
            'Shinigami.dart',
            style: TextStyle(
              fontSize: 20,
              color: Asset.colorAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          top: 150,
          right: 50,
        ),
        Positioned(
          child: Text(
            'SIGN UP',
            style: TextStyle(
              fontSize: 20,
              color: Asset.colorAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          top: 280,
          left: 10,
        ),
        Positioned(
          top: 300,
          bottom: 0,
          right: 0,
          left: 0,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[800],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          controller: _controllerUserName,
                                          validator: (value) => value == ''
                                              ? "Don't Empty"
                                              : null,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Asset.colorPrimary,
                                            ),
                                            hintText: 'User Name',
                                            border: styleBorder(),
                                            enabledBorder: styleBorder(),
                                            focusedBorder: styleBorder(),
                                            disabledBorder: styleBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                            fillColor: Asset.colorAccent,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          controller: _controllerEmail,
                                          validator: (value) => value == ""
                                              ? " Dont Empty"
                                              : null,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Asset.colorPrimary,
                                            ),
                                            hintText: 'Email@gmail.com',
                                            border: styleBorder(),
                                            enabledBorder: styleBorder(),
                                            focusedBorder: styleBorder(),
                                            disabledBorder: styleBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                            fillColor: Asset.colorAccent,
                                            filled: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Obx(() {
                                          return TextFormField(
                                            validator: (value) => value == ''
                                                ? "Don't Empty"
                                                : null,
                                            obscureText: _obsecure.value,

                                            controller: _controllerPassword,
                                            // obscureText: _controllerPassword.value,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.password,
                                                color: Asset.colorPrimary,
                                              ),
                                              suffixIcon: Obx(() {
                                                return GestureDetector(
                                                  onTap: () {
                                                    _obsecure.value =
                                                        !_obsecure.value;
                                                  },
                                                  child: Icon(
                                                    _obsecure.value
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: Asset.colorPrimary,
                                                  ),
                                                );
                                              }),
                                              hintText: 'Password',
                                              border: styleBorder(),
                                              enabledBorder: styleBorder(),
                                              focusedBorder: styleBorder(),
                                              disabledBorder: styleBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 12,
                                              ),
                                              fillColor: Asset.colorAccent,
                                              filled: true,
                                            ),
                                          );
                                        }),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 40),
                                        child: Material(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: InkWell(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                register();
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 40, vertical: 10),
                                              child: Text(
                                                'Register',
                                                style: TextStyle(
                                                  color: Asset.colorAccent,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Kembali Ke',
                                  style: TextStyle(
                                    color: Asset.colorAccent,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.offNamedUntil(
                                          '/login', (route) => false);
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ))
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ));
  }

  InputBorder styleBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        width: 0,
        color: Asset.colorAccent,
      ),
    );
  }
}
