
import 'package:shared_preferences/shared_preferences.dart';


class Share{


  Future setCount(int counter)async {

    final pre =await SharedPreferences.getInstance();

    pre.setInt('counter', counter);
  }



  Future<int> getCount () async {

    final pre = await SharedPreferences.getInstance();

    int counter = pre.getInt('counter') ?? 0;

    return counter;

  }
  Future setMode(bool mode)async {

    final pre = await SharedPreferences.getInstance();

    pre.setBool('mode', mode);
  }



  Future<bool> getMode () async {

    final pre = await SharedPreferences.getInstance();

    bool mode = pre.getBool('mode') ?? false;

    return mode;

  }



}
