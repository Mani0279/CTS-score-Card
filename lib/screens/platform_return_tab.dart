import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class PlatformReturnTab extends StatelessWidget {
  final List<Map<String, dynamic>> platformActivities = [
    {'activity': 'Cleaning and wiping of toilet area', 'maxScore': 1},
    {'activity': 'Interior Cleaning of coaches', 'maxScore': 2},
    {'activity': 'Cleaning & wiping if required', 'maxScore': 3},
    {'activity': 'Floor including area under seats', 'maxScore': 3},
    {'activity': 'Disposal of garbage', 'maxScore': 3},
  ];

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
                'Platform Return Activities',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 20),
              ...platformActivities.map((activity) {
                return Card(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity['activity'],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text('Score (0-${activity['maxScore']}): '),
                            SizedBox(width: 10),
                            DropdownButton<int>(
                              value: provider.scoreCardData.platformReturnScores[activity['activity']] ?? 0,
                              items: List.generate(activity['maxScore'] + 1, (index) => index)
                                  .map((score) => DropdownMenuItem(
                                value: score,
                                child: Text(score.toString()),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  provider.updatePlatformReturnScore(activity['activity'], value);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              SizedBox(height: 20),
              Text(
                'Remarks',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter any remarks for Platform Return activities...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => provider.updateRemark('platformReturn', value),
              ),
            ],
          ),
        );
      },
    );
  }
}