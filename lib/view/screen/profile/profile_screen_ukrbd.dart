

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';


class ProfileScreenUkrbd extends StatefulWidget {
  const ProfileScreenUkrbd({Key key}) : super(key: key);

  @override
  _ProfileScreenUkrbdState createState() => _ProfileScreenUkrbdState();
}

class _ProfileScreenUkrbdState extends State<ProfileScreenUkrbd> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController=TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height*.7,
              width: size.width,
              color: Color(0xffffffff),
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16,top: 100,right: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: 100,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.account_box_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Account Information",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.add_location_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Addresses",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.checklist_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Your Orders",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.app_settings_alt_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Setting",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.account_box_outlined,size: Dimensions.ICON_SIZE_DEFAULT,color: Colors.black45,),
                            SizedBox(width: 16,),
                            Text("Log out",style: TextStyle(fontSize: Dimensions.FONT_SIZE_DEFAULT,color: Colors.black45),),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.account_box_outlined)
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.account_box_outlined)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          ClipPath(
            child: Container(
              height: size.height*.3,
              width: size.width,
              // color: Color(0xffce113b),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topRight,
                    colors: [
                      // Colors,
                      Color(0xff4caf50),
                      Color(0xffffeb3b),//Color(0xff4caf50)), ColorSwatch(primary value: Color(0xffffeb3b)
                      // Color(0xff4caf50),
                      // Colors.white
                    ],
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(onPressed: (){

                  }, icon: Icon(Icons.arrow_back,color: Colors.white,),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ClipRRect(borderRadius: BorderRadius.circular(50),
                      child:FadeInImage.assetNetwork(
                        placeholder: Images.placeholder, width: 50,
                        height: 50, fit: BoxFit.cover,
                        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLFlEKjQHLInSZGzlfwIAnCrqCOF3chDGhR6ZKfSw&s',
                        imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder,
                            width: 50, height: 50, fit: BoxFit.cover),
                      ),),
                  ),

                  //SizedBox(height: 10,),

                  TabBar(
                    controller: _tabController,
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      tabs: [
                    Tab(
                      child: Column(
                        children: [
                          Text("0"),
                          Text("My Wishlist",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Text("0"),
                          Text("Followed Stores",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ),
                    Tab(
                      child: Column(
                        children: [
                          Text("0"),
                          Text("Vouchers",style: TextStyle(fontSize: 10),),
                        ],
                      ),
                    ),
                  ])

                ],
              ),
              padding: EdgeInsets.all(9),

            ),
            clipper: MyClipper(),
          ),
        ],
      ),
    );
  }
}



class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double factor = 20.0;
    var path = Path();
    path.lineTo(0, size.height - factor);
    path.quadraticBezierTo(0, size.height, factor, size.height);
    path.lineTo(size.width-factor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - factor);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(factor, 0);
    // path.quadraticBezierTo(0, 0, 0, factor);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
