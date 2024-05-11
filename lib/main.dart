import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = [0, 0, 0];
  var name = ['허성욱', '계림 공쥬', '페페'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("연락처앱"),),
        body: ListView.builder(
          itemCount: 3,
            itemBuilder: (c, i){
            return ListTile(
              leading: Text(a[i].toString()),
              title: Text(name[i]),
              trailing: ElevatedButton(
                child: Text("좋아요"),
                onPressed: (){
                  setState(() {
                    a[i]++;
                  });
                },
              ),
            );
            }
        )
      ),
    );
  }
}



//그니까 이건 안드로이드에서 함수 나누기? 뭐 그런 셈이지
class ShopItem extends StatelessWidget {
  const ShopItem({super.key});

  @override
  build(context) {
    return SizedBox(
      child: Text("gk"),
    );
  }
}

