//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/ukrbd_response/Categories.dart';
// import 'package:flutter_sixvalley_ecommerce/data/model/ukrbd_response/CategoryUkrbd.dart';
// import 'package:flutter_sixvalley_ecommerce/data/repository/ukrbd_category_repo.dart';
// import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
//
// class CategoryProviderUkrbd extends ChangeNotifier {
//   final CategoryRepoUkrbd categoryRepo;
//
//   CategoryProviderUkrbd({@required this.categoryRepo});
//
//
//   List<Categories> _categoryList = [];
//   int _categorySelectedIndex;
//   CategoryUkrbd _categoryUkrbd;
//
//   List<Categories> get categoryList => _categoryList;
//   int get categorySelectedIndex => _categorySelectedIndex;
//   CategoryUkrbd get categoryUkrbd => _categoryUkrbd;
//
//   Future<void> getCategoryList(bool reload, BuildContext context) async {
//     if (_categoryList.length == 0 || reload) {
//       ApiResponse apiResponse = await categoryRepo.getCategoryList();
//       if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
//         _categoryList.clear();
//         _categoryUkrbd= CategoryUkrbd.fromJson(apiResponse.response.data);
//         _categoryList=_categoryUkrbd.categories;
//         //apiResponse.response.data.forEach((category) => _categoryList.add(CategoryUkrbd.fromJson(category)));
//         _categorySelectedIndex = 0;
//       } else {
//         ApiChecker.checkApi(context, apiResponse);
//       }
//       notifyListeners();
//     }
//   }
//
//   void changeSelectedIndex(int selectedIndex) {
//     _categorySelectedIndex = selectedIndex;
//     notifyListeners();
//   }
// }