import 'package:winning11/component/constant/constants.dart';
import 'package:winning11/component/widget/match_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'matchtimer.dart';

class TeamPlayWidget extends StatefulWidget {
  final String matchStatus,
      seriesName,
      teamNameA,
      teamNameB,
      countryImageA,
      countryImageB,
      totalContestJoin;

  final bool contestJoinShow;

  const TeamPlayWidget(
      {Key key,
      this.matchStatus,
      this.seriesName,
      this.teamNameA,
      this.teamNameB,
      this.countryImageA,
      this.countryImageB,
      this.totalContestJoin,
      this.contestJoinShow = false})
      : super(key: key);

  @override
  createState() => _TeamPlayState();
}

class _TeamPlayState extends State<TeamPlayWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () => Navigator.pushNamed(context, routeContests),
            onLongPress: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) => MatchDetailWidget());
            },
            child: Column(children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle)),
                        Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Text(widget.matchStatus))
                      ])),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage:
                                ExactAssetImage(widget.countryImageA))),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Text(widget.seriesName,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black54)),
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Text(widget.teamNameA,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)))),
                                    Text('vs',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.red)),
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(right: 8),
                                            child: Text(widget.teamNameB,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.end)))
                                  ])),
                          MatchTimerWidget(
                              dateStart:  DateFormat("yyyy-MM-dd").format(DateTime.now()), timerStart: '24:00:00')
                        ])),
                    Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage:
                                ExactAssetImage(widget.countryImageB)))
                  ])),
              widget.contestJoinShow
                  ? Container(
                      padding:
                          const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                      child: Row(children: <Widget>[
                        Text(widget.totalContestJoin,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 3),
                        Text('Contest joined',
                            style: TextStyle(color: Colors.blueGrey))
                      ]))
                  : Container()
            ])));
  }
}
