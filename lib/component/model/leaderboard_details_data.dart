
import 'package:winning11/component/constant/constants.dart';

class LeaderboardDetailsData {
  LeaderboardDetailsData({
    this.profile = '',
    this.teamName = '',
  });

  String profile;
  String teamName;

  static Future<List<LeaderboardDetailsData>> getLeaderboardDetailsData() async{
    return leaderboardDetailsData;
  }

  static List<LeaderboardDetailsData> leaderboardDetailsData = <LeaderboardDetailsData>[
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T2',
    ),
    LeaderboardDetailsData(
      profile: profileImage,
      teamName: 'piyush T1',
    ),
    
  ];
}