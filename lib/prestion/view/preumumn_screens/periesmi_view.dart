import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moveisapp/core/Contast/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../bussines_logic/logic_home/home_logic.dart';


class PersonView extends StatefulWidget {
  const PersonView({Key? key}) : super(key: key);

  @override
  State<PersonView> createState() => _PersonViewState();
}

class _PersonViewState extends State<PersonView> {
  late HomeLogic cubit;

  @override
  void didChangeDependencies() {
    cubit = HomeLogic.get(context);

    super.didChangeDependencies();
  }
 LatLng? PickerLoaction;
  @override
  Widget build(BuildContext context) {
    return  Container(


    );
  }
}
