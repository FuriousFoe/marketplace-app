import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CartItem {
  final String? title;
  final String? imageUrl;
  int quantity;
  final double? price;

  CartItem({this.title, this.imageUrl, required this.quantity, this.price});
}

class Cart extends StatefulWidget {
  final List<CartItem> cartItems;

  const Cart({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<Cart> {
  static const platform = MethodChannel("razorpay_flutter");

  var _razorpay = Razorpay();

  double tot = 0;
  double _calculateTotalPrice() {
    double total = 0.0;
    for (var item in widget.cartItems) {
      total += item.price! * item.quantity!;
    }
    tot = total;
    return total;
  }

  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); 
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userID = user.uid;
      String userEmail = user.email ?? '';

      FirebaseFirestore.instance.collection('payment').add({
        'userID': userID,
        'email': userEmail,
        'amount': tot.toInt(),
        'paymentId': response.paymentId,
        'orderId': response.orderId,
        'signature': response.signature,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    
  }

  void _handleExternalWallet(ExternalWalletResponse response) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontFamily: "Title",
          ),
        ),
        centerTitle: true,
        leadingWidth: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length + 1, 
              itemBuilder: (context, index) {
                if (index == widget.cartItems.length) {
                  // Total price row
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Total Price: \$${_calculateTotalPrice().toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Title"),
                    ),
                  );
                }

                final item = widget.cartItems[index];

                return Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: ListTile(
                    leading: Image.network(item.imageUrl!),
                    title: Text(
                      item.title!,
                      style: const TextStyle(
                          fontFamily: "Title", color: Colors.white),
                    ),
                    subtitle: Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (item.quantity! > 1) {
                                item.quantity--;
                              }
                            });
                          },
                        ),
                        Text(
                          item.quantity.toString(),
                          style: const TextStyle(
                            fontFamily: "Title",
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          splashColor: Colors.grey,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            shadows: [Shadow(blurRadius: 2)],
                          ),
                          onPressed: () {
                            setState(() {
                              item.quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${(item.price! * item.quantity!).toStringAsFixed(2)}',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                widget.cartItems.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () async {
              print("Rohit");
              var options = {
                'key': 'rzp_test_PMus03fof49LEI',
                'amount': tot.toInt() * 100,
                'name': 'Herbal Foods',
                'description': 'Best Spices ',
                'prefill': {
                  'contact': '8888888888',
                  'email': 'test@razorpay.com'
                }
              };
              _razorpay.open(options);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "BUY",
                  style: TextStyle(fontSize: 20, fontFamily: "Title"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Cart(
      cartItems: [
        CartItem(
          title: 'Product 1',
          imageUrl:
              'https://arevafoodproducts.com/wp-content/uploads/2017/08/turmaric1.png',
          quantity: 1,
          price: 10.0,
        ),
        CartItem(
          title: 'Product 2',
          imageUrl:
              'https://4.imimg.com/data4/TJ/VN/MY-32099850/haldi-powder-500x500.jpg',
          quantity: 2,
          price: 15.0,
        ),
      
      ],
    ),
  ));
}
