import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/checkout/widget/DeliveryDetails.dart';
// import 'package:flutter_sixvalley_ecommerce/view/screen/checkout/DeliveryDetails.dart';

class CheckoutUkrbd extends StatelessWidget {
  const CheckoutUkrbd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
        title: const Text("Checkout",
        style: TextStyle(
          color: Colors.black
        ),),
        backgroundColor: Colors.white70,

      ),
      body: ListView(
        children: [
            DeliveryDetails(),

        ],
      ),
    );
  }
}
