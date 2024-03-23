import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marketplace/Buyer/Spices/spices.dart';
import 'package:marketplace/Buyer/diwali/diwaliHome.dart';
import 'package:marketplace/Seller/listitems.dart';
import 'package:marketplace/Seller/myitems.dart';
import 'package:marketplace/const.dart';
import 'package:marketplace/onboard.dart';

class HomeSeller extends StatefulWidget {
  const HomeSeller({super.key});
  static const List<String> sampleImages = [
    "https://images.news18.com/ibnlive/uploads/2021/10/diwali-sweet-dishes.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkkdqiSu6mmvrny82ICy9ki_CmR80XqKg_4w&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJKmqF7iR7d3DFvzE9YwKUJ4psGluNMVLWRFxOYBWzO4YmoSBx6ZBKKwCB6GQqo0a5xlA&usqp=CAU"
  ];

  @override
  State<HomeSeller> createState() => _HomeSellerState();
}

final user = FirebaseAuth.instance.currentUser!;

String emailids = user.email.toString();

class _HomeSellerState extends State<HomeSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffffffff),
      backgroundColor: Color.fromARGB(255, 250, 249, 249),
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 250, 249, 249),
        automaticallyImplyLeading: false,
        leading: const Icon(
          CupertinoIcons.location_solid,
          color: Colors.red,
          size: 35,
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Godrej CreekSide Colony",
              style: TextStyle(
                fontFamily: "Title",
                fontSize: 20,
              ),
            ),
            Text(
              "Godrej CreekSide Colony,Vikhroli(East)",
              style: TextStyle(
                fontFamily: "Title_Thin",
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      endDrawer: const Drawers(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2,
                  ),
                ],
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    // CupertinoIcons.search,
                    Iconsax.search_normal,
                    color: Colors.red,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      child: const TextField(
                        // controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search : Cake",
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontFamily: "Local_font",
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.microphone,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "EXPLORE",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Local_Font",
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                optionContainer(context, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Spices())));
                }, "https://cdn.pixabay.com/photo/2012/04/05/00/41/peppers-25384_640.png",
                    "Spices"),
                optionContainer(context, () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => DiwaliHome())));
                }, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHZLhHZCC6ep8NjU6SaU5Py0xNt_tMpjl85g&usqp=CAU",
                    "Sweets "),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "WHAT'S ON YOUR MIND ",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Local_Font",
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SliderContainer("Mango Pickle",
                      "https://rukminim2.flixcart.com/image/750/900/k5lcvbk0/pickle-murabba/g/r/c/325-premium-mango-pickle-mason-jar-pickle-suruchi-original-imafnbbjknmrzdzt.jpeg?q=20&crop=false"),
                  SliderContainer("Carrot & Turnip",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9zYxU1PegpCwpQs46Zr047MkppCSa1zPQ_w&usqp=CAU"),
                  SliderContainer("lemon pickle",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmC62CWG4EeECJx72e6BDPwcKjOXgnXRc5nQ&usqp=CAU"),
                  SliderContainer("tomato pickle",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJV2WkVfKg7t0clN1iPVLjdO_xSNGz_FyNMg&usqp=CAU"),
                  SliderContainer("Green Chilli",
                      "https://www.aachifoods.com/data/products/green-chlli-pickle-1651902759-1.jpeg"),
                  SliderContainer("Cauliflower",
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQII6U5L5APouv5eOCxKrCfbX4IEmrA5Jxwjg&usqp=CAU"),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "BEST SELLERS",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Local_Font",
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 10)],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 290,
              width: 400,
              child: Column(
                children: [
                  CarouselSlider(
                    // disableGesture: false,
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      height: 200,
                    ),
                    items: HomeSeller.sampleImages
                        .map(
                          (item) => Container(
                            width: double.infinity,
                            height: 50,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: Image.network(
                                item.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Festive Items",
                        style: TextStyle(
                          fontFamily: "Local_Font",
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 48,
                        color: Colors.green,
                        child: const Center(
                            child: Text(
                          "4.4",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Title",
                          ),
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container SliderContainer(String name, String image) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(children: [
        SizedBox(
          height: 70,
          child: Image.network(
            image,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: "Title",
            color: Colors.black54,
          ),
        )
      ]),
    );
  }

  Widget optionContainer(
      BuildContext context, VoidCallback function, String image, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          margin: EdgeInsets.all(10),
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
              )
            ],
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                        fontFamily: "Local_Font",
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      "Selections",
                      style: TextStyle(
                        fontFamily: "Local_Font",
                        fontSize: 18,
                        color: Colors.black45,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.red,
                      ),
                      height: 15,
                      width: 25,
                      child: const Icon(
                        CupertinoIcons.arrow_right,
                        color: Colors.white,
                        size: 15,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Drawers extends StatefulWidget {
  const Drawers({super.key});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  String name = '';
  void getdata() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('SellerUser')
        .doc(emailids)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
      setState(() {
        // Update state variables with fetched user data
        name = userData['Name'];
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
    void signUserOut() async {
      FirebaseAuth.instance.signOut().then((value) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Welcome()));
      });
    }

    final user = FirebaseAuth.instance.currentUser!;
    String email = user.email.toString();

    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  "https://icon-library.com/images/profile-icon-vector/profile-icon-vector-7.jpg",
                ),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 182, 220, 238),
              ),
              accountName: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                email,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ListItems(emailid: email)));
              },
              child: listtile("List Items"),
            ),
            div,
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyItems(emails: emailids)));
              },
              child: listtile("My Items"),
            ),
            div,
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) =>  MyItems(emails: emailids)));
              },
              child: listtile("Your orders"),
            ),
            div,
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) =>  MyItems(emails: emailids)));
              },
              child: listtile("Favorite orders"),
            ),
            div,
            GestureDetector(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) =>  MyItems(emails: emailids)));
              },
              child: listtile("Order Address"),
            ),
            div,
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.red)),
              onPressed: () {
                signUserOut();
              },
              child: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ListTile listtile(String title) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 21,
        color: Colors.black87,
        fontFamily: "Nunito",
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
