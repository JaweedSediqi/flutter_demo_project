import 'package:demo_project/counter.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'package:flutter/material.dart';
import 'favorites.dart';
import 'shated_preformence.dart';
class Home_page extends StatefulWidget {
  Home_page({
    super.key,
  });
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Share sh = Share();
  bool isLight = true;
  void toggle(){
    Share sh = Share();
    setState(() {
      isLight = !isLight;
      sh.setMode(isLight);
    });
  }
  void getMode() async {
    Share sh = Share();
    isLight = await sh.getMode();
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getMode();
  }
  var ourname = [
    'Ahmad',
    'Ali',
    'Ahmad',
    'AliAhmad',
    'Ali',
    'Ahmad',
    'AliAhmad',
    'Ali'
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => provider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isLight ? ThemeData.light() : ThemeData.dark(),
        home: Builder(
          builder: (context) {
            return Scaffold(
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Favorites(
                          arr: ourname,
                        );
                      },
                    ));
                  },
                  label: Text('favorits')),
              appBar: AppBar(
                actions: [
                  Switch(
                      value: isLight, onChanged: (bool value){
                    toggle();
                  }),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Counter(),
                            ));
                      },
                      icon: Icon(Icons.grid_4x4_outlined))
                ],
                title: Text('Demo'),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('${ourname[index]}'),
                            trailing: IconButton(
                              onPressed: () {
                                Provider.of<provider>(context, listen: false)
                                    .toggleFavorit(index);
                              },
                              icon:
                                  Provider.of<provider>(context).isExist(index)
                                      ? Icon(Icons.favorite, color: Colors.red)
                                      : Icon(Icons.favorite_border),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: ourname.length),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
