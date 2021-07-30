import 'dart:ui';
import 'package:winning11/component/model/schedule/cricket_schedule_response.dart';
import 'package:winning11/component/widget/team_play.dart';
import 'package:winning11/component/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winning11/component/util/extensions.dart';

class HomeScreen extends StatefulWidget {
  final void Function() menuCallBack;

  const HomeScreen({Key key, this.menuCallBack}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  double _appBarHeight = 100.0;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoginProgress = false;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  var cricketScheduleKList = List<CricketScheduleResponse>();

  @override
  void initState() {
    super.initState();

    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
    cricketScheduleKList.add(CricketScheduleResponse());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          key: _scaffoldKey,
          body: RefreshIndicator(
              displacement: 100,
              key: _refreshIndicatorKey,
              onRefresh: () async {},
              child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: <Widget>[
                   widget.sliverAppBar(_appBarBehavior, [widget.drawerIcon(widget.menuCallBack)], widget.flexibleSpaceBar(appName)),
                    SliverList(
                        delegate: new SliverChildBuilderDelegate(
                            (context, index) => TeamPlayWidget(
                                matchStatus: 'Match status',
                                seriesName: 'Series name',
                                teamNameA: 'Team A',
                                teamNameB: 'Team B',
                                countryImageA: profileImage,
                                countryImageB: profileImage,
                                contestJoinShow: true,
                                totalContestJoin: '3'),
                            childCount: cricketScheduleKList.length))
                  ])))
    ]);
  }
}

enum AppBarBehavior { normal, pinned, floating, snapping }
