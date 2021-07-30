import 'dart:ui';
import 'package:winning11/component/model/tournament_data.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/widget/tournament_list_view.dart';
import 'package:flutter/material.dart';

class TournamentScreen extends StatefulWidget {
  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Future<List<TournamentData>> allTournamentData;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
        allTournamentData = TournamentData.getTournamentData();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tournament'),centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        color: AppTheme.backgroundColor,
                        child: FutureBuilder<List<TournamentData>>(
                          future: allTournamentData,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<TournamentData>> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                break;
                              case ConnectionState.waiting:
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                                break;
                              case ConnectionState.active:
                                break;
                              case ConnectionState.done:
                                if (!snapshot.hasData) {
                                  return const Center(
                                      child: Text(
                                          'Something went wrong. Please try again.'));
                                } else {
                                  List<TournamentData> reviewList =
                                      snapshot.data;
                                  if (reviewList.length > 0) {
                                    return ListView.builder(
                                      itemCount: reviewList.length,
                                      padding: const EdgeInsets.only(top: 8),
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final int count =
                                            reviewList.length > 10
                                                ? 10
                                                : reviewList.length;
                                        final Animation<double> animation =
                                            Tween<double>(begin: 0.0, end: 1.0)
                                                .animate(CurvedAnimation(
                                                    parent: animationController,
                                                    curve: Interval(
                                                        (1 / count) * index,
                                                        1.0,
                                                        curve: Curves
                                                            .fastOutSlowIn)));
                                        animationController.forward();
                                        return TournamentListView(
                                          tournamentData: reviewList[index],
                                          animation: animation,
                                          animationController:
                                              animationController,
                                        );
                                      },
                                    );
                                  } else {
                                    return Center(
                                      child: Text("You have no booking yet"),
                                    );
                                  }
                                }
                                break;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: 100,
          right: 8,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  'Your Bookings',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}
