import 'package:flutter/material.dart';
import 'package:moveisapp/bussines_logic/logic_home/home_logic.dart';
import 'package:sizer/sizer.dart';

import 'View_list_ithem/view_list_ithem_popular.dart';

class PopularView extends StatefulWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  late HomeLogic cubit;

  @override
  void didChangeDependencies() {
    cubit = HomeLogic.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.sp),
        child: GridView.builder(
            itemCount: cubit.moviesPopularResponse.results.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => ListViewIthem(
                  moviesmodel: cubit.moviesPopularResponse.results[index],
                )));
  }
}
