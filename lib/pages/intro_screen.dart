import 'package:covid19tips/utils/flutkart.dart';
import 'package:covid19tips/utils/my_navigator.dart';
import 'package:covid19tips/widgets/walkthrough.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;
  static const IconData clean_hands =
      IconData(0xe65a, fontFamily: 'MaterialIcons');

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  var clean_hands;
    return Container(
      //backgroundImage:,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/covid5.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      //  color: Color(0xFFEEEEEE),
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: Flutkart.wt1,
                  content: Flutkart.wc1,
                  imageIcon: Icons.mobile_screen_share,
                ),
                Walkthrough(
                  title: Flutkart.wt2,
                  content: Flutkart.wc2,
                  imageIcon: Icons.clean_hands,
                ),
                Walkthrough(
                  title: Flutkart.wt3,
                  content: Flutkart.wc3,
                  imageIcon: Icons.six_ft_apart,
                ),
                Walkthrough(
                  title: Flutkart.wt4,
                  content: Flutkart.wc4,
                  imageIcon: Icons.masks,
                ),
              ],
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? "" : Flutkart.skip,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () =>
                      lastPage ? null : MyNavigator.goToHome(context),
                ),
                FlatButton(
                  child: Text(lastPage ? Flutkart.gotIt : Flutkart.next,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? MyNavigator.goToHome(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
