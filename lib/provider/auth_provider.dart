import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthProvider extends ChangeNotifier{
    bool _isSignIn = false;
    bool get isSignIn => _isSignIn;

    AuthProvider(){
      checksignin();
    }
     void checksignin() async{
      final SharedPreferences s = await SharedPreferences.getInstance() ;
      _isSignIn= s.getBool("is_signin") ?? false;
      notifyListeners();
    }

}