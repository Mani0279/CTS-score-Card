class ScoreCardData {
  String workOrderNo = '';
  String date = '';
  String nameOfWork = '';
  String nameOfContractor = '';
  String supervisorName = '';
  String designation = '';
  String dateOfInspection = '';
  String trainNo = '';
  String arrivalTime = '';
  String depTime = '';
  int noOfCoaches = 0;
  int totalCoachesInTrain = 0;

  // Clean Train Station Activities scores
  Map<String, Map<String, int>> cleanTrainScores = {
    'T1': {}, 'T2': {}, 'T3': {}, 'T4': {},
    'B1': {}, 'B2': {},
    'D1': {}, 'D2': {},
  };

  // Platform Return Activities scores
  Map<String, int> platformReturnScores = {};

  Map<String, String> remarks = {};

  ScoreCardData() {
    // Initialize coach columns C1-C13
    for (int i = 1; i <= 13; i++) {
      String coach = 'C$i';
      cleanTrainScores[coach] = {};
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'workOrderNo': workOrderNo,
      'date': date,
      'nameOfWork': nameOfWork,
      'nameOfContractor': nameOfContractor,
      'supervisorName': supervisorName,
      'designation': designation,
      'dateOfInspection': dateOfInspection,
      'trainNo': trainNo,
      'arrivalTime': arrivalTime,
      'depTime': depTime,
      'noOfCoaches': noOfCoaches,
      'totalCoachesInTrain': totalCoachesInTrain,
      'cleanTrainScores': cleanTrainScores,
      'platformReturnScores': platformReturnScores,
      'remarks': remarks,
    };
  }
}
