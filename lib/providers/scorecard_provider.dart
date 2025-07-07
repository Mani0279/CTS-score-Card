import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/scorecard_data.dart';

class ScoreCardProvider extends ChangeNotifier {
  ScoreCardData _data = ScoreCardData();
  int _currentTabIndex = 0;

  ScoreCardData get data => _data;
  int get currentTabIndex => _currentTabIndex;

  void updateBasicInfo({
    String? workOrderNo,
    String? date,
    String? nameOfWork,
    String? nameOfContractor,
    String? nameOfSupervisor,
    String? designation,
    String? dateOfInspection,
    String? trainNo,
    String? arrivalTime,
    String? depTime,
    int? noOfCoaches,
    int? totalNoOfCoaches,
  }) {
    if (workOrderNo != null) _data.workOrderNo = workOrderNo;
    if (date != null) _data.date = date;
    if (nameOfWork != null) _data.nameOfWork = nameOfWork;
    if (nameOfContractor != null) _data.nameOfContractor = nameOfContractor;
    if (nameOfSupervisor != null) _data.nameOfSupervisor = nameOfSupervisor;
    if (designation != null) _data.designation = designation;
    if (dateOfInspection != null) _data.dateOfInspection = dateOfInspection;
    if (trainNo != null) _data.trainNo = trainNo;
    if (arrivalTime != null) _data.arrivalTime = arrivalTime;
    if (depTime != null) _data.depTime = depTime;
    if (noOfCoaches != null) _data.noOfCoaches = noOfCoaches;
    if (totalNoOfCoaches != null) _data.totalNoOfCoaches = totalNoOfCoaches;
    notifyListeners();
  }

  void updateCleanTrainActivity(String activity, String coach, int score) {
    _data.cleanTrainActivities[activity]![coach] = score;
    _calculateTotalScore();
    notifyListeners();
  }

  void updatePlatformReturnActivity(String activity, String position, int score) {
    _data.platformReturnActivities[activity]![position] = score;
    notifyListeners();
  }

  void _calculateTotalScore() {
    double total = 0.0;
    int count = 0;

    _data.cleanTrainActivities.forEach((activity, coaches) {
      coaches.forEach((coach, score) {
        if (score > 0) {
          total += score;
          count++;
        }
      });
    });

    _data.platformReturnActivities.forEach((activity, positions) {
      positions.forEach((position, score) {
        if (score > 0) {
          total += score;
          count++;
        }
      });
    });

    _data.totalScoresObtained = count > 0 ? total / count : 0.0;
  }

  void setCurrentTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void nextTab() {
    if (_currentTabIndex < 2) {
      _currentTabIndex++;
      notifyListeners();
    }
  }

  void previousTab() {
    if (_currentTabIndex > 0) {
      _currentTabIndex--;
      notifyListeners();
    }
  }

  Future<void> submitForm() async {
    try {
      final response = await http.post(
        Uri.parse('https://httpbin.org/post'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(_data.toJson()),
      );

      if (response.statusCode == 200) {
        print('Form submitted successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to submit form');
      }
    } catch (e) {
      print('Error submitting form: $e');
    }
  }
  // Add this method to your ScoreCardProvider class
  void clearForm() {
    _data = ScoreCardData();
    _currentTabIndex = 0;
    notifyListeners();
  }
}
