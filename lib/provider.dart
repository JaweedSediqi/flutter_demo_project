import 'package:flutter/material.dart';

class provider with ChangeNotifier {
  List _mylist = [];
  List get mylist => _mylist;
  late bool isfavorit;

  bool isExist(int index){
    isfavorit=_mylist.contains(index);
    return isfavorit;
  }
  void toggleFavorit(int index){
    if(isExist(index)){
      _mylist.remove(index);
    }else{
      _mylist.add(index);
    }
    notifyListeners();
  }
}
