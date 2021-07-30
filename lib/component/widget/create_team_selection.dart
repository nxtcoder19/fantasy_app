import 'package:winning11/component/model/create_team_data.dart';
import 'package:winning11/component/route/screen/page/player_profile/index.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/util/hexacolor.dart';
import 'package:winning11/component/constant/constants.dart';
import 'package:winning11/component/widget/createTeam_list_view.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CreateTeamSelectionWidget extends StatefulWidget {
  final String title;
  final Future<List<CreateTeamData>> allData;
  const CreateTeamSelectionWidget({Key key, this.title, this.allData}) : super(key: key);
  @override
  createState() => _CreateTeamSelectionState();
}

class _CreateTeamSelectionState extends State<CreateTeamSelectionWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          width: double.infinity,
          height: 40,
          color: HexColor('#F5F5F5'),
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
          child: Center(
              child: Text(widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)))),
      Column(children: <Widget>[
        Container(
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('PLAYERS', style: TextStyle(fontSize: 12)),
                          ]))),
              Container(
                  width: 70,
                  child: Center(
                      child: Text('POINTS',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)))),
              SizedBox(width: 5),
              Container(
                  width: 70,
                  child: Center(
                      child: Row(children: <Widget>[
                    Text('CREDIT',
                        style: TextStyle(fontSize: 12, color: Colors.black54)),
                    Icon(
                      Icons.close,//LineIcons.close,LineIcons.arrow_down,
                       size: 20)
                  ]))),
              Container(width: 40)
            ])),
        Divider(height: 1)
      ]),
      wkList()
      // Flexible(
      //     child: ListView(shrinkWrap: true, children: <Widget>[
      //   Container(
      //       margin: EdgeInsets.only(top: 0, bottom: 3),
      //       child: Column(children: <Widget>[
      //         Container(
      //             color: HexColor('#F5F5F5'),
      //             padding: EdgeInsets.all(5),
      //             child: Row(children: <Widget>[
      //               Container(
      //                   child: InkWell(
      //                       onTap: () => Navigator.push(
      //                           context,
      //                           MaterialPageRoute(
      //                               builder: (context) => PlayerProfileScreen(),
      //                               fullscreenDialog: true)),
      //                       child: Container(
      //                           width: 45,
      //                           height: 45,
      //                           child: CircleAvatar(
      //                               backgroundColor:
      //                                   Colors.grey.withOpacity(0.1),
      //                               backgroundImage:
      //                                   ExactAssetImage(profileImage))))),
      //               Expanded(
      //                   child: Container(
      //                       margin: EdgeInsets.only(left: 5),
      //                       child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: <Widget>[
      //                             Text('Player Name',
      //                                 style: TextStyle(fontSize: 14)),
      //                             Container(
      //                                 padding: EdgeInsets.only(top: 1),
      //                                 child: Text('SA - WK',
      //                                     style: TextStyle(
      //                                         fontSize: 12,
      //                                         color: Colors.black54)))
      //                           ]))),
      //               Container(
      //                   width: 70,
      //                   child: Center(
      //                       child: Text('00',
      //                           style: TextStyle(
      //                               fontSize: 15, color: Colors.black54)))),
      //               SizedBox(width: 5),
      //               Container(
      //                   width: 70,
      //                   child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Text('00',
      //                             style: TextStyle(
      //                                 fontSize: 15, color: Colors.black54)),
      //                         SizedBox(width: 20)
      //                       ])),
      //               Center(
      //                   child: Container(
      //                       width: 40, child: Icon(LineIcons.close, size: 20)))
      //             ])),
      //         SizedBox(height: 0.3),
      //         Divider(height: 1, color: Colors.black12, thickness: 0.3)
      //       ]))
      // ]))
    ]);
  }

  Widget wkList() {
    return Flexible(
          child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              color: AppTheme.backgroundColor,
              child: Column(
                children: [
                  FutureBuilder<List<CreateTeamData>>(
                    future: widget.allData,
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
      ),
    );
  }


}
