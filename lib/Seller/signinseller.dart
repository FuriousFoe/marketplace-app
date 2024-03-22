import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/Buyer/loginbuyer.dart';
import 'package:marketplace/Seller/homepageseller.dart';
import 'package:marketplace/Seller/loginseller.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/Buyer/homepagebuyer.dart';

class SignInSeller extends StatefulWidget {
  const SignInSeller({super.key});

  @override
  State<SignInSeller> createState() => _SignInState();
}

class _SignInState extends State<SignInSeller> {
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
        .collection('SellerUser')
        .doc(emailControler.text.trim())
        .set({
      'Name': name,
      'Email': email,
      'Age': age,
      'Contact number': contactnumber,
      'Address': address,
    });
  }

  void createUser() async {
    String email = emailControler.text.trim();
    String password = PasswordControler.text.trim();
    String cPassword = cPasswordControler.text.trim();

    if (email == '' || password == '' || cPassword == '') {
      // Snakbar is use to show the errors!
      const message = SnackBar(
        content: Text(
          'The fields can not be empty',
          style: TextStyle(
            fontFamily: 'Mukta',
            fontSize: 20,
          ),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: mainColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    } else if (password != cPassword) {
      const message = SnackBar(
        content: Text(
          'Incorrect Password',
          style: TextStyle(
            fontFamily: 'Mukta',
            fontSize: 20,
          ),
        ),
        duration: Duration(seconds: 3),
        backgroundColor: mainColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(message);
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        addUserDetails(
          _nameController.text.trim(),
          emailControler.text.trim(),
          _ageController.text.trim(),
          int.parse( _contactnoController.text.trim()),
       
          _addresController.text.trim(),

          // _parentnameController.text.trim(),
          // int.parse(_studentcontactnoController.text.trim()),
          // int.parse(_parentcontactnoController.text.trim()),
          // _addresController.text.trim(),
        );

        if (userCredential.user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeSeller()));
        }
      } on FirebaseAuthException catch (e) {
        final message = SnackBar(
          content: Text(
            '${e.code.toString()}',
            style: const TextStyle(
              fontFamily: 'Mukta',
              fontSize: 20,
            ),
          ),
          duration: const Duration(seconds: 3),
          backgroundColor: mainColor,
        );
        ScaffoldMessenger.of(context).showSnackBar(message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(55),
                  bottomRight: Radius.circular(55)),
              child: Hero(
                tag: 1,
                child: Image.asset(
                  'Images/Background1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 340,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                  )
                ],
                color: Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          signIn = false;
                          login = true;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginSeller()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 35, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: login
                                ? Color(0xFF719f4b)
                                : Color.fromARGB(255, 189, 189, 189),
                          ),
                          height: 30,
                          width: 80,
                          // margin: EdgeInsets.only(bottom: 10),
                          child: const Center(
                              child: Text(
                            'Login',
                            style: TextStyle(fontFamily: 'Mukta'),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 35, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: signIn
                              ? mainColor
                              : Color.fromARGB(255, 189, 189, 189),
                        ),
                        height: 30,
                        width: 80,
                        //margin: EdgeInsets.only(bottom: 10),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontFamily: 'Mukta'),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 5),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            enabled: true,
                            focusedBorder: focusBorder,
                            enabledBorder: enableBorder,
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 16),
                            hintText: 'Enter your Name',
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 5),
                      child: TextField(
                        controller: _addresController,
                        decoration: const InputDecoration(
                            enabled: true,
                            focusedBorder: focusBorder,
                            enabledBorder: enableBorder,
                            labelText: 'Address',
                            labelStyle: TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 16),
                            hintText: 'Enter your Address',
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 5),
                      child: TextField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                            enabled: true,
                            focusedBorder: focusBorder,
                            enabledBorder: enableBorder,
                            labelText: 'Age',
                            labelStyle: TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 16),
                            hintText: 'Enter your Age',
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 5),
                      child: TextField(
                        controller: _contactnoController,
                        decoration: const InputDecoration(
                            enabled: true,
                            focusedBorder: focusBorder,
                            enabledBorder: enableBorder,
                            labelText: 'Contact Number',
                            labelStyle: TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 16),
                            hintText: 'Enter your Contact number',
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 5),
                      child: TextField(
                        controller: emailControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            enabled: true,
                            focusedBorder: focusBorder,
                            enabledBorder: enableBorder,
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 16),
                            hintText: 'Enter your Email',
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 5),
                      child: TextField(
                        controller: PasswordControler,
                        decoration: const InputDecoration(
                            enabled: true,
                            focusedBorder: focusBorder,
                            enabledBorder: enableBorder,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 16),
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 25, right: 25, top: 5),
                      child: TextField(
                        controller: cPasswordControler,
                        decoration: const InputDecoration(
                            enabled: true,
                            focusedBorder: focusBorder,
                            enabledBorder: enableBorder,
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: Color(0xFFBBBBBB), fontSize: 16),
                            hintText: 'Enter your Password Again',
                            hintStyle: TextStyle(fontSize: 15)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        createUser();

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
                            color: mainColor),
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
              child: Image.asset('Images/Background2.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
