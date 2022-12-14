

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/ukrbd/category_wise_product/Data.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/ukrbd/category_wise_product/category_wise_product.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/category_wise_product_repo.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/sub_category_wise_product_repo_ukrbd.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker_ukrbd.dart';

import '../data/model/response/ukrbd/sub_category_wise_product/Data.dart';
import '../data/model/response/ukrbd/sub_category_wise_product/SubCategoryWiseProductModel.dart';


class SubCategoryWiseProductProviderUkrbd with ChangeNotifier{

  final SubCategoryWiseProductRepoUkrbd subCategoryWiseProductRepoUkrbd;

  SubCategoryWiseProductProviderUkrbd({@required this.subCategoryWiseProductRepoUkrbd});


  //List<Categories> _categoryList = [];
  int _categorySelectedIndex;
  List<Data> _subCategoryWiseProductList=[];
  SubCategoryWiseProductModel _subCategoryWiseProduct;
  SubCategoryWiseProductModel get categoryWiseProductResponse=>_subCategoryWiseProduct;

  List<Data> get categoryWiseProductList => _subCategoryWiseProductList;
  int get categorySelectedIndex => _categorySelectedIndex;

  Future<void> getSubCategoryWiseProductList(bool reload, BuildContext context,String categoryId) async {

    if (_subCategoryWiseProductList.length == 0 || reload) {
      ApiResponse apiResponse = await subCategoryWiseProductRepoUkrbd.getSubCategoryWiseProductList(categoryId);
      if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
        _subCategoryWiseProductList.clear();
        // apiResponse.response.data.forEach((category) => _categoryList.add(Category.fromJson(category)));
        _subCategoryWiseProduct = SubCategoryWiseProductModel.fromJson(apiResponse.response.data);
        _subCategoryWiseProductList=_subCategoryWiseProduct.products.data.cast<Data>();
        _categorySelectedIndex = 0;
      } else {
        ApiChecker.checkApi(context, apiResponse);
      }
      notifyListeners();
    }

  }

  void clear(){
    _subCategoryWiseProductList.clear();
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   _categoryWiseProductList.clear();
  //   notifyListeners();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  void changeSelectedIndex(int selectedIndex) {
    _categorySelectedIndex = selectedIndex;
    notifyListeners();
  }

}