import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutkart/utils/flutkart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animCtrl;
  Animation<double> animation;

  AnimationController animCtrl2;
  Animation<double> animation2;

  bool showFirst = true;

  @override
  void initState() {
    super.initState();

    // Animation init
    animCtrl = new AnimationController(
        duration: new Duration(milliseconds: 500), vsync: this);
    animation = new CurvedAnimation(parent: animCtrl, curve: Curves.easeOut);
    animation.addListener(() {
      this.setState(() {});
    });
    animation.addStatusListener((AnimationStatus status) {});

    animCtrl2 = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);
    animation2 = new CurvedAnimation(parent: animCtrl2, curve: Curves.easeOut);
    animation2.addListener(() {
      this.setState(() {});
    });
    animation2.addStatusListener((AnimationStatus status) {});
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(Flutkart.name),
        actions: <Widget>[
          Padding(
            //child: Icon(Icons.search),
            padding: const EdgeInsets.only(right: 10.0),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Covid19 SafetyTips App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              title: Text('Get Travel Permit'),
              onTap: () => launch('https://covid19.gov.bw/'),
              // Update the state of the app.
              // ...

              leading: Icon(Icons.bus_alert, color: Colors.blue[300]),
            ),
            ListTile(
              title: Text('Covid19 News'),
              onTap: () => launch(
                  'https://www.google.com/search?rlz=1C1AVSF_enBW742BW742&sxsrf=ALeKk02QDQXaCDm2u_BW7FEn9yn5obziMA%3A1602234774508&ei=limAX7PJHp2AhbIP_Y-78As&q=covid+news+botswana&oq=covid+news+&gs_lcp=Cgdnd3Mtd2l6EAEYADIFCAAQyQMyAggAMgIIADIHCAAQFBCHAjIHCAAQFBCHAjICCAAyAggAMgIIADICCAAyAggAOgcIIxDJAxAnOgQIIxAnOgQIABBDOgoIABCxAxAUEIcCOgUIABCxAzoICAAQsQMQgwE6CggAEMkDEBQQhwJQ0g5Y1CBgqzFoAHAAeACAAdQFiAHDM5IBBTUtOS4ymAEAoAEBqgEHZ3dzLXdpesABAQ&sclient=gws-wiz'),
              // Update the state of the app.
              // ...

              leading: Icon(Icons.shopping_basket, color: Colors.blue[300]),
            ),
            ListTile(
              title: Text('About App'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
              leading: Icon(Icons.info, color: Colors.blue[300]),
            ),
          ],
        ),
      ),
      body: new Center(),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () => {},
        child: Icon(Icons.shopping_cart, color: Colors.white),
      ),*/
    );
  }
}

class CardView extends StatelessWidget {
  final double cardSize;
  CardView(this.cardSize);

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: new SizedBox.fromSize(
      size: new Size(cardSize, cardSize),
    ));
  }
}
