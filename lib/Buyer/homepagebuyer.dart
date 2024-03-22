import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marketplace/onboard.dart';

class HomeBuyer extends StatelessWidget {
  const HomeBuyer({super.key});
  static const List<String> sampleImages = [
    "https://tse1.mm.bing.net/th?id=OIP.OVMeOa7Eg5FUSS7HY2T6jQHaEK&pid=Api&P=0&h=180",
    "https://tse1.mm.bing.net/th?id=OIP.8Vs97UHkZ8jcgPgTTKYvRgHaEk&pid=Api&P=0&h=180",
    "https://www.foodfirefriends.com/wp-content/uploads/2019/11/how-long-to-grill-chicken-1200-750x417.jpeg"
  ];

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
                optionContainer(context),
                optionContainer(context),
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
                  SliderContainer(),
                  SliderContainer(),
                  SliderContainer(),
                  SliderContainer(),
                  SliderContainer(),
                  SliderContainer(),
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
                    items: sampleImages
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
                        "Chicken Grill",
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

  Container SliderContainer() {
    return Container(
      margin: EdgeInsets.all(10),
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
            "https://www.pngall.com/wp-content/uploads/2016/05/Pizza-Free-PNG-Image.png",
          ),
        ),
        const Text(
          "PIZZA",
          style: TextStyle(
            fontSize: 15,
            fontFamily: "Title",
            color: Colors.black54,
          ),
        )
      ]),
    );
  }

  Widget optionContainer(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: ((context) => Spices())));
        },
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
                    const Text(
                      "Gourment",
                      style: TextStyle(
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
                  "https://static.vecteezy.com/system/resources/previews/003/059/231/non_2x/realistic-cake-pastry-on-white-background-vector.jpg",
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

class Drawers extends StatelessWidget {
  const Drawers({super.key});

  @override
  Widget build(BuildContext context) {
    void signUserOut() async {
      FirebaseAuth.instance.signOut().then((value) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const Welcome()));
      });
    }

    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
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
                // user.displayName!,
                "Manoj Pandey",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "sahildongre01@gcom",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
