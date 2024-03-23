import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marketplace/Buyer/Spices/specificSpices.dart';

class Spices extends StatelessWidget {
  const Spices({super.key});
  static const List<String> Redchilli = [
    "https://cdn.shopify.com/s/files/1/0604/6345/products/Red_Chilli_Powder.jpg?v=1514273566",
    "https://kj1bcdn.b-cdn.net/media/82514/red-chili-pepper-765.jpg",
    "https://www.couponmoto.com/top-10/wp-content/uploads/2023/05/Best-Red-Chilli-Powder.png"
  ];
  static const List<String> Haldi = [
    "https://arevafoodproducts.com/wp-content/uploads/2017/08/turmaric1.png",
    "https://mothercart.in/wp-content/uploads/2019/11/haldi_powder1-e1587370907706.jpg",
    "https://4.imimg.com/data4/TJ/VN/MY-32099850/haldi-powder-500x500.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 249, 249),
      body: SingleChildScrollView(
        child: Column(
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
                      "https://data.1freewallpapers.com/download/herbs-and-spices.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 30),
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
                const Positioned(
                  left: 110,
                  top: 100,
                  child: Text(
                    "SPICES",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Heading",
                      letterSpacing: 5,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
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
                    Iconsax.search_normal,
                    color: Colors.red,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: const TextField(
                        // controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search : Black Pepper",
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
            Text(
              "Essential Indian Spices",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 25,
                fontFamily: "Title",
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  diffrentSpicesContainer(
                    url:
                        "https://primalherb.com/wp-content/uploads/2018/01/How-Black-Pepper-Helps-Boost-Nutrient-Absorption.jpg",
                    name: "BLACK PEPPER",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://www.thespruceeats.com/thmb/Mqge5DTcfx4GW4OqB9_t_umH8hU=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1005356338-9430eb100dca4e37ae6a30a56fc47032.jpg",
                    name: "CINNAMON",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://elworldorganic.com/wp-content/uploads/2020/03/Cardamom-HD-Images-1024x683-1.jpg",
                    name: "Cardamom",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://tse3.mm.bing.net/th?id=OIP.EvS5lu_NC2H3tQjtkxQ8cgHaE8&pid=Api&P=0&h=180",
                    name: "Red Chilli",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://tse1.mm.bing.net/th?id=OIP.mELnGcbzSEL_xSNVXAk2vgHaEw&pid=Api&P=0&h=180",
                    name: "Haldi",
                    context: context,
                  ),
                ],
              ),
            ),
            Text(
              "Most Bought Product",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 25,
                fontFamily: "Title",
              ),
            ),
            mostBought(
                title: "Kashmiri Chili Powder",
                subtitle:
                    "Spice up your dishes with our tantalizing chili powder, delivering a fiery burst of flavor that ignites the senses with every bite!",
                list: Redchilli),
            mostBought(
                title: "Apna Turmeric Powder",
                subtitle:
                    "Add a golden touch to your culinary creations with our premium Turmeric Powder, boasting vibrant color and robust flavor that elevates dishes to new heights",
                list: Haldi),
          ],
        ),
      ),
    );
  }

  Container mostBought({
    required String title,
    required String subtitle,
    required List list,
  }) {
    return Container(
      height: 300,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 0.2)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CarouselSlider(
                // disableGesture: false,
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  height: 200,
                ),
                items: list
                    .map(
                      (item) => Container(
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
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
              const Positioned(
                left: 300,
                top: 15,
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Iconsax.heart,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        CupertinoIcons.share,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Heading",
                    fontSize: 22,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 20,
                width: 40,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    "4.5",
                    style: TextStyle(fontFamily: "Title", color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              subtitle,
              style: TextStyle(
                fontFamily: "Local_Font",
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget diffrentSpicesContainer(
      {required String url,
      required String name,
      required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Specific(
              name: name,
              image: url,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey.shade300)],
          color: const Color.fromARGB(255, 250, 249, 249),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 150,
        width: 150,
        child: Column(
          children: [
            Container(
              height: 120,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontFamily: "Title"),
            )
          ],
        ),
      ),
    );
  }
}
