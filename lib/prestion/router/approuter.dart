import 'package:flutter/material.dart';
import 'package:moveisapp/data/Remote/Response/Movies_popular_response.dart';
import 'package:moveisapp/prestion/screens/auth/auth.dart';
import 'package:moveisapp/prestion/screens/onBordingScreens/onbording_Screens.dart';
import 'package:moveisapp/prestion/screens/register_screens/register_screens.dart';
import 'package:moveisapp/prestion/screens/single_page_popular_screen/Single_page_popular.dart';
import '../screens/Home_screens/home_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../../core/chang_page/controle_page.dart' as screens;
class AppRouter{

  late Widget startpage;
  Route?onGenerateRoute(RouteSettings settings){
    startpage=const SplashScreen();
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=>startpage);
      case screens.OnBordingScreens:
        return MaterialPageRoute(builder: (_)=>const OnBordingScreens());
      case screens.RegisterScreens:
        return MaterialPageRoute(builder: (_)=>const RegisterScreens());
      case screens.LoginScreens:
        return MaterialPageRoute(builder: (_)=>const Auth());
      case screens.HomeScreenApp:
        return MaterialPageRoute(builder: (_)=>const HomeScreenApp());
      case screens.SinglePagePopular:
        MoviesResults Moviesdata=settings.arguments as MoviesResults;
        return MaterialPageRoute(builder: (_)=>  SinglePagePopular(modeldata: Moviesdata,));
      default:
        return null;
    }
  }
}