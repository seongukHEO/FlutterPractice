import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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


  //await를 쓰는 이유는
  //플러터는 실행이 오래걸리는 작업이 있을 때
  //우선 넘어가버리는 습성이 있다
  //그래서 await를 사용하여 저 변수가 수행이 될 때까지
  //넘어가지 못하게끔 하는 것이다
  getPermission() async {
    var status = await Permission.contacts.status; //이건 연락처 권한을 줬는지에 대한 여부
    Permission.contacts.request();  //이 부분이 팝업창을 띄워주는 부분이다!
    if(status.isGranted){ // 허락이 되었을 때
      print("허락됨");
      var contacts = await ContactsService.getContacts();    //얘도 오래 걸리는 작업이기 때문에 await를 사용한다
      name = contacts;

    } else if(status.isDenied){ //허락이 되지 않았을 때
      print("거절됨");
      openAppSettings();  // 이건 거절당할 경우 앱 설정에 들어가게끔 해주는 코드이다
    }
  }


  var a = [0, 0, 0];
  var name = [];
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
        appBar: AppBar(
          title: Text(total.toString()),
          actions: [IconButton(
              onPressed: (){
                getPermission();
              },
              icon: Icon(Icons.add))
          ],),
        body: ListView.builder(
          itemCount: name.length,
            itemBuilder: (c, i){
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(name[i].givenName),
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


