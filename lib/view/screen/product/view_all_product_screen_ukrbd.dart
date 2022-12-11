import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';

import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/products_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/products_view_ukrbd.dart';
import 'package:provider/provider.dart';

class AllProductScreenUkrbd extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ProductType productType;
  AllProductScreenUkrbd({@required this.productType});

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,



      appBar: AppBar(



        backgroundColor: Provider.of<ThemeProvider>(context).darkTheme ?
        Colors.black : Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5), bottomLeft: Radius.circular(5))),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, size: 20,
            color: ColorResources.WHITE),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(productType == ProductType.MENS_FASHION_PRODUCT ?
        "Men's Fashion ":productType == ProductType.MOBILE_PRODUCT?'Mobile':'Latest Product',
            style: titilliumRegular.copyWith(fontSize: 20, color: ColorResources.WHITE)),



      ),

      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            return true;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: ProductViewUkrbd(isHomePage: false , productType: productType, scrollController: _scrollController),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
