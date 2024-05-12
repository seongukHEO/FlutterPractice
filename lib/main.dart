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
  var name = ['허성욱', '계림 공쥬', '페페', '콩자반'];
  var total = 4;

  addOne(){
    setState(() {
      total++;
    });
  }

  addName(a){
    setState(() {
      name.add(a);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return DialogTest(addOne : addOne, addName:addName);
                }
            );
          },
        ),
        appBar: AppBar(title: Text(total.toString()),),
        body: ListView.builder(
          itemCount: name.length,
            itemBuilder: (c, i){
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(name[i]),
              trailing: ElevatedButton(
                child: Text('Delete'),
                onPressed: (){
                  setState(() {
                    name.remove(name[i]);
                    total--;
                  });
                },
              ),
            );
            }
        )
      );
  }
}



class DialogTest extends StatelessWidget {
  DialogTest({Key? key, this.state, this.addOne, this.addName}) : super(key: key);
  var state;
  final addOne;
  final addName;
  var inputDate = TextEditingController();

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
              child: TextField(
                controller: inputDate,
              ),
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
                      onPressed: (){
                        if(inputDate.text.isNotEmpty){
                          addOne();
                          addName(inputDate.text);
                          Navigator.pop(context);
                        }
                      },
                      child: Text("OK")
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


