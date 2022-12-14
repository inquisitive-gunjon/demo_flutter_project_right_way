import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_wise_product_provider_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/sub_category_wise_product_provider_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_widget_ukrbd.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class BrandAndCategoryProductScreenUkrbd extends StatefulWidget {
  final bool isBrand;
  final bool isSubcategory;
  final String id;
  final String name;
  final String image;
  // final List<Data> productsList;
  BrandAndCategoryProductScreenUkrbd({@required this.isBrand, @required this.id, @required this.name, this.image,this.isSubcategory});

  @override
  State<BrandAndCategoryProductScreenUkrbd> createState() => _BrandAndCategoryProductScreenUkrbdState();
}

class _BrandAndCategoryProductScreenUkrbdState extends State<BrandAndCategoryProductScreenUkrbd> {




  _load(BuildContext context, bool reload)async{
    print(widget.id);
    !widget.isSubcategory?await Provider.of<SubCategoryWiseProductProviderUkrbd>(context, listen: false).getSubCategoryWiseProductList(reload, context, widget.id):await Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).getCategoryWiseProductList(reload, context,widget.id);

  }
//CategoryWiseProductProviderUkrbd


  @override
  Widget build(BuildContext context) {
    _load(context,true);
    //Provider.of<ProductProvider>(context, listen: false).initBrandOrCategoryProductList(isBrand, id, context);
    return !widget.isSubcategory?WillPopScope(
      onWillPop: (){
        Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).clear();
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: ColorResources.getIconBg(context),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

         // CustomAppBar(title: widget.name,onBackPressed: (){
         //
         // },),
      Consumer<CategoryWiseProductProviderUkrbd>(
      builder: (context,categoryWiseProductProviderUkrbd,child){
          return CustomAppBar(title: widget.name,onBackPressed: (){
            categoryWiseProductProviderUkrbd.clear();
            Navigator.of(context).pop();
          },);}),



          // widget.isBrand ? Container(height: 100,
          //   padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
          //   margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
          //   color: Theme.of(context).highlightColor,
          //   child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //     FadeInImage.assetNetwork(
          //       placeholder: Images.placeholder, width: 80, height: 80, fit: BoxFit.cover,
          //       image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.brandImageUrl}/${widget.image}',
          //       imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, width: 80, height: 80, fit: BoxFit.cover),
          //     ),
          //     SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
          //
          //
          //     Text(widget.name, style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
          //   ]),
          // ) : SizedBox.shrink(),

          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

          // Products
          // productProvider.brandOrCategoryProductList.length > 0 ? Expanded(
          Consumer<CategoryWiseProductProviderUkrbd>(
              builder: (context,categoryWiseProductProviderUkrbd,child){
                print("product list :::::::::::::::${categoryWiseProductProviderUkrbd.categoryWiseProductList.length}");
            return categoryWiseProductProviderUkrbd.categoryWiseProductList.length > 0 ? Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                physics: BouncingScrollPhysics(),
                crossAxisCount: 2,
                itemCount: categoryWiseProductProviderUkrbd.categoryWiseProductList.length,
                shrinkWrap: true,
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                itemBuilder: (BuildContext context, int index) {
                  print("print product");
                  return ProductWidgetUkrbd(productModel: categoryWiseProductProviderUkrbd.categoryWiseProductList[index]);
                  // return null;
                  },
              ),
            ) :

            // Expanded(child: Center(child: productProvider.hasData ?
            Expanded(child: Center(child: categoryWiseProductProviderUkrbd.categoryWiseProductList.length==0?

            ProductShimmer(isHomePage: false,
                isEnabled: Provider.of<ProductProvider>(context).brandOrCategoryProductList.length == 0)
                : NoInternetOrDataScreen(isNoInternet: false),
            ));
              }
          ),

        ]),
      ),
    ):WillPopScope(
    onWillPop: (){
    Provider.of<CategoryWiseProductProviderUkrbd>(context, listen: false).clear();
    Navigator.of(context).pop();
    },
    child: Scaffold(
    backgroundColor: ColorResources.getIconBg(context),
    body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [

    // CustomAppBar(title: widget.name,onBackPressed: (){
    //
    // },),
    Consumer<CategoryWiseProductProviderUkrbd>(
    builder: (context,categoryWiseProductProviderUkrbd,child){
    return CustomAppBar(title: widget.name,onBackPressed: (){
    categoryWiseProductProviderUkrbd.clear();
    Navigator.of(context).pop();
    },);}),



    // widget.isBrand ? Container(height: 100,
    //   padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
    //   margin: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
    //   color: Theme.of(context).highlightColor,
    //   child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
    //     FadeInImage.assetNetwork(
    //       placeholder: Images.placeholder, width: 80, height: 80, fit: BoxFit.cover,
    //       image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.brandImageUrl}/${widget.image}',
    //       imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, width: 80, height: 80, fit: BoxFit.cover),
    //     ),
    //     SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
    //
    //
    //     Text(widget.name, style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE)),
    //   ]),
    // ) : SizedBox.shrink(),

    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

    // Products
    // productProvider.brandOrCategoryProductList.length > 0 ? Expanded(
    Consumer<CategoryWiseProductProviderUkrbd>(
    builder: (context,categoryWiseProductProviderUkrbd,child){
    print("product list :::::::::::::::${categoryWiseProductProviderUkrbd.categoryWiseProductList.length}");
    return categoryWiseProductProviderUkrbd.categoryWiseProductList.length > 0 ? Expanded(
    child: StaggeredGridView.countBuilder(
    padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
    physics: BouncingScrollPhysics(),
    crossAxisCount: 2,
    itemCount: categoryWiseProductProviderUkrbd.categoryWiseProductList.length,
    shrinkWrap: true,
    staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
    itemBuilder: (BuildContext context, int index) {
    print("print product");
    return ProductWidgetUkrbd(productModel: categoryWiseProductProviderUkrbd.categoryWiseProductList[index]);
    // return null;
    },
    ),
    ) :

    // Expanded(child: Center(child: productProvider.hasData ?
    Expanded(child: Center(child: categoryWiseProductProviderUkrbd.categoryWiseProductList.length==0?

    ProductShimmer(isHomePage: false,
    isEnabled: Provider.of<ProductProvider>(context).brandOrCategoryProductList.length == 0)
        : NoInternetOrDataScreen(isNoInternet: false),
    ));
    }
    ),

    ]),
    ),
    );
  }
}