import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/scorecard_data.dart';

class ScoreCardProvider with ChangeNotifier {
  ScoreCardData _scoreCardData = ScoreCardData();
  bool _isLoading = false;
  String _submitStatus = '';

  ScoreCardData get scoreCardData => _scoreCardData;
  bool get isLoading => _isLoading;
  String get submitStatus => _submitStatus;

  void updateBasicInfo({
    String? workOrderNo,
    String? date,
    String? nameOfWork,
    String? nameOfContractor,
    String? supervisorName,
    String? designation,
    String? dateOfInspection,
    String? trainNo,
    String? arrivalTime,
    String? depTime,
    int? noOfCoaches,
    int? totalCoachesInTrain,
  }) {
    if (workOrderNo != null) _scoreCardData.workOrderNo = workOrderNo;
    if (date != null) _scoreCardData.date = date;
    if (nameOfWork != null) _scoreCardData.nameOfWork = nameOfWork;
    if (nameOfContractor != null) _scoreCardData.nameOfContractor = nameOfContractor;
    if (supervisorName != null) _scoreCardData.supervisorName = supervisorName;
    if (designation != null) _scoreCardData.designation = designation;
    if (dateOfInspection != null) _scoreCardData.dateOfInspection = dateOfInspection;
    if (trainNo != null) _scoreCardData.trainNo = trainNo;
    if (arrivalTime != null) _scoreCardData.arrivalTime = arrivalTime;
    if (depTime != null) _scoreCardData.depTime = depTime;
    if (noOfCoaches != null) _scoreCardData.noOfCoaches = noOfCoaches;
    if (totalCoachesInTrain != null) _scoreCardData.totalCoachesInTrain = totalCoachesInTrain;
    notifyListeners();
  }

  void updateCleanTrainScore(String activity, String location, int score) {
    if (!_scoreCardData.cleanTrainScores.containsKey(location)) {
      _scoreCardData.cleanTrainScores[location] = {};
    }
    _scoreCardData.cleanTrainScores[location]![activity] = score;
    notifyListeners();
  }

  void updatePlatformReturnScore(String activity, int score) {
    _scoreCardData.platformReturnScores[activity] = score;
    notifyListeners();
  }

  void updateRemark(String field, String remark) {
    _scoreCardData.remarks[field] = remark;
    notifyListeners();
  }

  Future<void> submitScoreCard() async {
    _isLoading = true;
    _submitStatus = '';
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('https://httpbin.org/post'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(_scoreCardData.toJson()),
      );

      if (response.statusCode == 200) {
        _submitStatus = 'Successfully submitted!';
      } else {
        _submitStatus = 'Failed to submit. Please try again.';
      }
    } catch (e) {
      _submitStatus = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearForm() {
    _scoreCardData = ScoreCardData();
    _submitStatus = '';
    notifyListeners();
  }
}