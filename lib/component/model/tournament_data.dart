
class TournamentData {
  TournamentData({
    this.firstTeamName = '',
    this.secondTeamName = '',
    this.firstTeamImage = '',
    this.secondTeamImage = '',
    this.seriesName = "",
    this.time = '',
  });

  String firstTeamName;
  String secondTeamName;
  String firstTeamImage;
  String secondTeamImage;
  String seriesName;
  String time;

  static Future<List<TournamentData>> getTournamentData() async{
    return tournamentData;
  }

  static List<TournamentData> tournamentData = <TournamentData>[
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/default_male_image.png',
      secondTeamImage: 'assets/images/default_female_image.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team C',
      secondTeamName: 'Team D',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultdigibyteImage.png',
      seriesName: 'Abu Dhabi T10',
      time: '25:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team E',
      secondTeamName: 'Team F',
      firstTeamImage: 'assets/images/default_male_image.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '22:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/default_female_image.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '26:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultdigibyteImage.png',
      secondTeamImage: 'assets/images/default_male_image.png',
      seriesName: 'Abu Dhabi T10',
      time: '27:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultdigibyteImage.png',
      secondTeamImage: 'assets/images/default_female_image.png',
      seriesName: 'Abu Dhabi T10',
      time: '19:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
    ),
    TournamentData(
      firstTeamName: 'Team A',
      secondTeamName: 'Team B',
      firstTeamImage: 'assets/images/defaultBitCoin.png',
      secondTeamImage: 'assets/images/defaultBitCoin.png',
      seriesName: 'Abu Dhabi T10',
      time: '24:00:00',
    ),
  ];
}