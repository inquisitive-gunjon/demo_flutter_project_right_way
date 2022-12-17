

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/ukrbd/produuct_model.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_wise_product_provider_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_widget_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen_ukrbd.dart';
import 'package:provider/provider.dart';

class CategoryWiseProductViewWidget extends StatefulWidget {
  String id;
  String title;
  bool reload;
  CategoryWiseProductViewWidget({Key key,this.id,this.title,this.reload}) : super(key: key);

  @override
  State<CategoryWiseProductViewWidget> createState() => _CategoryWiseProductViewWidgetState();
}

class _CategoryWiseProductViewWidgetState extends State<CategoryWiseProductViewWidget> {

  List<Data> categoryWiseProductList=[];

  @override
  void initState() {
    _load(widget.reload,context);
    // TODO: implement initState
    super.initState();
  }

  _load(bool reload,BuildContext context)async{
    //Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).clear();
    categoryWiseProductList= await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductListForHomePage(reload, context, widget.id);
  }

  @override
  Widget build(BuildContext context) {

    // CategoryWiseProductViewWidget(id: "76",title: "Men's Fashion",),
    // CategoryWiseProductViewWidget(id: "80",title: "Ladies Fashion",),
    // CategoryWiseProductViewWidget(id: "55",title: "Computer & IT",),
    // CategoryWiseProductViewWidget(id: "71",title: "Mobile",),
    // CategoryWiseProductViewWidget(id: "78",title: "Fragrances",),
    // CategoryWiseProductViewWidget(id: "75",title: "Networking",),
    // CategoryWiseProductViewWidget(id: "79",title: "kids Fashion",),
    // CategoryWiseProductViewWidget(id: "74",title: "Health & Herbs",),
    // CategoryWiseProductViewWidget(id: "52",title: "Stationery & Office",),
    // CategoryWiseProductViewWidget(id: "56",title: "Electrical & Lighting",),
    // CategoryWiseProductViewWidget(id: "58",title: "Electronics & Appliances",),
    // CategoryWiseProductViewWidget(id: "63",title: "Robotics and Artificial Intelligence",),
    // CategoryWiseProductViewWidget(id: "58",title: "Electronics & Appliances",),
    // CategoryWiseProductViewWidget(id: "63",title: "Robotics and Artificial Intelligence",),
    // CategoryWiseProductViewWidget(id: "65",title: "Lab Equipment",),
    // CategoryWiseProductViewWidget(id: "66",title: "Furniture",),
    // CategoryWiseProductViewWidget(id: "69",title: "Software Service & Solution",),
    // CategoryWiseProductViewWidget(id: "81",title: "Comforter",),
    // CategoryWiseProductViewWidget(id: "82",title: "Winter Collection",),


    return Column(
      children: [
        categoryWiseProductList.length>0 ?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Padding(
            padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
            child: CustomTitleRow(title: getTranslated(widget.title, context),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => BrandAndCategoryProductScreenUkrbd(
                    isBrand: false,
                    id: widget.id,
                    name: widget.title,
                    isSubcategory: false,
                    isHome: true,
                    productsList: categoryWiseProductList,
                  )));
                }),
          ),
        ):SizedBox.shrink(),

        Padding(
          padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
          child: Column(
              children: [
                categoryWiseProductList.length!=0?
                Container(
                  height: MediaQuery.of(context).size.width/1.45,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryWiseProductList.length,
                      itemBuilder: (ctx,index){
                        return Container(width: (MediaQuery.of(context).size.width/2.06)-20,
                            child: ProductWidgetUkrbd(productModel: categoryWiseProductList[index]));
                      }
                  ),
                ): ProductShimmer(isHomePage: true ,isEnabled: true),
              ]
          ),
        ),
      ],
    );
  }
}
