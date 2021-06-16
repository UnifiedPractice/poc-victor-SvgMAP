import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/material.dart';

class TongueBodyOptionsList extends StatelessWidget {
  const TongueBodyOptionsList({
    Key? key,
    required this.test,
  }) : super(key: key);

  final List<Widget> test;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: ListTile(
              title: Text(
                TongueChartStrings.kTongueBodyTitle,
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView(
              children: test,
            ),
          ),
        ],
      ),
    );
  }
}
