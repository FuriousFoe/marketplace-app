// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:marketplace/const.dart';

class ListItems extends StatefulWidget {
  final String emailid;
  const ListItems({
    Key? key,
    required this.emailid,
  }) : super(key: key);

  @override
  State<ListItems> createState() => _ListItemsState();
}

List<String> listitem = [
  'Select Products',
  'Rava Ladoo',
  'Karanji',
  'Chivda',
  'Chakli',
  'Shankarpali',
  'Boondi Ladoo',
  'LADU',
  'BLACK PEPPER',
  'CINNAMON',
  'Cardamom',
  'Red Chilli',
  'Haldi',
  'Mango Pickle',
  'Carrot & Turnip',
  'Lemon Pickle',
  'Tomato Pickle',
  'Green Chilli',
];
List<String> listtype = [
  'Select Products Type',
  'Spices',
  'Sweets',
  'Pickle',
];

class _ListItemsState extends State<ListItems> {
  String dropdownValueItem = listitem.first;
  String setitem = "";
  String dropdownValueItemType = listtype.first;
  String settype = "";
  String imageUrl1 = '';
  String imageUrl2 = '';
  String name = '';
  String add = '';
  int contactno = 0;

  final _formKey = GlobalKey<FormState>();
  final descpController = TextEditingController();
  final priceController = TextEditingController();
  Timestamp timestamp = Timestamp.now();

  void getdata() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('SellerUser')
        .doc(widget.emailid)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
      setState(() {
        // Update state variables with fetched user data
        name = userData['Name'];
        add = userData['Address'];
        contactno = userData['Contact number'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email.toString();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: dropdownMenu(listtype, dropdownValueItemType,
                    (String? value) {
                  setState(() {
                    dropdownValueItemType = value!;
                    settype = dropdownValueItemType;
                  });
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    dropdownMenu(listitem, dropdownValueItem, (String? value) {
                  setState(() {
                    dropdownValueItem = value!;
                    setitem = dropdownValueItem;
                  });
                }),
              ),
              InkWell(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);

                  if (file == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Image not selected'),
                        );
                      },
                    );
                  } else {
                    String uniqueFilename =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    Reference refrenceroot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        refrenceroot.child('Passport Photo');
                    Reference refrenceImageToUpload =
                        referenceDirImages.child(uniqueFilename);

                    try {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Please wait Uploading',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    decoration: TextDecoration.none),
                              ),
                              CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            ],
                          );
                        },
                      );

                      await refrenceImageToUpload.putFile(
                          File(file.path),
                          SettableMetadata(
                            contentType: "image/jpeg",
                          ));
                      imageUrl1 = await refrenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      // Print or log the error for debugging purposes

                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Image not uploaded'),
                          );
                        },
                      );
                    } finally {
                      Navigator.of(context)
                          .pop(); // Dismiss the "Please wait Uploading" dialog
                    }

                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Image uploaded successfully'),
                        );
                      },
                    );
                  }

                  setState(() {
                    imageUrl1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 97, 139, 163),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(CupertinoIcons.photo)),
                        Text(
                          'Select product photo1',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);

                  if (file == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Image not selected'),
                        );
                      },
                    );
                  } else {
                    String uniqueFilename =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    Reference refrenceroot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        refrenceroot.child('Product images');
                    Reference refrenceImageToUpload =
                        referenceDirImages.child(uniqueFilename);

                    try {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Please wait Uploading',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                    decoration: TextDecoration.none),
                              ),
                              CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            ],
                          );
                        },
                      );

                      await refrenceImageToUpload.putFile(
                          File(file.path),
                          SettableMetadata(
                            contentType: "image/jpeg",
                          ));
                      imageUrl2 = await refrenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      // Print or log the error for debugging purposes

                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            content: Text('Image not uploaded'),
                          );
                        },
                      );
                    } finally {
                      Navigator.of(context)
                          .pop(); // Dismiss the "Please wait Uploading" dialog
                    }

                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Image uploaded successfully'),
                        );
                      },
                    );
                  }

                  setState(() {
                    imageUrl2;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: const Color.fromARGB(255, 97, 139, 163),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(CupertinoIcons.photo)),
                        Text(
                          'Select product photo2',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          label: Text('Price'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(12))),
                      keyboardType: TextInputType.phone,
                      maxLines: null,
                      minLines: 1,
                      controller: priceController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 150,
                      child: TextFormField(
                        decoration: InputDecoration(
                            label: Text('Write Description'),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.greenAccent),
                                borderRadius: BorderRadius.circular(12))),
                        controller: descpController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('SellerUser')
                              .doc(email)
                              .collection('ItemSendReview')
                              .doc()
                              .set({
                            'Products Type': setitem,
                            'Product Category': settype,
                            'Image URL 1': imageUrl1,
                            'Image URL 2': imageUrl2,
                            'Price': int.parse(priceController.text.trim()),
                            'Decription': descpController.text.trim(),
                            'Name': name,
                            'Address': add,
                            'Contact Number': contactno,
                            'EmailId': email,
                            'Time': timestamp
                          }).then((value) {
                            FirebaseFirestore.instance
                                .collection('ReviewListItem')
                                .doc()
                                .set({
                              'Products Type': setitem,
                              'Product Category': settype,
                              'Image URL 1': imageUrl1,
                              'Image URL 2': imageUrl2,
                              'Price': int.parse(priceController.text.trim()),
                              'Decription': descpController.text.trim(),
                              'Name': name,
                              'Address': add,
                              'Contact Number': contactno,
                              'EmailId': email,
                              'Time': timestamp
                            });
                          }).then((value) => showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          content:
                                              Text('Send For Review Process'),
                                        );
                                      }).then((value) {
                                    int count = 1;
                                    Navigator.of(context)
                                        .popUntil((_) => count-- < 0);
                                  }));
                        },
                        child: Text('Submit for review'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
