import 'package:winning11/component/constant/constants.dart';

class WinningDetailsData {
  WinningDetailsData({
    this.rank = '',
    this.winning = '',
  });

  String rank;
  String winning;

  static Future<List<WinningDetailsData>> getWinningDetailsData() async{
    return winningDetailsData;
  }

  static List<WinningDetailsData> winningDetailsData = <WinningDetailsData>[
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '45000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '45000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '45000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '45000',
    ),
    WinningDetailsData(
      rank: '#1',
      winning: '5,00,000',
    ),
  ];
}