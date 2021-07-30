import 'package:winning11/component/model/create_team_data.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/widget/createTeam_list_view.dart';
import 'package:winning11/component/widget/create_team_progress_bar.dart';
import 'package:winning11/component/widget/create_team_selection.dart';
import 'package:winning11/component/constant/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../choose_captain_vc/index.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key key}) : super(key: key);
  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  Future<List<CreateTeamData>> allTeamData;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    allTeamData = CreateTeamData.getCreateTeamData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Create Team')),
        bottomNavigationBar: Container(
            height: 40,
            child: Container(
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(4.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 0),
                          blurRadius: 0.0)
                    ]),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        borderRadius: new BorderRadius.circular(4.0),
                        onTap: () =>
                            Navigator.pushNamed(context, routeTeamPreview),
                        child: Center(child: Text('TEAM PREVIEW')))))),
        body: Stack(alignment: AlignmentDirectional.bottomCenter, children: <
            Widget>[
          Column(children: <Widget>[
            Card(
                elevation: 0.5,
                margin: EdgeInsets.all(0),
                child: Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(4),
                      child: Column(children: <Widget>[
                        Text('Max 7 players from a team',
                            style: TextStyle(color: Colors.black54)),
                        SizedBox(height: 5),
                        Text('30-4-2020',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ])),
                  Container(
                      padding: EdgeInsets.all(4),
                      child: Row(children: <Widget>[
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  child: Text('Players',
                                      style: TextStyle(color: Colors.black54))),
                              Row(children: <Widget>[
                                Text('0',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    )),
                                Text(' / 11',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ))
                              ])
                            ]),
                        Expanded(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('IND',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.blue)),
                            SizedBox(width: 5),
                            Container(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.1),
                                    backgroundImage:
                                        ExactAssetImage(profileImage))),
                            Container(
                                margin: EdgeInsets.only(left: 3, right: 3),
                                child: Text('vs',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red))),
                            Container(
                                width: 50,
                                height: 50,
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.1),
                                    backgroundImage:
                                        ExactAssetImage(profileImage))),
                            SizedBox(width: 5),
                            Text('SA',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.blue))
                          ],
                        )),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('Credits',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  )),
                              Text('00',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black))
                            ])
                      ])),

                  GestureDetector(
                      onTap: () =>  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseCVCScreen(),
                              fullscreenDialog: true)),
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child:  Text('Choose caption and vice caption', style: TextStyle(color: Colors.deepOrangeAccent)))),

                  Container(
                      height: 40,
                      width: double.infinity,
                      padding: EdgeInsets.all(7),
                      child: CreateTeamProgressBarWidget(teamCount: 11))
                ])),
            Container(
                height: 40,
                child: TabBar(
                  unselectedLabelColor: Colors.black54,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'WK'),
                    Tab(text: 'BAT'),
                    Tab(text: 'AR'),
                    Tab(text: 'BOWL')
                  ],
                  controller: tabController,
                )),
            Flexible(
                child: TabBarView(
                    physics: BouncingScrollPhysics(
                      parent: PageScrollPhysics(),
                    ),
                    controller: tabController,
                    children: <Widget>[
                      //wkList(),
                  CreateTeamSelectionWidget(title: 'Pick 1 Wicket - Keeper',allData: allTeamData,),
                  CreateTeamSelectionWidget(title: 'Pick 3 - 5 Batsmens',allData: allTeamData,),
                  CreateTeamSelectionWidget(title: 'Pick 1 - 3 All Rounders',allData: allTeamData,),
                  CreateTeamSelectionWidget(title: 'Pick 3 - 5 Bowlers',allData: allTeamData,)
                ]))
          ])
        ]));
  }

  Widget wkList() {
    return SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            color: AppTheme.backgroundColor,
            child: Column(
              children: [
                FutureBuilder<List<CreateTeamData>>(
                  future: allTeamData,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CreateTeamData>> snapshot) {
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
                          List<CreateTeamData> reviewList =
                              snapshot.data;
                          if (reviewList.length > 0) {
                            return ListView.builder(
                              itemCount: reviewList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.only(top: 8),
                              scrollDirection: Axis.vertical,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                // final int count =
                                //     reviewList.length > 10
                                //         ? 10
                                //         : reviewList.length;
                                // final Animation<double> animation =
                                //     Tween<double>(begin: 0.0, end: 1.0)
                                //         .animate(CurvedAnimation(
                                //             parent: animationController,
                                //             curve: Interval(
                                //                 (1 / count) * index,
                                //                 1.0,
                                //                 curve: Curves
                                //                     .fastOutSlowIn)));
                                //animationController.forward();
                                return CreateTeamListView(
                                  allTeamData: reviewList[index],
                                  //animation: animation,
                                  // animationController:
                                  //     animationController,
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
              ],
            ),
          )
        ],
      ),
    );
  }

}
