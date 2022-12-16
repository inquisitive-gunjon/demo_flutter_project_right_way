

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/ukrbd/produuct_model.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartProviderUkrbd with ChangeNotifier{
  final SharedPreferences sharedPreferences;

  CartProviderUkrbd({this.sharedPreferences});

  List<Data> _cartList=[];
  List<int> _itemCound=[];
  int _totalItem=0;
  int _subTotal=0;



  List<Data> get cartList=>_cartList;
  List<int> get itemCount=>_itemCound;
  int get subTotal => _subTotal;
  int get totalItem => _totalItem;



  void plus(int index,Data productData){
    _itemCound[index]++;
    _totalItem=_totalItem+1;
    _subTotal= int.tryParse(productData.salesPrice)+_subTotal;
    notifyListeners();
  }

  void minus(int index,Data productData){
    _itemCound[index]--;
    _totalItem=_totalItem-1;
    _subTotal= _subTotal-int.tryParse(productData.salesPrice);
    notifyListeners();
  }

  void deleteCartItem(Data productData){
    _totalItem=_totalItem-1;
    _subTotal= _subTotal-int.tryParse(productData.salesPrice);
    _cartList.removeWhere((element) => element==productData);
    notifyListeners();
  }

  void deleteCart(){
    _totalItem=0;
    _subTotal= 0;
    _itemCound.clear();
    _cartList.clear();
    notifyListeners();
  }


  void addToCart(Data productModel,int count){

    _subTotal= int.tryParse(productModel.salesPrice)*count+_subTotal;
    _totalItem=_totalItem+count;
    List<String> carts = [];
    _cartList.add(productModel);
    _itemCound.add(count);

    // _cartList.forEach((cartModel) => carts.add(jsonEncode(cartModel)) );
    // sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
    notifyListeners();
  }

  List<Data> getCartList() {
     List<String> carts = sharedPreferences.getStringList(AppConstants.CART_LIST);
    List<Data> cartList = [];
    carts.forEach((cart) => cartList.add(Data.fromJson(jsonDecode(cart))) );
    notifyListeners();
    return cartList;
  }

  // void addToCartList(List<Data> productModel) {
  //   List<String> carts = [];
  //   productModel.forEach((cartModel) => carts.add(jsonEncode(cartModel)) );
  //   sharedPreferences.setStringList(AppConstants.CART_LIST, carts);
  // }
}

class CartModel{


}
