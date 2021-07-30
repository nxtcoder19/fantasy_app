
class StandingsData {
  StandingsData({
    this.firstTeamName = '',
    this.secondTeamName = '',
    this.firstTeamImage = '',
    this.secondTeamImage = '',
    this.seriesName = "",
    this.time = '',
    this.contestJoined = ''
  });

  String firstTeamName;
  String secondTeamName;
  String firstTeamImage;
  String secondTeamImage;
  String seriesName;
  String time;
  String contestJoined;

  static Future<List<StandingsData>> getStandingsData() async{
    return standingsData;
  }

  static List<StandingsData> standingsData = <StandingsData>[
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/default_male_image.png',
      secondTeamImage: 'assets/images/default_female_image.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
      contestJoined: '1',
    ),
    StandingsData(
      firstTeamName: 'Team C',
      secondTeamName: 'Team D',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultdigibyteImage.png',
      seriesName: 'Abu Dhabi T10',
      time: '25:00:00',
      contestJoined: '2',
    ),
    StandingsData(
      firstTeamName: 'Team E',
      secondTeamName: 'Team F',
      firstTeamImage: 'assets/images/default_male_image.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '22:00:00',
      contestJoined: '3',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/default_female_image.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '26:00:00',
      contestJoined: '4',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultdigibyteImage.png',
      secondTeamImage: 'assets/images/default_male_image.png',
      seriesName: 'Abu Dhabi T10',
      time: '27:00:00',
      contestJoined: '5',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultdigibyteImage.png',
      secondTeamImage: 'assets/images/default_female_image.png',
      seriesName: 'Abu Dhabi T10',
      time: '19:00:00',
      contestJoined: '6',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
      contestJoined: '7',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
      contestJoined: '81',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
      contestJoined: '9',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
      contestJoined: '10',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
      contestJoined: '11',
    ),
    StandingsData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
      contestJoined: '12',
    ),
  ];
}