import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("금호동 3가",
              style: TextStyle(
                fontWeight: FontWeight.bold
              )
          ),
          actions: [
            Row(
              children: [
                Icon(Icons.search),
                Icon(Icons.menu),
                Icon(Icons.add_alert_rounded)
              ],
            )
          ],
          
          
        ),
        
        
        body: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: Container(
                padding: EdgeInsets.all(15),
                child: (
                    Image.asset('kk_124.png')
                ),
              ),
                flex: 3,
              ),

              Flexible(child: Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DietMoney", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text("능곡로 69 끌올 100년전", style: TextStyle(color: Colors.grey),),
                    Text('100.000.000.000원', style: TextStyle(fontWeight: FontWeight.bold),),
                    Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border),
                          Text("4")
                        ],
                      ),
                    )
                  ],
                ),
              ),
                flex: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}

