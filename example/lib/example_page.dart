import 'package:example/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/button.dart';
import 'package:platty/widgets/navigation_bar.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PNavigationBar(
        title: Text("Example"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PButton(
              iosBorderRadius: BorderRadius.circular(8.0),
              color: Colors.grey,
              renderPlatform: TargetPlatform.iOS,
              child: Text("Alerts"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AlertPage()));
              },
            ),
            PButton(
              androidShape: StadiumBorder(),
              color: Colors.grey,
              renderPlatform: TargetPlatform.android,
              child: Text("Buttons"),
              onPressed: () {},
            ),
            PButton(
              color: Colors.grey,
              renderPlatform: TargetPlatform.iOS,
              child: Text("Progress"),
              onPressed: () {},
            ),
            PButton(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey,
              renderPlatform: TargetPlatform.android,
              child: Text("Sliders"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}