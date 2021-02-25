
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userdetails/userinfoBLoC.dart';

import 'class/userdetails.dart';

class userinfo extends StatefulWidget {
  @override
  _userinfoState createState() => _userinfoState();
}

class _userinfoState extends State<userinfo> {
  List<userdetails> _list = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user details"),
      ),
      body:loadbody()
    );
  }

  _loadlist() async {
    _list = await userinfom();
    print(" hello ritesh   \n" + _list.length.toString());
  }

  loadbody() {
    return FutureBuilder(
      future: _loadlist(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return userbody();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  userbody() {
    return ListView.builder( itemCount: _list.length,
    itemBuilder: (context, index) {
      return
        Container(
            height: 110,
            padding: EdgeInsets.all(1),
            child:
            Card(

              color: Colors.green,
              //RoundedRectangleBorder, BeveledRectangleBorder, StadiumBorder
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),

              child: ListTile(

                title: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),

                    Text("ID: "+_list[index].id.toString()),
                    SizedBox(
                      height: 3,
                    ),
                    Text("First Name: "+_list[index].firstName.toString()),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Last Name: "+_list[index].lastName.toString()),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Email Id: "+_list[index].email.toString()),

                  ],
                ),

                leading: CircleAvatar(
                  radius: 30.0,

                  backgroundImage: NetworkImage(_list[index].avatar.toString()),
                ),


              ),
            )
        );
    }
    );
    }

}
