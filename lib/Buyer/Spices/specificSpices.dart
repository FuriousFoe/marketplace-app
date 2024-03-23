import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marketplace/Buyer/Spices/details.dart';

class Specific extends StatefulWidget {
  final String image;
  final String name;

  Specific({required this.image, required this.name});
  @override
  State<Specific> createState() => _SpecificState();
}

class _SpecificState extends State<Specific> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Spices').where('Product', isEqualTo: widget.name).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: const Color.fromARGB(255, 250, 249, 249),
              body: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 280,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 15,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, top: 30),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color.fromARGB(240, 255, 255, 255),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.arrow_left,
                          ),
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        left: 110,
                        top: 200,
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Heading",
                            letterSpacing: 5,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        String reqid = snapshot.data!.docs[index].id;
                        final reqdata = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;

                        String image1 = reqdata['Image1'] ?? '';
                        String image2 = reqdata['Image2'] ?? '';
                        String description = reqdata['Description'] ?? '';
                        String merchant = reqdata['Merchant Name'] ?? '';
                        double price = reqdata['Price'] ?? 0.0;
                        Timestamp timestamp =
                            reqdata['Time'] ?? Timestamp.now();
                        DateTime dateTime = timestamp.toDate();
                        String formattedTime =
                            DateFormat.yMd().format(dateTime);

                        return Container(
                          height: 250,
                          width: 100,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 2, blurStyle: BlurStyle.solid)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  margin: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      image1,

                                      // "https://cdn.shopaccino.com/refresh/articles/shutterstock277819244-825558_l.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Price : $price per KG",
                                style: TextStyle(fontFamily: "Title"),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                    (states) => Colors.grey.shade400,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailProduct(
                                        title: widget.name,
                                        img1: image1,
                                        img2: image2,
                                        descp: description,
                                        price: price,
                                        merchant: merchant ,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "View",
                                  style: TextStyle(
                                      color: Colors.black, fontFamily: "Title"),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
