import 'package:winning11/component/constant/constants.dart';

class CreateTeamData {
  CreateTeamData({
    this.playerName = '',
    this.playerTeam = '',
    this.playerImage = '',
    this.selection = '',
    this.points = "",
    this.credit = '',
  });

  String playerName;
  String playerTeam;
  String playerImage;
  String selection;
  String points;
  String credit;

  static Future<List<CreateTeamData>> getCreateTeamData() async{
    return createTeamData;
  }

  static List<CreateTeamData> createTeamData = <CreateTeamData>[
    CreateTeamData(
      playerName: 'Dhoni',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'Kohli',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'Dhawan',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'dfgxdf',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'dfgxdf',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'dfgxdf',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'dfgxdf',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'dfgxdf',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'dfgxdf',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
    CreateTeamData(
      playerName: 'dfgxdf',
      playerTeam: 'IND-WK',
      playerImage: profileImage,
      selection: '60%',
      points: '50',
      credit: '9',
    ),
  ];
}