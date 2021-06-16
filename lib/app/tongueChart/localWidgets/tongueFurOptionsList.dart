import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/material.dart';

class TongueFurOptionsList extends StatelessWidget {
  const TongueFurOptionsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: ListTile(
              title: Text(TongueChartStrings.kTongueFurTitle,
                  style: TextStyle(fontWeight: FontWeight.w900)),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView(
              children: [ListTile()],
            ),
          )
        ],
      ),
    );
  }
}
