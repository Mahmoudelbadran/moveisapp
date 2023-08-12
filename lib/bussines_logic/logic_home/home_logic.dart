import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:moveisapp/data/Remote/Request/movies_requiest.dart';
import 'package:moveisapp/data/Remote/Response/Movies_popular_response.dart';

import '../../core/Contast/constant.dart';
import '../../prestion/screens/Search_screens/search_screens.dart';
import '../../prestion/screens/favourite_screen/favourite_screens.dart';
import '../../prestion/screens/person_screens/person_screens.dart';

import '../../prestion/view/home_screen_view/home_view.dart';
part 'home_states.dart';

class HomeLogic extends Cubit<Homestate> {
  HomeLogic() : super(AppIntialStates());

  static HomeLogic get(context) => BlocProvider.of<HomeLogic>(context);
  List<IconData> iconList = [
    Icons.home_outlined,
    Icons.search,
    Icons.favorite_outline,
    Icons.person_outline
  ];

  List<Widget> pages = [
    const HomeView(),
    const SearchScreens(),
    const FavouriteScreen(),
    const PersonScreens()
  ];
  int x = 0;
  Widget changepages() {
    return pages.elementAt(x);
  }

  void changeclickebuton(index) {
    x = index;
    emit(changeclickebutonstates());
  }

  List label = ['MR Movies', ' Search', ' Favourite', '  Profile'];
  String imageURL({required String imagePath}) {
    return '$imagesBaseURL$imagePath';
  }

  MoviesPopularResponse moviesPopularResponse = MoviesPopularResponse();
  void getMovies() {
    emit(LoadingApiAppState());

    MoviesResquest()
        .moviesrequest(apiKey: '4af8751291c6ec8e1e204ed7808257ba')
        .then((value) {
      moviesPopularResponse = value;
      emit(SuscessApiAppState());
    }).catchError((error) {
      emit(ErorrApiAppState());
    });
  }

  Future Signin({required String username, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: username, password: password);
  }

  Future<void> signUp(
      {required String Email,
      required String password,
      required String passwordconfirm}) async {
    if (confirm(confirmpassword: passwordconfirm, password: password)) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: password,
      );
    }
  }

  bool confirm({required String confirmpassword, required String password}) {
    if (password == confirmpassword) {
      return true;
    } else {
      return false;
    }
  }


  SignInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth?.accessToken,
      idToken: gAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
