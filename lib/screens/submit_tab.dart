import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class SubmitTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreCardProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review & Submit',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 10),
                      Text('Work Order: ${provider.scoreCardData.workOrderNo}'),
                      Text('Train No: ${provider.scoreCardData.trainNo}'),
                      Text('Date: ${provider.scoreCardData.date}'),
                      Text('Contractor: ${provider.scoreCardData.nameOfContractor}'),
                      Text('Supervisor: ${provider.scoreCardData.supervisorName}'),
                      SizedBox(height: 10),
                      Text('Clean Train Activities Completed: ${provider.scoreCardData.cleanTrainScores.values.where((scores) => scores.isNotEmpty).length}'),
                      Text('Platform Return Activities Completed: ${provider.scoreCardData.platformReturnScores.length}'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (provider.submitStatus.isNotEmpty)
                Card(
                  color: provider.submitStatus.contains('Success') ? Colors.green[100] : Colors.red[100],
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      provider.submitStatus,
                      style: TextStyle(
                        color: provider.submitStatus.contains('Success') ? Colors.green[800] : Colors.red[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: provider.isLoading ? null : () => provider.submitScoreCard(),
                      child: provider.isLoading
                          ? CircularProgressIndicator()
                          : Text('Submit Score Card'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _showClearDialog(context, provider),
                      child: Text('Clear Form'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showClearDialog(BuildContext context, ScoreCardProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Clear Form'),
          content: Text('Are you sure you want to clear all form data?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                provider.clearForm();
                Navigator.of(context).pop();
              },
              child: Text('Clear'),
            ),
          ],
        );
      },
    );
  }
}