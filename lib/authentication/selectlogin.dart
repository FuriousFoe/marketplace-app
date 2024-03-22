import 'package:flutter/material.dart';
import 'package:marketplace/Buyer/loginbuyer.dart';
import 'package:marketplace/Seller/loginseller.dart';

class SelectLogin extends StatefulWidget {
  const SelectLogin({
    super.key,
  });

  @override
  State<SelectLogin> createState() => _SelectLoginState();
}

class _SelectLoginState extends State<SelectLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const SizedBox(
                width: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginSeller()),
                    );
                  },
                  child: Container(
                    height: 35,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('Seller'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginBuyer()),
                    );
                  },
                  child: Container(
                    height: 35,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text('Buyer'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
