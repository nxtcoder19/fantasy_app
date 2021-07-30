class CricketScheduleResponse {
  String match;
  int competitionId;
  String seriesName;
  String dateStart;
  String timeStart;
  String umpires;
  String referee;
  String venue;
  String location;
  String matchFormat;
  TeamLogo teamLogo;

  CricketScheduleResponse(
      {this.match,
      this.competitionId,
      this.seriesName,
      this.dateStart,
      this.timeStart,
      this.umpires,
      this.referee,
      this.venue,
      this.matchFormat,
      this.location,
      this.teamLogo});
}

class TeamLogo {
  A a;
  B b;

  TeamLogo({this.a, this.b});
}

class A {
  int teamId;
  String name;
  String shortName;
  String logoUrl;

  A({this.teamId, this.name, this.shortName, this.logoUrl});
}

class B {
  int teamId;
  String name;
  String shortName;
  String logoUrl;

  B({this.teamId, this.name, this.shortName, this.logoUrl});
}
