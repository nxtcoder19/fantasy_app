import 'package:winning11/component/constant/constants.dart';
import 'package:winning11/component/model/tournament_data.dart';
import 'package:winning11/component/util/AppImages.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/widget/matchtimer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TournamentListView extends StatelessWidget {
  const TournamentListView({
    Key key,
    this.tournamentData,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final TournamentData tournamentData;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, routeContests),
                splashColor: Colors.transparent,
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  //   boxShadow: <BoxShadow>[
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.6),
                  //       offset: const Offset(4, 4),
                  //       blurRadius: 16,
                  //     ),
                  //   ],
                  // ),
                  child: Card(
                    elevation: 5,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                    //borderRadius: const BorderRadius.all(Radius.circular(16.0)),
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
                                color: AppTheme.appColour, shape: BoxShape.circle)),
                        // Padding(
                        //     padding: const EdgeInsets.only(left: 4),
                        //     child: Text(widget.matchStatus))
                      ])),
              Container(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Row(children: <Widget>[
                    Column(
                      children: [
                        AppImages.circularAssetImage(
                          60, tournamentData.firstTeamImage),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tournamentData.firstTeamName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                          Text(tournamentData.seriesName,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54,fontWeight: FontWeight.bold)),
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    // Expanded(
                                    //     child: Container(
                                    //         padding: EdgeInsets.only(left: 8),
                                    //         child: Text(tournamentData.firstTeamName,
                                    //             style: TextStyle(
                                    //                 fontWeight:
                                    //                     FontWeight.bold)))),
                                    Text('vs',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.red)),
                                    // Expanded(
                                    //     child: Container(
                                    //         padding: EdgeInsets.only(right: 8),
                                    //         child: Text(tournamentData.secondTeamName,
                                    //             style: TextStyle(
                                    //                 fontWeight:
                                    //                     FontWeight.bold),
                                    //             textAlign: TextAlign.end)))
                                  ])),
                          MatchTimerWidget(
                              dateStart:  DateFormat("yyyy-MM-dd").format(DateTime.now()), timerStart: tournamentData.time)
                        ])),
                    Column(
                      children: [
                        AppImages.circularAssetImage(
                          60, tournamentData.secondTeamImage),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(tournamentData.secondTeamName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    ),
                  ])),
              // widget.contestJoinShow
              //     ? Container(
              //         padding:
              //             const EdgeInsets.only(left: 8, top: 4, bottom: 4),
              //         child: Row(children: <Widget>[
              //           Text(widget.totalContestJoin,
              //               style: TextStyle(fontWeight: FontWeight.bold)),
              //           SizedBox(width: 3),
              //           Text('Contest joined',
              //               style: TextStyle(color: Colors.blueGrey))
              //         ]))
              //     : Container()
            ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
