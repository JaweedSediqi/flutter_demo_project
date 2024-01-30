import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';

class Favorites extends StatelessWidget {
   Favorites({Key? key,required this.arr}) : super(key: key);
  late var arr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
        ),
        body: Consumer<provider>(
          builder: (context, favorite, child) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(arr[favorite.mylist[index]]),
                    trailing: IconButton(
                        onPressed: () {
                          favorite.toggleFavorit(favorite.mylist[index]);
                        },
                        icon: favorite.isExist(favorite.mylist[index])
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(Icons.favorite_border)),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: favorite.mylist.length);
          },
        ));
  }
}

//
// class Favorites extends StatelessWidget {
//   const Favorites({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: Text('Favorites')
//       ),
//       body: Consumer<FavoriteProvider>(
//         builder: (context, favorite, child){
//           return ListView.separated(
//               itemBuilder: (context, index){
//                 return ListTile(
//                   trailing: IconButton(onPressed: (){
//
//                     favorite.toggleFavorite(favorite.indecis[index]);
//
//                   }, icon: Icon(favorite.isExist(favorite.indecis[index]) ? Icons.favorite: Icons.favorite_border)),
//                   title: Text(favorite.indecis[index].toString()),
//                 );
//               },
//               separatorBuilder: (context, index){
//                 return SizedBox(
//                   height: 10,
//                 );
//               },
//               itemCount: favorite.indecis.length);
//         },
//       ),
//     );
//   }
// }
