import 'package:flutter/material.dart';
import 'package:winning11/component/model/winning_details_data.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';

class WinningListView extends StatefulWidget {

  final WinningDetailsData winningData;

  const WinningListView({
    Key key,
    this.winningData,
  }) : super(key: key);

  @override
  _WinningListViewState createState() => _WinningListViewState();
}

class _WinningListViewState extends State<WinningListView> {

  double _width;

  @override
  void initState() {
    super.initState();
    //_getImage();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppTheme.white)
              )
            ),
            width: _width * 0.90,
            child: ClipRRect(
              child: Stack(
                children: <Widget>[
                  Container(color: Colors.grey[50],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.winningData.rank),
                                Text(widget.winningData.winning)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}