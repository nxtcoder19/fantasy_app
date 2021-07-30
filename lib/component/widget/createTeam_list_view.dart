
import 'package:winning11/component/constant/constants.dart';
import 'package:winning11/component/model/create_team_data.dart';
import 'package:winning11/component/route/screen/page/player_profile/index.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

enum SELECT_PLAYER_STATE {ADD_PLAYER, REMOVE_PLAYER}

class CreateTeamListView extends StatefulWidget {

  const CreateTeamListView({
    Key key,
    this.allTeamData,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final CreateTeamData allTeamData;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  _CreateTeamListViewState createState() => _CreateTeamListViewState();
}

class _CreateTeamListViewState extends State<CreateTeamListView> {

  double _width;
  SELECT_PLAYER_STATE selectPlayer = SELECT_PLAYER_STATE.REMOVE_PLAYER;
  bool _onPlayerClick = true;

  Color playerBackground() {
    switch (selectPlayer) {
      case SELECT_PLAYER_STATE.REMOVE_PLAYER:
        return HexColor('#F5F5F5');
      case SELECT_PLAYER_STATE.ADD_PLAYER:
        return AppTheme.appColour;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
      return InkWell(
        onTap: _onPlayerClick
            ? () {
              setState(() {
                _onPlayerClick = false;
                selectPlayer = SELECT_PLAYER_STATE.ADD_PLAYER;
              });
            }
            : () {
              setState(() {
                _onPlayerClick = true;
                selectPlayer = SELECT_PLAYER_STATE.REMOVE_PLAYER;
              });
            },
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
                child: Column(
                  children: <Widget>[
                    // AspectRatio(
                    //   aspectRatio: 2,
                    //   //child: AppImages.getImage(urlImageApi, defaultCategoryImage)
                    // ),
                    Container(
                      // color: AppTheme.buildLightTheme()
                      //     .backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
        child: Container(
            //margin: EdgeInsets.only(top: 0, bottom: 3),
            child: Column(children: <Widget>[
              Container(
                color: playerBackground(),
                //color: HexColor('#F5F5F5'),
                padding: EdgeInsets.all(15),
                child: Row(children: <Widget>[
                  Container(
                  child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerProfileScreen(),
                              fullscreenDialog: true)),
                      child: Container(
                          width: 45,
                          height: 45,
                          child: CircleAvatar(
                              backgroundColor:
                                  Colors.grey.withOpacity(0.1),
                              backgroundImage:
                                  ExactAssetImage(profileImage))))),
                  Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.allTeamData.playerName,
                                style: TextStyle(fontSize: 14)),
                            Container(
                                padding: EdgeInsets.only(top: 1),
                                child: Text(widget.allTeamData.playerTeam,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54)))
                          ]))),
                  Container(
                  width: 70,
                  child: Center(
                      child: Text(widget.allTeamData.points,
                          style: TextStyle(
                              fontSize: 15, color: Colors.black54)))),
                  SizedBox(width: 5),
                  Container(
                  width: 70,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(widget.allTeamData.credit,
                            style: TextStyle(
                                fontSize: 15, color: Colors.black54)),
                        SizedBox(width: 20)
                      ])),
                  Center(
                  child: Container(
                      width: 40, child: Icon(Icons.close,//LineIcons.close,LineIcons.close, 
                      size: 20)))
                ])),
              SizedBox(height: 0.3),
              Divider(height: 1, color: Colors.black12, thickness: 0.3)
            ])))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      );
  }
}