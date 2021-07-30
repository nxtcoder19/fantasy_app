import 'package:winning11/component/model/leaderboard_details_data.dart';
import 'package:winning11/component/model/winning_details_data.dart';
import 'package:winning11/component/route/screen/clipper/create_team.dart';
import 'package:winning11/component/util/Theme/AppTheme.dart';
import 'package:winning11/component/util/hexacolor.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:winning11/component/widget/leaderboard_list_view.dart';
import 'package:winning11/component/widget/winning_list_view.dart';

class ContestDetails extends StatefulWidget {
  @override
  _ContestDetailsState createState() => _ContestDetailsState();
}

class _ContestDetailsState extends State<ContestDetails> with SingleTickerProviderStateMixin{

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
        elevation: 1, title: Text('Team A vs Team B'),
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
          Card(
        child: Container(
            child: InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      getPriceList(context),
                      SizedBox(height: 10),
                      progressBar(),
                      spots()
                    ]))))),
                    //Text('data'),
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

  progressBar() {
    var totalTeam = int.tryParse('12');
    var remainingTeam = int.tryParse('3');
    var per = (((totalTeam - remainingTeam) * 100) / totalTeam);
    return Container(
        height: 10,
        child: LinearGradientProgressbarView(progressbarPoint: per));
  }

  Widget spots () {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '200 spots left',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.appColour
              ),
            ),
            Text(
              '300 spots',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.grey
              ),
            ),
          ],
        ),
      ),
    );
  }

  getPriceList(BuildContext context) {
    var remainingTeam = int.tryParse('9') ?? 0;
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Container(
                    child: Text('Prize Pool',
                        style: TextStyle(color: Colors.black54))),
                SizedBox(height: 4),
                Text('1000',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ])),
          GestureDetector(
              onTap: () => {},
              child: Column(children: <Widget>[
                Text('Winners', style: TextStyle(color: Colors.black54)),
                SizedBox(height: 4),
                Text('1', style: TextStyle(color: AppTheme.appColour))
              ])),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                Text('Entry',
                    style: TextStyle(color: Colors.black54),
                    textAlign: TextAlign.end),
                SizedBox(height: 8),
                remainingTeam != 0
                    ? Container(
                        height: 30,
                        width: 70,
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(4.0),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.teal,
                                  offset: Offset(0, 0))
                            ]),
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                                borderRadius: new BorderRadius.circular(4.0),
                                onTap: remainingTeam != 0
                                    ? () =>   inviteCodeDialog(context, '200', '200')
                                    : null,
                                child: Center(
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[Text('500',style: TextStyle(color: AppTheme.white),)])))))
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[Text('00')])
              ]))
        ]));
  }

   winnerCount() {
    return InkWell(onTap: () {}, child: Container());
  }

}

void inviteCodeDialog(BuildContext context, String entryFee, String balance) {
  var cashBonus = '';
  var unutilizedBalanceWinning =
      '${(double.tryParse(balance) + double.tryParse(balance)).toStringAsFixed(2)}';

  if ((double.tryParse(entryFee) * 0.20) < double.tryParse(balance)) {
    cashBonus = '${double.tryParse(entryFee) * 0.20}';
  } else {
    cashBonus = '${double.tryParse(balance)}';
  }
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext buildContext) {
        return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        color: Colors.white,
                        child:
                        Column(mainAxisSize: MainAxisSize.min, children: <
                            Widget>[
                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('CONFIRMATION',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15)),
                                              Text(
                                                  'Unutilized Balance + Winning = ₹$unutilizedBalanceWinning',
                                                  style: TextStyle(
                                                      color: Colors.black54))
                                            ])),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.cached,//LineIcons.close,
                                            size: 20, color: Colors.red))
                                  ])),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 16.0, right: 16),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Entry',
                                        style:
                                        TextStyle(color: Colors.black54)),
                                    Text('₹$entryFee')
                                  ])),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 16.0, right: 16, bottom: 8),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Usable Cash Bonus',
                                        style:
                                        TextStyle(color: Colors.black54)),
                                    Text('-₹$cashBonus')
                                  ])),
                          Divider(height: 1),
                          Container(
                              margin: const EdgeInsets.only(
                                  top: 8, left: 16.0, right: 16, bottom: 8),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('To Pay',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green)),
                                    Text(
                                        '₹${(double.tryParse(entryFee) - double.tryParse(cashBonus)).toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green))
                                  ])),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 16.0, right: 16, bottom: 8),
                              child: Text(
                                  "By joining this contest, you accept FansyApp's T&C.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black54))),
                          Container(
                              height: 45,
                              child: Row(children: <Widget>[
                                Flexible(
                                    child: Container(
                                        decoration: new BoxDecoration(
                                            color: AppTheme.appColour),
                                        child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                                borderRadius:
                                                new BorderRadius.circular(
                                                    4.0),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: Center(
                                                    child: Text(
                                                        'JOIN CONTEST',
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            color: Colors
                                                                .white)))))))
                              ]))
                        ])))));
      });
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
