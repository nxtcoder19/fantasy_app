import 'package:flutter/material.dart';
import 'package:winning11/component/constant/constants.dart';
import 'package:winning11/component/model/joincontest_deails_data.dart';
import 'package:winning11/component/model/winning_details_data.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';

class JoinedContestListView extends StatefulWidget {

  final JoinedContestDetailsData joinedContestData;

  const JoinedContestListView({
    Key key,
    this.joinedContestData,
  }) : super(key: key);

  @override
  _JoinedContestListViewState createState() => _JoinedContestListViewState();
}

class _JoinedContestListViewState extends State<JoinedContestListView> {

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
          onTap: () => Navigator.pushNamed(context, routeJoinedContestDetails),
          splashColor: Colors.transparent,
          child: Container(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              child: Column(children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getData('Prize Pool', widget.joinedContestData.prizePool),
                        getData('Spots', widget.joinedContestData.spots),
                        getData('Entry', widget.joinedContestData.entry)
                      ],
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                    //width: _width,
                    color: Colors.grey[100],
                    child: Row(
                      children: [
                        Text('1st'),
                        SizedBox(width: 2,),
                        Text(widget.joinedContestData.firstPrice),
                        SizedBox(width: 5,),
                        Icon(
                          Icons.wine_bar
                        ),
                        SizedBox(width: 2,),
                        Text(widget.joinedContestData.winningPercent)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getLastRowData(widget.joinedContestData.teamName),
                        getLastRowData(widget.joinedContestData.teamPoint),
                        getLastRowData(widget.joinedContestData.teamRank)
                      ],
                    ),
                  )
                ]
              ),
            ),
          ),
        ),
      );
  }

  Widget getData(String text1, String text2) {
    return Column(
      children: [
        Text(
          text1,
          style: TextStyle(
            color: AppTheme.grey
          ),
        ),
        SizedBox(height: 5,),
        Text(
          text2,
          style: TextStyle(
            color: AppTheme.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }

  Widget getLastRowData(String text1) {
    return Column(
      children: [
        Text(
          text1,
          // style: TextStyle(
          //   color: AppTheme.grey
          // ),
        ),
      ],
    );
  }

}