import 'package:winning11/component/model/leaderboard_details_data.dart';
import 'package:winning11/component/model/winning_details_data.dart';
import 'package:winning11/component/route/screen/clipper/create_team.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:winning11/component/widget/leaderboard_list_view.dart';
import 'package:winning11/component/widget/winning_list_view.dart';

class JoinedContestDetails extends StatefulWidget {
  @override
  _JoinedContestDetailsState createState() => _JoinedContestDetailsState();
}

class _JoinedContestDetailsState extends State<JoinedContestDetails> with SingleTickerProviderStateMixin{

  TabController _tabController;
  Future<List<WinningDetailsData>> allWinningData;
  Future<List<LeaderboardDetailsData>> allLeaderboardData;
   @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
    allWinningData = WinningDetailsData.getWinningDetailsData();
    allLeaderboardData = LeaderboardDetailsData.getLeaderboardDetailsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0, title: Text('Rs 66, Entry 19'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.wallet_giftcard
            ),
            
          )
        ],
      ),
      body: Column(
        children: [
          Container(color: AppTheme.appColour,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getTeamScore('Team A', '191/4(20)'),
                      Text('COMPLETED',
                        style: TextStyle(
                          //fontSize: 18,
                          color: AppTheme.white
                          ),
                        ),
                      getTeamScore('Team B', '122/9(20)')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Team A beat Team B by 69 runs',
                    style: TextStyle(
                      //fontSize: 18,
                      color: AppTheme.white
                    ),
                  ),
                )
              ],
            ),
          ),

          TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: AppTheme.black,
              indicatorColor: AppTheme.appColour,
              tabs: [
                Tab(
                  text: 'Winnings',
                  //icon: Icon(Icons.people),
                ),
                Tab(
                  text: 'Leaderboard',
                  //icon: Icon(Icons.person),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Text('a'),
                  // Text('b')
                  winningDetails(),
                  leaderboardDetails()
                ],
                controller: _tabController,
              ),
            ),

        ],
      ),
    );
  }

  Widget getTeamScore(String team,String score) {
    return Column(
      children: [
        Text(
          team,
          style: TextStyle(
            //fontSize: 18,
            color: AppTheme.white
          ),
        ),
        Text(
          score,
          style: TextStyle(
            fontSize: 18,
            color: AppTheme.white
          ),
        )
      ],
    );
  }

  Widget winningDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rank'),
                      Text('Winnings')
                    ],
                  ),
                ),
                FutureBuilder(
                  future: allWinningData,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        break;
                      case ConnectionState.waiting:
                        return Container(
                          height: MediaQuery.of(context).size.height*0.8,
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor:new AlwaysStoppedAnimation<Color>(AppTheme.appColour),
                            ),
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
                              if (snapshot.data.length > 0) {
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  padding: const EdgeInsets.only(top: 8),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return WinningListView(winningData:snapshot.data[index]);
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text(""),
                                );
                              }
                            }
                            break;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget leaderboardDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'All Teams (1,43,691)'
                  )
                ),
                FutureBuilder(
                  future: allLeaderboardData,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        break;
                      case ConnectionState.waiting:
                        return Container(
                          height: MediaQuery.of(context).size.height*0.8,
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor:new AlwaysStoppedAnimation<Color>(AppTheme.appColour),
                            ),
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
                              if (snapshot.data.length > 0) {
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  padding: const EdgeInsets.only(top: 8),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return LeaderboardListView(leaderboardData:snapshot.data[index]);
                                  },
                                );
                              } else {
                                return Center(
                                  child: Text(""),
                                );
                              }
                            }
                            break;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class LinearGradientProgressbarView extends StatelessWidget {
  final double progressbarPoint;

  const LinearGradientProgressbarView({Key key, this.progressbarPoint = 0.0})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        child:
            Stack(alignment: AlignmentDirectional.centerEnd, children: <Widget>[
      ClipPath(
          clipper: LinearGradientTeamClipper(lead: 6.0),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.teal, Colors.teal.withOpacity(0.5)])))),
                      //colors: [Colors.grey, Colors.blue.withOpacity(0.5)])))),
      ClipPath(
          clipper: LinearGradientTeamClipper(lead: 6.0),
          child: Container(
              width: ((MediaQuery.of(context).size.width - 32) *
                  (100 - progressbarPoint) /
                  100),
              color: HexColor('#ECECEC')))
    ]));
  }
}
