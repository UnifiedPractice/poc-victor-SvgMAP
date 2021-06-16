import 'package:flex_chart_body/app/bodyChart/bodyChart.dart';
import 'package:flex_chart_body/app/bodyChart/providers/bodyProvider.dart';
import 'package:flex_chart_body/app/tongueChart/tongueChart.dart';
import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurDrawerMenu extends StatelessWidget {
  const OurDrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => BodyChart(),
                  ),
                );
              },
              child: Text('${MenuNames.kBodyChart}'),
            ),
          ),
          ListTile(
            title: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => TongueChart(),
                  ),
                );
              },
              child: Text(MenuNames.kTongueChart),
            ),
          ),
        ],
      ),
    );
  }
}
