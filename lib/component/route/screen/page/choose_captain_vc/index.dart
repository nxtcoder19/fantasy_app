import 'package:winning11/component/util/hexacolor.dart';
import 'package:winning11/component/constant/constants.dart';
import 'package:flutter/material.dart';
import '../player_profile/index.dart';

class ChooseCVCScreen extends StatefulWidget {
  const ChooseCVCScreen({Key key}) : super(key: key);

  @override
  createState() => _ChooseCVCState();
}

class _ChooseCVCState extends State<ChooseCVCScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var wkList = List<Players>();
  var batList = List<Players>();
  var arList = List<Players>();
  var bowlList = List<Players>();

  var allPlayesList = List<Players>();
  @override
  void initState() {
    wkList.add(Players(name: 'Dinesh Karthik', playingRole: 'Wicket - Keeper'));

    batList.add(Players(name: 'David Miller', playingRole: 'Bastmen'));
    batList.add(Players(name: 'Aiden Markram', playingRole: 'Bastmen'));
    batList.add(Players(name: 'Rassie van der', playingRole: 'Bastmen'));
    batList.add(Players(name: 'Lokesh Rahul', playingRole: 'Bastmen'));

    arList.add(Players(name: 'Chris Morris', playingRole: 'All - Rounders'));
    arList.add(Players(name: 'Ravindra Jadeja', playingRole: 'All - Rounders'));
    arList.add(Players(name: 'Kedar Jadhav', playingRole: 'All - Rounders'));

    bowlList.add(Players(name: 'Yuzvendra', playingRole: 'Bowlers'));
    bowlList.add(Players(name: 'Kuldeep Yadav', playingRole: 'Bowlers'));
    bowlList.add(Players(name: 'Jasprit Bumrah', playingRole: 'Bowlers'));

    allPlayesList.addAll(wkList);
    allPlayesList.addAll(batList);
    allPlayesList.addAll(arList);
    allPlayesList.addAll(bowlList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 1, title: Text('Choose C and VC')),
        key: _scaffoldKey,
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(8),
                child: Center(
                    child: Text('Choose your Captain and Vice Captain',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )))),
            Container(
                margin: EdgeInsets.all(8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Container(
                            width: 25,
                            height: 25,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                    border: new Border.all(
                                        width: 1.0, color: Colors.black54)),
                                child: Center(
                                    child: Text('C',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))))),
                        Text(' gets 2x points',
                            style: TextStyle(color: Colors.black54))
                      ]),
                      SizedBox(width: 8),
                      Row(children: <Widget>[
                        Container(
                            width: 25,
                            height: 25,
                            child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                    border: new Border.all(
                                        width: 1.0, color: Colors.black54)),
                                child: Center(
                                    child: Text('VC',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54))))),
                        Text(' gets 1.5x points',
                            style: TextStyle(color: Colors.black54))
                      ])
                    ]))
          ]),
          Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: allPlayesList.length,
                  itemBuilder: (context, index) => PlayerWidget(
                      player: allPlayesList[index],
                      isGrayBar: index != 0
                          ? allPlayesList[index].playingRole !=
                              allPlayesList[index - 1].playingRole
                          : true)))
        ]));
  }
}

class PlayerWidget extends StatelessWidget {
  final Players player;
  final bool isGrayBar;

  const PlayerWidget({Key key, this.player, this.isGrayBar = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        isGrayBar
            ? Container(
                color: HexColor('#F5F5F5'),
                margin: EdgeInsets.only(bottom: 3),
                padding: EdgeInsets.all(5),
                child: Center(
                    child: Text(
                  player.playingRole,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )))
            : SizedBox(),
        Container(
            margin: EdgeInsets.only(top: 0, bottom: 3),
            child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(5),
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
                                  Text(player.name,
                                      style: TextStyle(fontSize: 14)),
                                  Container(
                                      padding: EdgeInsets.only(top: 1),
                                      child: Text('SA - WK',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54)))
                                ]))),
                    Container(
                        width: 70,
                        child: Center(
                            child: Text('00',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black54)))),
                    SizedBox(width: 5),
                    Container(
                        width: 25,
                        height: 25,
                        child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(30.0),
                                border: new Border.all(
                                    width: 1.0, color: Colors.black54)),
                            child: Center(
                                child: Text('C',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54))))),
                    SizedBox(width: 20),
                    Container(
                        width: 25,
                        height: 25,
                        child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(30.0),
                                border: new Border.all(
                                    width: 1.0, color: Colors.black54)),
                            child: Center(
                                child: Text('VC',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)))))
                  ])),
              SizedBox(height: 0.3),
              Divider(height: 1, color: Colors.black12, thickness: 0.3)
            ]))
      ],
    );
  }
}

class Players {
  String name;
  String playingRole;

  Players({this.name, this.playingRole});
}
