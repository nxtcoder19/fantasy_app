import 'package:flutter/material.dart';
import 'package:winning11/component/model/joincontest_deails_data.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/widget/joinedcontest_list_view.dart';
import 'package:winning11/component/widget/myteams_list_view.dart';

class ResultDetails extends StatefulWidget {
  @override
  _ResultDetailsState createState() => _ResultDetailsState();
}

class _ResultDetailsState extends State<ResultDetails> with SingleTickerProviderStateMixin{

  TabController _tabController;
  Future<List<JoinedContestDetailsData>> allJoinedContest;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    allJoinedContest = JoinedContestDetailsData.getJoinedContestDetailsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      elevation: 0, title: Text('Team A vs Team B'),
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
                  text: 'My Contests',
                  //icon: Icon(Icons.people),
                ),
                Tab(
                  text: 'My Teams',
                  //icon: Icon(Icons.person),
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  myContestDetails(),
                  myTeamDetails()
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

  Widget myContestDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: allJoinedContest,
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
                                    return JoinedContestListView(joinedContestData:snapshot.data[index]);
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

  Widget myTeamDetails() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: allJoinedContest,
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
                                    return MyTeamsListView(myTeamData:snapshot.data[index]);
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