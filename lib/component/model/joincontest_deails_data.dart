
class JoinedContestDetailsData {
  JoinedContestDetailsData({
    this.prizePool = '',
    this.spots = '',
    this.entry = '',
    this.firstPrice = '',
    this.winningPercent = '',
    this.teamName = '',
    this.teamPoint = '',
    this.teamRank = '',
  });

  String prizePool;
  String spots;
  String entry;
  String firstPrice;
  String winningPercent;
  String teamName;
  String teamPoint;
  String teamRank;

  static Future<List<JoinedContestDetailsData>> getJoinedContestDetailsData() async{
    return joinedContestDetailsData;
  }

  static List<JoinedContestDetailsData> joinedContestDetailsData = <JoinedContestDetailsData>[
    JoinedContestDetailsData(
      prizePool: 'Rs66',
      spots: '4',
      entry: 'Rs 19',
      firstPrice: 'Rs66',
      winningPercent: '25%',
      teamName: 'pkcpkc T1',
      teamPoint: '455.5',
      teamRank: '#1'
    ),
    JoinedContestDetailsData(
      prizePool: 'Rs66',
      spots: '4',
      entry: 'Rs 19',
      firstPrice: 'Rs66',
      winningPercent: '25%',
      teamName: 'pkcpkc T5',
      teamPoint: '455.5',
      teamRank: '#2'
    ),
    JoinedContestDetailsData(
      prizePool: 'Rs66',
      spots: '4',
      entry: 'Rs 19',
      firstPrice: 'Rs66',
      winningPercent: '25%',
      teamName: 'pkcpkc T4',
      teamPoint: '455.5',
      teamRank: '#1'
    ),
    JoinedContestDetailsData(
      prizePool: 'Rs66',
      spots: '4',
      entry: 'Rs 19',
      firstPrice: 'Rs66',
      winningPercent: '25%',
      teamName: 'pkcpkc T2',
      teamPoint: '455.5',
      teamRank: '#4'
    ),
    JoinedContestDetailsData(
      prizePool: 'Rs66',
      spots: '4',
      entry: 'Rs 19',
      firstPrice: 'Rs66',
      winningPercent: '25%',
      teamName: 'pkcpkc T3',
      teamPoint: '455.5',
      teamRank: '#3'
    ),
  ];
}