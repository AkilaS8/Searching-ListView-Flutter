import 'package:flutter/material.dart';
import 'package:searching_list_with_json/data/data_model.dart';
import 'package:url_launcher/url_launcher.dart';
class UserDetailsPage extends StatelessWidget {

  final User user;

  UserDetailsPage({required this.user});

  String userTitle() {
    String title = "";
    if (user.gender == "Male") {
      title = "Mr.";
    } else if (user.gender == "Female") {
      title = "Ms.";
    }
    return title;
  }

  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${userTitle()} ${user.firstName} ${user.lastName}'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: Hero(
                tag: user.id,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                  radius: 100.0,
                ),
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              '${userTitle()} ${user.firstName} ${user.lastName}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              '${user.job}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${user.email}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.left,
                ),
                FlatButton(
                  onPressed: () {
                    customLaunch('mailto:${user.email}?subject=Contact%20Information&body=Type%20your%20mail%20here');
                  },
                  child: Icon(
                    Icons.email,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 20.0),
                  child: Text(
                    user.profile,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
