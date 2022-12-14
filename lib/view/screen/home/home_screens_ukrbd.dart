import 'package:flutter/material.dart';

import 'package:flutter_sixvalley_ecommerce/helper/product_type.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/provider/flash_deal_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/button/custom_text_button.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/custom_title_row.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/category/all_category_screen_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/announcement.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/banners_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/banners_view_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/category_view_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/footer_banner.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/latest_product_view.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/home/widget/mens_fashion_product_view.dart.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/view_all_product_screen_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/search/search_screen.dart';
import 'package:provider/provider.dart';


class HomePageUkrbd extends StatefulWidget {
  @override
  State<HomePageUkrbd> createState() => _HomePageUkrbdState();
}

class _HomePageUkrbdState extends State<HomePageUkrbd> {
  final ScrollController _scrollController = ScrollController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<BannerProvider>(context, listen: false).getBannerList(reload, context);
    Provider.of<BannerProvider>(context, listen: false).getFooterBannerList(context);
    Provider.of<BannerProvider>(context, listen: false).getMainSectionBanner(context);
    Provider.of<CategoryProviderUkrbd>(context, listen: false).getCategoryList(reload, context);
    //Provider.of<HomeCategoryProductProvider>(context, listen: false).getHomeCategoryProductList(reload, context);
    //Provider.of<TopSellerProvider>(context, listen: false).getTopSellerList(reload, context);
    //Provider.of<BrandProvider>(context, listen: false).getBrandList(reload, context);
    Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, context, reload: reload);
    Provider.of<ProductProvider>(context, listen: false).getFeaturedProductList('1', context, reload: reload);
    //Provider.of<FeaturedDealProvider>(context, listen: false).getFeaturedDealList(reload, context);
    Provider.of<ProductProvider>(context, listen: false).getLProductList('1', context, reload: reload);
    Provider.of<ProductProvider>(context, listen: false).getRecommendedProduct(context);
  }

  void passData(int index, String title) {
    index = index;
    title = title;
  }

  bool singleVendor = false;
  @override
  void initState() {
    super.initState();

    singleVendor = Provider.of<SplashProvider>(context, listen: false).configModel.businessMode == "single";
    Provider.of<FlashDealProvider>(context, listen: false).getMegaDealList(true, context, true);

    _loadData(context, false);

    // if(Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
    //   Provider.of<CartProvider>(context, listen: false).uploadToServer(context);
    //   Provider.of<CartProvider>(context, listen: false).getCartDataAPI(context);
    // }else {
    //   Provider.of<CartProvider>(context, listen: false).getCartData();
    // }
  }


  @override
  Widget build(BuildContext context) {


    List<String> types =[getTranslated('new_arrival', context),getTranslated('top_product', context), getTranslated('best_selling', context),  getTranslated('discounted_product', context)];
    return Scaffold(
      // backgroundColor: ColorResources.getHomeBg(context),
      backgroundColor: Colors.grey.shade50,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).primaryColor,
          onRefresh: () async {
            await _loadData(context, true);
            await Provider.of<FlashDealProvider>(context, listen: false).getMegaDealList(true, context, false);
            return true;
          },
          child: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // App Bar
                  // SliverAppBar(
                  //   floating: true,
                  //   elevation: 0,
                  //   centerTitle: false,
                  //   automaticallyImplyLeading: false,
                  //   backgroundColor: Theme.of(context).highlightColor,
                  //   title: Image.asset(Images.logo_with_name_image, height: 35),
                  //   actions: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(right: 12.0),
                  //       child: IconButton(
                  //         onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
                  //         },
                  //         icon: Stack(clipBehavior: Clip.none, children: [
                  //           Image.asset(
                  //             Images.cart_arrow_down_image,
                  //             height: Dimensions.ICON_SIZE_DEFAULT,
                  //             width: Dimensions.ICON_SIZE_DEFAULT,
                  //             color: ColorResources.getPrimary(context),
                  //           ),
                  //           Positioned(top: -4, right: -4,
                  //             child: Consumer<CartProvider>(builder: (context, cart, child) {
                  //               return CircleAvatar(radius: 7, backgroundColor: ColorResources.RED,
                  //                 child: Text(cart.cartList.length.toString(),
                  //                     style: titilliumSemiBold.copyWith(color: ColorResources.WHITE, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                  //                     )),
                  //               );
                  //             }),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //
                  //
                  //   ],
                  // ),
                  // Search Button
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverDelegate(
                      child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen())),
                        child: Container(padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.HOME_PAGE_PADDING, vertical: Dimensions.PADDING_SIZE_SMALL),
                          color: ColorResources.getHomeBg(context),
                          alignment: Alignment.center,
                          child: Container(padding: EdgeInsets.only(
                            left: Dimensions.HOME_PAGE_PADDING, right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                            top: Dimensions.PADDING_SIZE_EXTRA_SMALL, bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          ),
                            height: 60, alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(color: Theme.of(context).cardColor,
                              boxShadow: [BoxShadow(color: Colors.grey[Provider.of<ThemeProvider>(context).darkTheme ?
                              900 : 200], spreadRadius: 1, blurRadius: 1)],
                              // border: Border.all(color: Color(0xff242424)),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),),
                            child: Row(mainAxisAlignment : MainAxisAlignment.start, children: [

                              // Container(
                              //   width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                              //     borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))
                              // ),
                              //   child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
                              // ),
                              // Icon(Icons.search, color: Theme.of(context).primaryColor, size: Dimensions.ICON_SIZE_LARGE),
                              // Icon(Icons.search, color: ColorResources.getArrowButtonColor(context), size: Dimensions.ICON_SIZE_LARGE),
                              Icon(Icons.search, color: ColorResources.getArrowButtonColor(context), size: Dimensions.ICON_SIZE_DEFAULT),
                              Text(getTranslated('SEARCH_HINT', context),
                                style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
                              ),

                              // Container(
                              //   width: 40,height: 40,decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                              //     borderRadius: BorderRadius.all(Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL))
                              // ),
                              //   child: Icon(Icons.search, color: Theme.of(context).cardColor, size: Dimensions.ICON_SIZE_SMALL),
                              // ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(Dimensions.HOME_PAGE_PADDING,
                          Dimensions.PADDING_SIZE_SMALL, Dimensions.PADDING_SIZE_DEFAULT, Dimensions.PADDING_SIZE_SMALL  ),
                      child: Column(
                        children: [
                          BannersViewUkrbd(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                              child: Text(getTranslated('CATEGORY', context), style: titleHeader),
                              // TitleRow(title: getTranslated('CATEGORY', context),
                              //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreen()))),
                            ),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                            child: CategoryViewUkrbd(isHomePage: true),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTextButton(title: getTranslated('CATEGORY', context,),
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AllCategoryScreenUkrbd()))),
                          ),

                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                          //
                          //
                          // // Mega Deal
                          // Consumer<FlashDealProvider>(
                          //   builder: (context, flashDeal, child) {
                          //     return  (flashDeal.flashDeal != null && flashDeal.flashDealList != null
                          //         && flashDeal.flashDealList.length > 0)
                          //         ? TitleRow(title: getTranslated('flash_deal', context),
                          //             eventDuration: flashDeal.flashDeal != null ? flashDeal.duration : null,
                          //             onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => FlashDealScreen()));
                          //             },isFlash: true,
                          //             )
                          //         : SizedBox.shrink();
                          //   },
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // Consumer<FlashDealProvider>(
                          //   builder: (context, megaDeal, child) {
                          //     return  (megaDeal.flashDeal != null && megaDeal.flashDealList != null && megaDeal.flashDealList.length > 0)
                          //         ? Container(height: MediaQuery.of(context).size.width*.77,
                          //         child: Padding(
                          //           padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                          //           child: FlashDealsView(),
                          //         )) : SizedBox.shrink();},),
                          //
                          //
                          //
                          //
                          //
                          // // Brand
                          // Provider.of<SplashProvider>(context, listen: false).configModel.brandSetting == "1"?
                          // Padding(
                          //   padding: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_EXTRA_SMALL, right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                          //   bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: TitleRow(title: getTranslated('brand', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllBrandScreen()));}),
                          // ):SizedBox(),
                          // SizedBox(height: Provider.of<SplashProvider>(context, listen: false).configModel.brandSetting == "1"?Dimensions.PADDING_SIZE_SMALL: 0),
                          // Provider.of<SplashProvider>(context, listen: false).configModel.brandSetting == "1"?
                          // BrandView(isHomePage: true) : SizedBox(),
                          //
                          //
                          //
                          // //top seller
                          // singleVendor?SizedBox():
                          // TitleRow(title: getTranslated('top_seller', context),
                          //   onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllTopSellerScreen(topSeller: null,)));},),
                          // singleVendor?SizedBox(height: 0):SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // singleVendor?SizedBox():
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                          //   child: TopSellerView(isHomePage: true),
                          // ),
                          //
                          //
                          //
                          //
                          //
                          // //footer banner
                          // Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
                          //   return footerBannerProvider.footerBannerList != null && footerBannerProvider.footerBannerList.length > 0?
                          //   Padding(
                          //     padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                          //     child: FooterBannersView(index: 0,),
                          //   ):SizedBox();
                          // }),
                          //
                          //
                          //


                          // Featured Products
                          Consumer<ProductProvider>(
                              builder: (context, featured,_) {
                                return featured.featuredProductList!=null && featured.featuredProductList.length>0 ?
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                                    child: CustomTitleRow(title: getTranslated("mens_fashion", context),
                                        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(productType: ProductType.MENS_FASHION_PRODUCT)));}),
                                  ),
                                ):SizedBox();
                              }
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                          //   child: FeaturedProductView(scrollController: _scrollController, isHome: true,),
                          // ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                            child: MensFashionProductView(scrollController: _scrollController, isHome: true,),
                          ),






                          // Featured Deal
                          // Consumer<FeaturedDealProvider>(
                          //   builder: (context, featuredDealProvider, child) {
                          //     return featuredDealProvider.featuredDealProductList != null && featuredDealProvider.featuredDealProductList.length >0 ?
                          //     Padding(padding: const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_SMALL),
                          //       child: TitleRow(title: getTranslated('featured_deals', context),
                          //           onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => FeaturedDealScreen()));}),
                          //     ) : SizedBox.shrink();},),
                          //
                          // Consumer<FeaturedDealProvider>(
                          //   builder: (context, featuredDealProvider, child) {
                          //     return featuredDealProvider.featuredDealProductList != null && featuredDealProvider.featuredDealProductList.length >0 ?
                          //    Container(height: featuredDealProvider.featuredDealProductList.length> 4 ? 120 * 4.0 : 120 * (double.parse(featuredDealProvider.featuredDealProductList.length.toString())),
                          //         child: Padding(
                          //           padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                          //           child: FeaturedDealsView(),
                          //         )) : SizedBox.shrink();},),




                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                          //   child: RecommendedProductView(),
                          // ),





                          //footer banner
                          // Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
                          //   return footerBannerProvider.mainSectionBannerList != null &&
                          //       footerBannerProvider.mainSectionBannerList.length > 0?
                          //   Padding(
                          //     padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                          //     child: MainSectionBannersView(index: 0,),
                          //   ):SizedBox();
                          //
                          // }),
                          Padding(
                            padding: const EdgeInsets.only(bottom: Dimensions.HOME_PAGE_PADDING),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.width/4.1,
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: Images.placeholder, fit: BoxFit.cover,
                                    image: 'http://ukrbd.com/images/website/banner3.jpg',
                                    imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            ),
                          ),



                          // Latest Products
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //   child: TitleRow(title: getTranslated('latest_products', context),
                          //       onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                          //           productType: ProductType.LATEST_PRODUCT)));}),
                          // ),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          // LatestProductView(scrollController: _scrollController),
                          // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('mobile_products', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('computer_&_it', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('fragrances', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('networking', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('ladies_fashion', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('featured_deals', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('health_&_herbs', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('kids_fashion', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('car_&_vehicles', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('stationery_&_office', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('electrical_&_lighting', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('electronics_&_appliances', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('robotics_and_artificial_intelligence', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('software_service_&_solution', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child: CustomTitleRow(title: getTranslated('winter_collection', context),
                                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (_) => AllProductScreenUkrbd(
                                    productType: ProductType.MOBILE_PRODUCT)));}),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          LatestProductView(scrollController: _scrollController),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //Hide category wise product view
                          //Hide category wise product view
                          //Hide category wise product view
                          //Hide category wise product view
                          //Hide category wise product view
                          //Hide category wise product view
                          //Hide category wise product view
                          //Hide category wise product view
                          //Home category
                          // HomeCategoryProductView(isHomePage: true),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                          // //footer banner
                          // Consumer<BannerProvider>(builder: (context, footerBannerProvider, child){
                          //   return footerBannerProvider.footerBannerList != null && footerBannerProvider.footerBannerList.length>1?
                          //   FooterBannersView(index: 1):SizedBox();
                          // }),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),


                          //Category filter
                          // Consumer<ProductProvider>(
                          //     builder: (ctx,prodProvider,child) {
                          //   return Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL,vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          //     child: Row(children: [
                          //       Expanded(child: Text(prodProvider.title == 'xyz' ? getTranslated('new_arrival',context):prodProvider.title, style: titleHeader)),
                          //       prodProvider.latestProductList != null ? PopupMenuButton(
                          //         itemBuilder: (context) {
                          //           return [
                          //             PopupMenuItem(value: ProductType.NEW_ARRIVAL, child: Text(getTranslated('new_arrival',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //                )),
                          //             PopupMenuItem(value: ProductType.TOP_PRODUCT, child: Text(getTranslated('top_product',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //               )),
                          //             PopupMenuItem(value: ProductType.BEST_SELLING, child: Text(getTranslated('best_selling',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //              )),
                          //             PopupMenuItem(value: ProductType.DISCOUNTED_PRODUCT, child: Text(getTranslated('discounted_product',context)), textStyle: robotoRegular.copyWith(
                          //               color: Theme.of(context).hintColor,
                          //             )),
                          //           ];
                          //         },
                          //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
                          //         child: Padding(
                          //           padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL,vertical:Dimensions.PADDING_SIZE_SMALL ),
                          //           child: Image.asset(Images.dropdown, scale: 3,),
                          //         ),
                          //         onSelected: (value) {
                          //           if(value == ProductType.NEW_ARRIVAL){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[0]);
                          //           }else if(value == ProductType.TOP_PRODUCT){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[1]);
                          //           }else if(value == ProductType.BEST_SELLING){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[2]);
                          //           }else if(value == ProductType.DISCOUNTED_PRODUCT){
                          //             Provider.of<ProductProvider>(context, listen: false).changeTypeOfProduct(value, types[3]);
                          //           }
                          //
                          //           ProductView(isHomePage: false, productType: value, scrollController: _scrollController);
                          //           Provider.of<ProductProvider>(context, listen: false).getLatestProductList(1, context, reload: true);
                          //
                          //
                          //         }
                          //       ) : SizedBox(),
                          //     ]),
                          //   );
                          // }),
                          // ProductView(isHomePage: false, productType: ProductType.NEW_ARRIVAL, scrollController: _scrollController),
                          SizedBox(height: Dimensions.HOME_PAGE_PADDING),

                        ],
                      ),
                    ),
                  )



                ],
              ),

              Provider.of<SplashProvider>(context, listen: false).configModel.announcement.status == '1'?
              Positioned(top: MediaQuery.of(context).size.height-128,
                left: 0,right: 0,
                child: Consumer<SplashProvider>(
                  builder: (context, announcement, _){
                    return (announcement.configModel.announcement.announcement != null && announcement.onOff)?
                    AnnouncementScreen(announcement: announcement.configModel.announcement):SizedBox();
                  },

                ),
              ):SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  SliverDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 70 || oldDelegate.minExtent != 70 || child != oldDelegate.child;
  }
}
