import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/category.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/ukrbd_response/Categories.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:provider/provider.dart';
class CategoryWidgetUkrbd extends StatelessWidget {
  final Categories category;
  const CategoryWidgetUkrbd({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Container(
        height: MediaQuery.of(context).size.width/4,
        width: MediaQuery.of(context).size.width/5,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.2)),
          // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
          borderRadius: BorderRadius.circular(2),
          color: Theme.of(context).highlightColor,
        ),
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child:
          // FadeInImage.assetNetwork(
          //   fit: BoxFit.cover,
          //   placeholder: Images.placeholder,
          //   image: category.image!=null?'${Provider.of<SplashProvider>(context,listen: false).baseUrls.categoryImageUrl}'
          //       '/${category.image}':null,
          //   imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover,),
          // ),
          FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: Images.placeholder,
            image: "assets/banner/1.jpg",
            imageErrorBuilder: (c, o, s) => Image.asset(Images.placeholder, fit: BoxFit.cover,),
          ),
        ),
      ),

      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      Container(
        child: Center(
          child: Text(category.category,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL,
                color: ColorResources.getTextTitle(context)),
          ),
        ),
      ),

    ]);
  }
}
