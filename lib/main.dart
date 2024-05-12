import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: MyApp())
  );
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
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return DialogTest(state : a);
                }
            );
          },
        ),
        appBar: AppBar(title: Text("연락처앱"),),
        body: ListView.builder(
          itemCount: 3,
            itemBuilder: (c, i){
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(name[i]),
            );
            }
        )
      );
  }
}



class DialogTest extends StatelessWidget {
  DialogTest({Key? key, this.state}) : super(key: key);
  var state;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 220, height: 195, padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text("Contact", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ),
            ),
            SizedBox(
              child: TextField(),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text(state.toString())
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


