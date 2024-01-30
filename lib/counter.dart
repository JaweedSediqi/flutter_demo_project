import 'package:demo_project/shated_preformence.dart';
import 'package:flutter/material.dart';
class Counter extends StatefulWidget {
  Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  Share sh = Share();
  var counter = 0;
  void getCounter() async {
    Share sh = Share();
    counter = await sh.getCount();
  }
  void reset(){
    counter = 0;
    sh.setCount(0);
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    getCounter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Center(child: Text("تسبیح")),
            ),
            body: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${counter}',
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            reset();
                          });
                        },
                        child: Icon(Icons.exposure_zero),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                            sh.setCount(counter);
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
