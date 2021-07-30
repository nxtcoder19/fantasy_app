import 'package:flutter/material.dart';
import 'package:winning11/component/constant/constants.dart';
import 'package:winning11/component/model/joincontest_deails_data.dart';
import 'package:winning11/component/model/winning_details_data.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';

class MyTeamsListView extends StatefulWidget {

  final JoinedContestDetailsData myTeamData;

  const MyTeamsListView({
    Key key,
    this.myTeamData,
  }) : super(key: key);

  @override
  _MyTeamsListViewState createState() => _MyTeamsListViewState();
}

class _MyTeamsListViewState extends State<MyTeamsListView> {

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
          onTap: () => Navigator.pushNamed(context, routeTeamPreview),
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
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.myTeamData.teamName,
                        style: TextStyle(
                          fontSize: 16
                        ),
                      )
                      // getData('Prize Pool', widget.myTeamData.prizePool),
                      // getData('Spots', widget.myTeamData.spots),
                      // getData('Entry', widget.myTeamData.entry)
                    ],
                  ),
                ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                    //width: _width,
                    // color: Colors.grey[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getData('POINTS', widget.myTeamData.teamPoint),
                        Row(
                          children: [
                            getPlayerView('F.du ples', 'C'),
                            SizedBox(width: 30,),
                            getPlayerView('V.Kohli', 'VC')
                            // Icon(
                            //   Icons.circle,size: 80,
                            // ),
                            // Icon(
                            //   Icons.circle,size: 80,
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(color: Colors.grey[100],
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('WK  1'),
                        Text('BAT  5'),
                        Text('AR  1'),
                        Text('BOWL  4'),
                        // getLastRowData(widget.myTeamData.teamName),
                        // getLastRowData(widget.myTeamData.teamPoint),
                        // getLastRowData(widget.myTeamData.teamRank)
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

  Widget getPlayerView(String player, String post) {
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(
              left: (MediaQuery.of(context).size.width > 360 ? 8 : 4),
              right: (MediaQuery.of(context).size.width > 360 ? 8 : 4)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell( borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PlayerProfileScreen(),
                    //         fullscreenDialog: true)),
                    child: Container(
                        width:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        height:
                            (MediaQuery.of(context).size.width > 360 ? 45 : 40),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                            backgroundImage: AssetImage(profileImage,)))),
                Container(
                    // padding:
                    //     EdgeInsets.only(left: 6, top: 2, bottom: 2, right: 6),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(4.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.white)
                        ]),
                    child: Center(
                        child: Text(player,
                            style: TextStyle(color: Colors.blue)))),
                // Container(
                //     padding: EdgeInsets.all(4),
                //     child: Center(
                //         child: Text('10 Cr',
                //             style: TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold))))
              ])),
      Positioned(
          top: 0,
          left: 0,
          child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.circular(32.0),
                  border: new Border.all(width: 1.0, color: Colors.black12)),
              child: Container(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Center(child: Text(post, style: TextStyle(
                    fontSize: 10
                  ),)))))
    ]);
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