import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moveisapp/bussines_logic/logic_home/home_logic.dart';
import 'package:moveisapp/prestion/Googlemap/screens_google_map.dart';
import 'package:moveisapp/prestion/router/approuter.dart';
import 'package:sizer/sizer.dart';

import 'data/Remote/DataProvider/mydio.dart';
import 'data/local/my_cache.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 await MyDio.dioInit();
  await MyCache.initcachce();
  runApp(MrmoviesApp());

}

class MrMoviesApp extends StatelessWidget {
  final AppRouter appRouter = AppRouter();

  MrMoviesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return BlocProvider(
          lazy: true,
          create: (context) => HomeLogic(),
          child: const MaterialApp(
            title: 'MR Movies',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,

          ),
        );
      },

    );
  }
}

