import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marketplace/Buyer/diwali/diwalispecific.dart';


class DiwaliHome extends StatelessWidget {
  const DiwaliHome({super.key});
  static const List<String> Shankarpali = [
    "https://img-global.cpcdn.com/recipes/ab4af71b0d69bc61/680x482cq70/sweet-shankarpali-recipe-main-photo.jpg",
    "https://www.gayatriskitchen.com/wp-content/uploads/2020/11/shankarpali4.jpeg",
    "https://tse4.mm.bing.net/th?id=OIP.TkkBrdEeCiABo4ryVWk04QHaEO&pid=Api&P=0&h=180"
  ];
  static const List<String> Boondiladoo = [
    "https://c.ndtvimg.com/2021-03/d4bkvgro_boondi-ladoo_625x300_25_March_21.jpg",
    "https://i.pinimg.com/originals/b5/05/08/b50508b068c3f77ef45de9989af7bed2.jpg",
    "https://cookingfromheart.com/wp-content/uploads/2019/10/Boondi-Laddu-1.jpg"
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
                      "https://hirasweets.com/wp-content/uploads/2020/11/Master.jpg",
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
                // const Positioned(
                //   left: 110,
                //   top: 100,
                //   child: Text(
                //     "SPICES",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontFamily: "Heading",
                //       letterSpacing: 5,
                //       fontSize: 40,
                //     ),
                //   ),
                // ),
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
                          hintText: "Search : Ladu",
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
              "Festive Delightful Treats",
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
                        "https://foodiewish.com/wp-content/uploads/2020/08/Besan-Ke-Laddu-Recipe-758x600.jpg",
                    name: "LADU",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://aartimadan.com/wp-content/uploads/2019/10/Rava-ladoo-3.jpg",
                    name: "Rava Ladoo",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://maunikagowardhan.co.uk/wp-content/uploads/2016/03/Maharashtrian-Karanji.jpg",
                    name: "Karanji",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://recipes.timesofindia.com/thumb/61579273.cms?imgsize=462357&width=800&height=800",
                    name: "Chivda",
                    context: context,
                  ),
                  diffrentSpicesContainer(
                    url:
                        "https://shwetainthekitchen.com/wp-content/uploads/2020/11/Chakli-768x1152.jpg",
                    name: "Chakli",
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
                title: "Shankarpali",
                subtitle:
                    "Spice up your dishes with our tantalizing chili powder, delivering a fiery burst of flavor that ignites the senses with every bite!",
                list: Shankarpali,
                context: context),
            mostBought(
                title: "Boondi Ladoo",
                subtitle:
                    "Add a golden touch to your culinary creations with our premium Turmeric Powder, boasting vibrant color and robust flavor that elevates dishes to new heights",
                list: Boondiladoo,
                context: context),
          ],
        ),
      ),
    );
  }

  Widget mostBought(
      {required String title,
      required String subtitle,
      required List list,
      required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Diwalispecific(
              name: title,
              image:
                  "https://www.gayatriskitchen.com/wp-content/uploads/2020/11/shankarpali4.jpeg",
            ),
          ),
        );
      },
      child: Container(
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
                      style:
                          TextStyle(fontFamily: "Title", color: Colors.white),
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
            builder: (context) => Diwalispecific(
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
