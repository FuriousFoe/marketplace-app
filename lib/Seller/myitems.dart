// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:marketplace/const.dart';

class MyItems extends StatefulWidget {
  const MyItems({
    Key? key,
    required this.emails,
  }) : super(key: key);
  final String emails;

  @override
  State<MyItems> createState() => _MyItemsState();
}

class _MyItemsState extends State<MyItems> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('SellerUser')
          .doc(widget.emails)
          .collection('MyItems')
          .orderBy('Time', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: appbar("My Item List"),
            body: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // String reqid = snapshot.data!.docs[index].id;
                final reqdata =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;

                String product = reqdata['   '] ?? '';
                Timestamp timestamp = reqdata['Time'] ?? Timestamp.now();
                DateTime dateTime = timestamp.toDate();
                String formattedTime = DateFormat.yMd().format(dateTime);
                print(product);
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: const Color.fromARGB(255, 80, 80, 80),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      product,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Request date: $formattedTime',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
