import 'package:flutter/material.dart';

class ProductDetailsScreenUkrbd extends StatelessWidget {
  const ProductDetailsScreenUkrbd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        //leading: Icon(Icons.arrow_back),
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Image.network(
                  "https://static-01.daraz.com.bd/p/bcc815f79930e54314347eccf70915ae.jpg",
                  width: 300,
                  height: 300,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white60,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SarsMENS SHOES\n(M737727YK-Yellow)",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        Row(
                          children: [
                            Icon(Icons.heart_broken_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.share)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '৳670.0 ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                text: '৳720.0',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black38,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Flat ৳50.0 OFF ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '5.0 ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: 10,
                        ),
                        //stars
                        Row(
                          children: [
                            Icon(
                              Icons.star_rate_sharp,
                              color: Colors.green,
                            ),
                            Icon(
                              Icons.star_rate_sharp,
                              color: Colors.green,
                            ),
                            Icon(
                              Icons.star_rate_sharp,
                              color: Colors.green,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.green,
                            ),
                            Icon(
                              Icons.star_border,
                              color: Colors.green,
                            ),
                          ],
                        ),

                        SizedBox(
                          width: 20,
                        ),

                        Text.rich(
                          TextSpan(
                            text: '| 0 Ratings',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),

                    // size buttons

                    Row(
                      children: [

                        SizeButton(),
                        SizeButton(),
                        SizeButton(),
                        SizeButton(),

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Center(child: Text("-", style: TextStyle(
                                fontSize: 20,
                              ),),),
                            ),

                            // SizedBox(width: 20,),
                            SizedBox(
                              width: 22.0,
                              height: 20.0,
                              child: const DecoratedBox(
                                decoration: const BoxDecoration(
                                    color: Colors.red
                                ),
                              ),
                            ),
                            Text("1"),
                            SizedBox(
                              width: 22.0,
                              height: 20.0,
                              child: const DecoratedBox(
                                decoration: const BoxDecoration(
                                    color: Colors.red
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),

                              child: Center(child: Text("+", style: TextStyle(
                                fontSize: 20,
                              ),),),
                            ),
                          ],
                        )

                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SizeButton extends StatelessWidget {
  const SizeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          primary: Colors.white,
          shadowColor: Colors.black,

        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text.rich(
                TextSpan(
                  text: 'S',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: '670.0',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.orange,
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: '720.0',
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.normal,
                    color: Colors.black38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
