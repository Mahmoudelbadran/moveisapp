import 'package:flutter/material.dart';
import 'package:moveisapp/bussines_logic/logic_home/home_logic.dart';
import 'package:moveisapp/core/chang_page/controle_page.dart' as screens;
import 'package:moveisapp/data/Remote/Response/Movies_popular_response.dart';

import 'package:sizer/sizer.dart';

import '../../../widget/defoult_image.dart';

class ListViewIthem extends StatelessWidget {
  final MoviesResults moviesmodel;
  const ListViewIthem({Key? key, required this.moviesmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,screens.SinglePagePopular,arguments: moviesmodel);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.sp),
        child: Container(
          margin: EdgeInsets.all(2.sp),
          child: Center(
            child: DefaultNetworkImage(
              imageURL: HomeLogic.get(context)
                  .imageURL(imagePath: moviesmodel.posterPath),
              fit: BoxFit.fill,
              width: 50.w,

            ),
          ),
        ),
      ),
    );
  }
}
