// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

import 'package:marketplace/Buyer/cart.dart';

class DetailProduct extends StatelessWidget {
  String title;
  String img1;
  String img2;
  String descp;
  double price;
  String merchant;
  DetailProduct({
    Key? key,
    required this.title,
    required this.img1,
    required this.img2,
    required this.descp,
    required this.price,
    required this.merchant,
  }) : super(key: key);

  // static List<String> Redchilli = [
  //   "https://cdn.shopify.com/s/files/1/0604/6345/products/Red_Chilli_Powder.jpg?v=1514273566",
  //   "https://kj1bcdn.b-cdn.net/media/82514/red-chili-pepper-765.jpg",
  //   "https://www.couponmoto.com/top-10/wp-content/uploads/2023/05/Best-Red-Chilli-Powder.png"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 249, 249),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(fontFamily: "Heading"),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.search_favorite,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart(cartItems: [],)));
            },
            icon: const Icon(
              CupertinoIcons.cart,
            ),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                height: 300,
              ),
              items: [img1, img2]
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
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(),
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10),
            child: Text(
              "Description",
              style: TextStyle(fontFamily: "Title", fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              descp,
              style: TextStyle(fontFamily: "Local_Font", fontSize: 18),
            ),
          ),
         Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text(
              "Merchant : ${merchant}",
              style: TextStyle(fontFamily: "Title", fontSize: 20),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Text(
                  "Price Details",
                  style: TextStyle(fontFamily: "Title", fontSize: 20),
                ),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '$price',
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Text(
                        "Per Kg ",
                        style: TextStyle(
                            fontFamily: "Title",
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
             
      CartItem cartItem = CartItem(
  title: title,
  imageUrl: img1,
  quantity: 1,
  price: price,
);
Navigator.push(
  context, 
  MaterialPageRoute(builder: (_) => Cart(cartItems: [cartItem])),
);
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.shade700),
              child: const Center(
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(
                      fontFamily: "Title", fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
