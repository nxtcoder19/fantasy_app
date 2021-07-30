import 'package:winning11/component/route/screen/page/contests/index.dart';
import 'package:winning11/component/route/screen/page/create_your_team/index.dart';
import 'package:winning11/component/route/screen/page/login/index.dart';
import 'package:winning11/component/route/screen/page/enter_mobile_no/index.dart';
import 'package:winning11/component/route/screen/page/my_profile/index.dart';
import 'package:winning11/component/route/screen/page/otp/index.dart';
import 'package:winning11/component/route/screen/page/register/index.dart';
import 'package:winning11/component/route/screen/page/splash/index.dart';
import 'package:winning11/component/route/screen/page/standigs/components/joinedContestDetails.dart';
import 'package:winning11/component/route/screen/page/standigs/components/resultDetails.dart';
import 'package:winning11/component/route/screen/page/tab_controller/index.dart';
import 'package:winning11/component/route/screen/page/team_preview/index.dart';
import 'package:winning11/component/route/screen/page/wallet/transaction_history.dart';
import 'package:winning11/component/constant/constants.dart';
import 'package:flutter/material.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case routeMobile:
        return MaterialPageRoute(builder: (_) => MobileScreen());
      case routeOTP:
        return MaterialPageRoute(builder: (_) => OTPScreen());
      case routeSignUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case routeTab:
        return MaterialPageRoute(builder: (_) => TabScreen());
      case routeContests:
        return MaterialPageRoute(builder: (_) => ContestsScreen());
      case routeCreateTeam:
        return MaterialPageRoute(builder: (_) => CreateTeamScreen());
      case routeTeamPreview:
        return MaterialPageRoute(builder: (_) => TeamPreviewScreen());
      case routeMyProfile:
        return MaterialPageRoute(builder: (_) => MyProfileScreen());
      case routeTransactionHistory:
        return MaterialPageRoute(builder: (_) => TransactionHistoryScreen());
      case routeResultDetails:
        return MaterialPageRoute(builder: (_) => ResultDetails());
      case routeJoinedContestDetails:
        return MaterialPageRoute(builder: (_) => JoinedContestDetails());

      default:
        return null;
    }
  }
}
