import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/Buyer/Spices/details.dart';


class Diwalispecific extends StatefulWidget {
  final String image;
  final String name;

  Diwalispecific({required this.image, required this.name});
  @override
  State<Diwalispecific> createState() => _SpecificState();
}

class _SpecificState extends State<Diwalispecific> {
  @override
  Widget build(BuildContext context) {
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 250,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(blurRadius: 2, blurStyle: BlurStyle.solid)
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
                              widget.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Price : 150 per KG",
                        style: TextStyle(fontFamily: "Title"),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.shade400,
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => DetailProduct(
                          //       title: widget.name,
                          //     ),
                          //   ),
                          // );
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
  }
}
