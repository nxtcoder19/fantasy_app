import 'package:flutter/material.dart';
import 'package:winning11/component/model/leaderboard_details_data.dart';
import 'package:winning11/component/model/winning_details_data.dart';
import 'package:winning11/component/util/AppImages.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';

class LeaderboardListView extends StatefulWidget {

  final LeaderboardDetailsData leaderboardData;

  const LeaderboardListView({
    Key key,
    this.leaderboardData,
  }) : super(key: key);

  @override
  _LeaderboardListViewState createState() => _LeaderboardListViewState();
}

class _LeaderboardListViewState extends State<LeaderboardListView> {

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
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppImages.circularAssetImage(30, widget.leaderboardData.profile),
                                SizedBox(width: 5,),
                                //Text(widget.leaderboardData.rank),
                                Text(widget.leaderboardData.teamName)
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