class ScoreCardData {
  // Basic Information
  String workOrderNo = '';
  String date = '';
  String nameOfWork = '';
  String nameOfContractor = '';
  String nameOfSupervisor = '';
  String designation = '';
  String dateOfInspection = '';
  String trainNo = '';
  String arrivalTime = '';
  String depTime = '';
  int noOfCoaches = 0;
  int totalNoOfCoaches = 0;
  double totalScoresObtained = 0.0;
  double inaccessibleX = 0.0;

  // Clean Train Station Activities
  Map<String, Map<String, int>> cleanTrainActivities = {
    'T1': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
    'T2': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
    'T3': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
    'T4': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
    'B1': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
    'B2': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
    'D1': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
    'D2': {'C1': 0, 'C2': 0, 'C3': 0, 'C4': 0, 'C5': 0, 'C6': 0, 'C7': 0, 'C8': 0, 'C9': 0, 'C10': 0, 'C11': 0, 'C12': 0, 'C13': 0},
  };

  // Platform Return Activities
  Map<String, Map<String, int>> platformReturnActivities = {
    'activity1': {'1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0, '7': 0, '8': 0, '9': 0, '10': 0, '11': 0},
    'activity2': {'1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0, '7': 0, '8': 0, '9': 0, '10': 0, '11': 0},
    'activity3': {'1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0, '7': 0, '8': 0, '9': 0, '10': 0, '11': 0},
    'activity4': {'1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0, '7': 0, '8': 0, '9': 0, '10': 0, '11': 0},
    'activity5': {'1': 0, '2': 0, '3': 0, '4': 0, '5': 0, '6': 0, '7': 0, '8': 0, '9': 0, '10': 0, '11': 0},
  };

  Map<String, dynamic> toJson() {
    return {
      'workOrderNo': workOrderNo,
      'date': date,
      'nameOfWork': nameOfWork,
      'nameOfContractor': nameOfContractor,
      'nameOfSupervisor': nameOfSupervisor,
      'designation': designation,
      'dateOfInspection': dateOfInspection,
      'trainNo': trainNo,
      'arrivalTime': arrivalTime,
      'depTime': depTime,
      'noOfCoaches': noOfCoaches,
      'totalNoOfCoaches': totalNoOfCoaches,
      'totalScoresObtained': totalScoresObtained,
      'inaccessibleX': inaccessibleX,
      'cleanTrainActivities': cleanTrainActivities,
      'platformReturnActivities': platformReturnActivities,
    };
  }
}