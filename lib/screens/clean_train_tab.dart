import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class CleanTrainTab extends StatelessWidget {
  final List<String> activities = [
    'Toilet cleaning complete',
    'Cleaning & wiping of outside washbasin',
    'Vestibule area, Doorway area',
    'Disposal of collected waste',
  ];

  final List<String> locations = [
    'T1', 'T2', 'T3', 'T4', 'B1', 'B2', 'D1', 'D2'
  ];

  final List<String> coaches = [
    'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'C10', 'C11', 'C12', 'C13'
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
                'Clean Train Station Activities',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Activity')),
                    DataColumn(label: Text('Location')),
                    ...coaches.map((coach) => DataColumn(label: Text(coach))).toList(),
                  ],
                  rows: _buildActivityRows(provider),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Remarks',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter any remarks for Clean Train activities...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) => provider.updateRemark('cleanTrain', value),
              ),
            ],
          ),
        );
      },
    );
  }

  List<DataRow> _buildActivityRows(ScoreCardProvider provider) {
    List<DataRow> rows = [];

    for (int i = 0; i < activities.length; i++) {
      String activity = activities[i];
      List<String> activityLocations = _getLocationsForActivity(i);

      for (String location in activityLocations) {
        rows.add(
          DataRow(
            cells: [
              DataCell(Text(activity)),
              DataCell(Text(location)),
              ...coaches.map((coach) {
                return DataCell(
                  _buildScoreDropdown(provider, activity, location, coach),
                );
              }).toList(),
            ],
          ),
        );
      }
    }

    return rows;
  }

  List<String> _getLocationsForActivity(int activityIndex) {
    switch (activityIndex) {
      case 0: // Toilet cleaning
        return ['T1', 'T2', 'T3', 'T4'];
      case 1: // Outside washbasin
        return ['T1', 'T2', 'T3', 'T4'];
      case 2: // Vestibule/Doorway
        return ['B1', 'B2', 'D1', 'D2'];
      case 3: // Disposal
        return ['General'];
      default:
        return ['General'];
    }
  }

  Widget _buildScoreDropdown(ScoreCardProvider provider, String activity, String location, String coach) {
    return DropdownButton<int>(
      value: provider.scoreCardData.cleanTrainScores[coach]?[location] ?? 0,
      items: List.generate(11, (index) => index)
          .map((score) => DropdownMenuItem(
        value: score,
        child: Text(score.toString()),
      ))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          provider.updateCleanTrainScore(activity, coach, value);
        }
      },
    );
  }
}
