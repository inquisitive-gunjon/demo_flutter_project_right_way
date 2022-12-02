import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/ukrbd_response/Products.dart';
import 'package:flutter_sixvalley_ecommerce/helper/price_converter.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/rating_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductWidgetUkrbd extends StatelessWidget {
  final Products productModel;
  ProductWidgetUkrbd({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    // String ratting = productModel.rating != null && productModel.rating.length != 0? productModel.rating[0].average : "0";
    String ratting =  "5";

    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000),
          pageBuilder: (context, anim1, anim2) => ProductDetails(productId: productModel.id,slug: productModel.productName),
        ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width/1.5,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5)],
        ),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Product Image
            Container(
              height: MediaQuery.of(context).size.width/2.3,
              decoration: BoxDecoration(
                color: ColorResources.getIconBg(context),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder, fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width/2.45,
                  // image: '${Provider.of<SplashProvider>(context, listen: false).baseUrls.productThumbnailUrl}/${productModel.thumbnail}',
                  image: productModel.productImage!=null?'${productModel.productImage}':"https://ukrbd.com/images/products/433197228.jpg",
                  imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder_1x1,
                      fit: BoxFit.cover,height: MediaQuery.of(context).size.width/2.45),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.only(top :Dimensions.PADDING_SIZE_SMALL,bottom: 5, left: 5,right: 5),
              child: Container(

                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(productModel.productName ?? '', textAlign: TextAlign.center,
                          style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
                              fontWeight: FontWeight.w400), maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                      Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RatingBar(
                              rating: double.parse(ratting),
                              size: 18,
                            ),


                            // Text('(${productModel.reviewCount.toString() ?? 0})',
                            //     style: robotoRegular.copyWith(
                            //       fontSize: Dimensions.FONT_SIZE_SMALL,
                            //     )),

                            Text('4',
                                style: robotoRegular.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                )),
                          ]),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),


                      productModel.discount!= null && int.tryParse(productModel.discount) > 0 ?
                      Text(PriceConverter.convertPrice(context, int.tryParse(productModel.price).toDouble()),
                        style: titleRegular.copyWith(
                          color: ColorResources.getRed(context),
                          decoration: TextDecoration.lineThrough,

                          fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                        ),
                      ) : SizedBox.shrink(),
                      SizedBox(height: 2,),


                      Text(PriceConverter.convertPrice(context,
                          // int.tryParse(productModel.price).toDouble(), discountType: productModel.discountType,
                          int.tryParse(productModel.price).toDouble(), discountType: "percentage",
                          discount: int.tryParse(productModel.discount).toDouble()),
                        style: titilliumSemiBold.copyWith(color: ColorResources.getPrimary(context)),
                      ),



                    ],
                  ),
                ),
              ),
            ),
          ]),

          // Off

          int.tryParse(productModel.discount) > 0 ?
          Positioned(top: 0, left: 0, child: Container(
            height: 20,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            decoration: BoxDecoration(
              color: ColorResources.getPrimary(context),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),


            child: Center(
              child: Text(PriceConverter.percentageCalculation(context, int.tryParse(productModel.discount).toDouble(),
                  // int.tryParse(productModel.offerPrice).toDouble(), productModel.discountType),
                  int.tryParse(productModel.offerPrice).toDouble(), "percentage"),
                style: robotoRegular.copyWith(color: Theme.of(context).highlightColor,
                    fontSize: Dimensions.FONT_SIZE_SMALL),
              ),
            ),
          ),
          ) : SizedBox.shrink(),

        ]),
      ),
    );
  }
}
