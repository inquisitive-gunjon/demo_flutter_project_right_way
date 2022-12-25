import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/banner_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/banner_model_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/banner_repo.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/banner_repo_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';

class BannerProviderUkrbd extends ChangeNotifier {
  final BannerRepoUkrbd bannerRepoUkrbd;

  BannerProviderUkrbd({@required this.bannerRepoUkrbd});

  List<Sliders> _mainBannerList;
  List<Sliders> _footerBannerList;
  List<Sliders> _mainSectionBannerList;
  Product _product;
  int _currentIndex;

  List<Sliders> get mainBannerList => _mainBannerList;
  List<Sliders> get footerBannerList => _footerBannerList;
  List<Sliders> get mainSectionBannerList => _mainSectionBannerList;
  Product get product => _product;
  int get currentIndex => _currentIndex;

  Future<void> getBannerList(bool reload, BuildContext context) async {
    if (_mainBannerList == null || reload) {
      ApiResponse apiResponse = await bannerRepoUkrbd.getBannerList();
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _mainBannerList = [];
        // apiResponse.response.data.forEach((bannerModel) => _mainBannerList.add(BannerModelUkrbd().fromJson(bannerModel));

        BannerModelUkrbd bannerModelUkrbd=BannerModelUkrbd.fromJson(apiResponse.response.data);
        _mainBannerList=bannerModelUkrbd.sliders;
        _currentIndex = 0;
        notifyListeners();
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }



  Future<void> getFooterBannerList(BuildContext context) async {
    ApiResponse apiResponse = await bannerRepoUkrbd.getFooterBannerList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _footerBannerList = [];
      // apiResponse.response.data.forEach((bannerModel) => _footerBannerList.add(BannerModel.fromJson(bannerModel)));
      BannerModelUkrbd bannerModelUkrbd=BannerModelUkrbd.fromJson(apiResponse.response.data);
      _footerBannerList=bannerModelUkrbd.sliders;
      notifyListeners();
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  Future<void> getMainSectionBanner(BuildContext context) async {
    ApiResponse apiResponse = await bannerRepoUkrbd.getMainSectionBannerList();
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _mainSectionBannerList = [];
      // apiResponse.response.data.forEach((bannerModel) => _mainSectionBannerList.add(BannerModel.fromJson(bannerModel)));
      BannerModelUkrbd bannerModelUkrbd=BannerModelUkrbd.fromJson(apiResponse.response.data);
      _mainSectionBannerList=bannerModelUkrbd.sliders;
      notifyListeners();
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

}
