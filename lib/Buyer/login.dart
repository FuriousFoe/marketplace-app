// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/Buyer/homepagebuyer.dart';
// import 'package:marketplace/Buyer/loginbuyer.dart';
// import 'package:marketplace/Seller/homepageseller.dart';
// import 'package:marketplace/Seller/loginseller.dart';
// import 'package:marketplace/const.dart';
// import 'package:marketplace/Buyer/homepagebuyer.dart';

class SigninUser extends StatefulWidget {
  const SigninUser({super.key});

  @override
  State<SigninUser> createState() => _SignInState();
}

class _SignInState extends State<SigninUser> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController PasswordControler = TextEditingController();
  TextEditingController cPasswordControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _contactnoController = TextEditingController();
  final _addresController = TextEditingController();
  bool login = false;
  bool signIn = true;

  Future addUserDetails(
    String name,
    String email,
    String age,
    int contactnumber,
    String address,
  ) async {
    await FirebaseFirestore.instance
        .collection('User')
        .doc(emailControler.text.trim())
        .set({
      'Name': name,
      'Email': email,
      'Age': age,
      'Contact number': contactnumber,
      'Address': address,
    });
  }

  // void createUser() async {
  //   String email = emailControler.text.trim();
  //   String password = PasswordControler.text.trim();
  //   String cPassword = cPasswordControler.text.trim();

  //   if (email == '' || password == '' || cPassword == '') {
  //     // Snakbar is use to show the errors!
  //     const message = SnackBar(
  //       content: Text(
  //         'The fields can not be empty',
  //         style: TextStyle(
  //           fontFamily: 'Mukta',
  //           fontSize: 20,
  //         ),
  //       ),
  //       duration: Duration(seconds: 3),
  //       backgroundColor: Colors.red,
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(message);
  //   } else if (password != cPassword) {
  //     const message = SnackBar(
  //       content: Text(
  //         'Incorrect Password',
  //         style: TextStyle(
  //           fontFamily: 'Mukta',
  //           fontSize: 20,
  //         ),
  //       ),
  //       duration: Duration(seconds: 3),
  //       backgroundColor: mainColor,
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(message);
  //   } else {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(email: email, password: password);

  //       addUserDetails(
  //         _nameController.text.trim(),
  //         emailControler.text.trim(),
  //         _ageController.text.trim(),
  //         int.parse(_contactnoController.text.trim()),

  //         _addresController.text.trim(),

  //         // _parentnameController.text.trim(),
  //         // int.parse(_studentcontactnoController.text.trim()),
  //         // int.parse(_parentcontactnoController.text.trim()),
  //         // _addresController.text.trim(),
  //       );

  //       if (userCredential.user != null) {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => HomeSeller()));
  //       }
  //     } on FirebaseAuthException catch (e) {
  //       final message = SnackBar(
  //         content: Text(
  //           '${e.code.toString()}',
  //           style: const TextStyle(
  //             fontFamily: 'Mukta',
  //             fontSize: 20,
  //           ),
  //         ),
  //         duration: const Duration(seconds: 3),
  //         backgroundColor: mainColor,
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(message);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55)),
                child: Image.asset(
                  'Images/backgroundcopy.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Textfield("Name", _nameController),
                    const SizedBox(
                      height: 5,
                    ),
                    Textfield("Address", _addresController),
                    const SizedBox(
                      height: 5,
                    ),
                    Textfield("Age", _ageController),
                    const SizedBox(
                      height: 5,
                    ),
                    Textfield("Contact Number", _contactnoController),
                    const SizedBox(
                      height: 5,
                    ),
                    Textfield("Email Address", emailControler),
                    const SizedBox(
                      height: 5,
                    ),
                    Textfield("Password", PasswordControler),
                    const SizedBox(
                      height: 5,
                    ),
                    Textfield("Confirm Password", cPasswordControler),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailControler.text.trim(),
                                password: PasswordControler.text.trim())
                            .then((value) {
                          addUserDetails(
                              _nameController.text.trim(),
                              emailControler.text.trim(),
                              _ageController.text.trim(),
                             int.parse(_contactnoController.text.trim()) ,
                              _addresController.text.trim());
                        }).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home())));
                        // createUser();

                        print('Sign In');
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 5, color: Colors.black),
                            ],
                            borderRadius: BorderRadius.circular(22),
                            color: Colors.red),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontFamily: 'Mukta',
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
              child: Image.asset('Images/background2copy.jpg'),
            ),
          ],
        ),
      ),
    );
  }

  Padding Textfield(String name, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            labelText: name,
            labelStyle: const TextStyle(color: Color(0xFFBBBBBB), fontSize: 16),
            hintText: 'Enter your ${name}',
            hintStyle: TextStyle(fontSize: 15)),
      ),
    );
  }
}
