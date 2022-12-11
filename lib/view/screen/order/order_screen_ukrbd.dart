import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';

class OrderScreenUkrbd extends StatefulWidget {
  const OrderScreenUkrbd({Key key}) : super(key: key);

  @override
  State<OrderScreenUkrbd> createState() => _OrderScreenUkrbdState();
}

class _OrderScreenUkrbdState extends State<OrderScreenUkrbd> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController =TabController(length: 5, vsync: this);
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
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 24,),
          Ink(
            height: 50,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                // IconButton(
                //   onPressed: (){
                //
                //   },
                //   icon: icon,
                // ),
                Text("Orders",style: TextStyle(fontSize: 25),)
              ],
            ),
          ),
      SizedBox(
        width: 800,
        child: TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Theme.of(context).primaryColor,
          indicatorColor: Theme.of(context).primaryColor,
          tabs: [
            Tab(
              icon: Text("vendor 1"),
            ),
            Tab(
              icon: Text("vendor 2"),
            ),
            Tab(
              icon: Text("vendor 3"),
            ),
            Tab(
              icon: Text("vendor 4"),
            ),
            Tab(
              icon: Text("vendor 5"),
            ),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      Expanded(
        child: TabBarView(
          children: [
            OrderInfoWidget(),
            OrderInfoWidget(),
            OrderInfoWidget(),
            OrderInfoWidget(),
            OrderInfoWidget(),
          ],
          controller: _tabController,
        ),
      ),
        ],
      ),
    );
  }
}

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      //height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text("Orders in progress",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
          SizedBox(
            height: 16,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderList.length,
            itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              height: size.width*.3,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,//ColorResources.getIconBg(context),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${orderList[index].invoiceNumber}"),
                      Text("${orderList[index].productName}",style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                      Text("${orderList[index].date}"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${orderList[index].productPrice}",style: TextStyle(fontSize: 20),),
                      Text("${orderList[index].productStatus}"),
                    ],
                  )
                ],
              ),
            );
          },
          ),
          SizedBox(
            height: 16,
          ),
          Text("Previous orders",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class OrderInfo{
  String invoiceNumber;
  String productName;
  String date;
  String productPrice;
  String productStatus;
  OrderInfo({this.invoiceNumber,this.productName,this.date,this.productPrice,this.productStatus});
}

List<OrderInfo> orderList=[
  OrderInfo(
    invoiceNumber: "hye643734gh",
    productName: "product name one",
    date: "12-02-2022",
    productPrice: "\$234.0",
    productStatus: "INITIATED",
  ),
  OrderInfo(
    invoiceNumber: "hye643734gh",
    productName: "product name one",
    date: "12-02-2022",
    productPrice: "\$234.0",
    productStatus: "INITIATED",
  ),
  OrderInfo(
    invoiceNumber: "hye643734gh",
    productName: "product name one",
    date: "12-02-2022",
    productPrice: "\$234.0",
    productStatus: "INITIATED",
  ),
  OrderInfo(
    invoiceNumber: "hye643734gh",
    productName: "product name one",
    date: "12-02-2022",
    productPrice: "\$234.0",
    productStatus: "INITIATED",
  ),
];

