import 'package:flex_chart_body/app/tongueChart/models/tongueOptions.dart';
import 'package:flex_chart_body/app/tongueChart/providers/tonguePartsProvider.dart';
import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/material.dart';

class TongueTextInputZone extends StatelessWidget {
  const TongueTextInputZone({
    Key? key,
    required TonguePartsProvider tonguePartProvider,
  })  : _tonguePartProvider = tonguePartProvider,
        super(key: key);

  final TonguePartsProvider _tonguePartProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Some random text'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[300],
              child: TextField(
                onChanged: (inputText) {
                  List<TongueBodyOption> checkedList = _tonguePartProvider
                      .tongueBodyOptions
                      .where((element) =>
                          inputText.toLowerCase().contains(element.option))
                      .toList();
                  _tonguePartProvider.checkSentenceForOptions(checkedList);
                  // TODO: Implement Smart sentence edge cases.
                },
                maxLines: 10,
                decoration: InputDecoration(
                    helperText: TongueChartStrings.kInputHelperText),
                controller: _tonguePartProvider.textController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
