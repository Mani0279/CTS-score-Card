import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class CleanTrainTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreCardProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade50,
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: _getPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: _getSpacing(context)),
                _buildActivityDescription(context),
                SizedBox(height: _getSpacing(context)),
                _buildScoringGrid(provider, context),
                SizedBox(height: _getSpacing(context)),
                _buildScoreCard(provider, context),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.cleaning_services,
              color: Colors.white,
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Clean Train Station',
                  style: TextStyle(
                    fontSize: _getTitleFontSize(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Activities Evaluation',
                  style: TextStyle(
                    fontSize: _getSubtitleFontSize(context) - 2,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCard(ScoreCardProvider provider, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade50, Colors.green.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade100.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.score,
              color: Colors.white,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Score',
                  style: TextStyle(
                    fontSize: _getSubtitleFontSize(context),
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${provider.data.totalScoresObtained.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: _getTitleFontSize(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Media query helper methods
  EdgeInsets _getPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return EdgeInsets.all(12); // Mobile
    } else if (screenWidth < 1200) {
      return EdgeInsets.all(16); // Tablet
    } else {
      return EdgeInsets.all(24); // Desktop
    }
  }

  double _getTitleFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 18; // Mobile
    } else if (screenWidth < 1200) {
      return 20; // Tablet
    } else {
      return 24; // Desktop
    }
  }

  double _getSubtitleFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 14; // Mobile
    } else if (screenWidth < 1200) {
      return 16; // Tablet
    } else {
      return 18; // Desktop
    }
  }

  double _getSpacing(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 12; // Mobile
    } else if (screenWidth < 1200) {
      return 16; // Tablet
    } else {
      return 20; // Desktop
    }
  }

  double _getAreaColumnWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 50; // Mobile - narrower
    } else if (screenWidth < 1200) {
      return 60; // Tablet
    } else {
      return 80; // Desktop - wider
    }
  }

  double _getCoachColumnWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 28; // Mobile - narrower
    } else if (screenWidth < 1200) {
      return 35; // Tablet
    } else {
      return 45; // Desktop - wider
    }
  }

  Widget _buildActivityDescription(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.list_alt,
                  color: Colors.blue.shade700,
                  size: 20,
                ),
              ),
              SizedBox(width: 12),
              Text(
                'Activities',
                style: TextStyle(
                  fontSize: _getSubtitleFontSize(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildActivityItem('1. Toilet cleaning (T1, T2, T3, T4)', Icons.wc, context),
          _buildActivityItem('2. Cleaning & wiping of outside washbasin, mirror & shelves', Icons.cleaning_services, context),
          _buildActivityItem('3. Vestibule area, Doorway area (B1, B2, D1, D2)', Icons.door_front_door, context),
          _buildActivityItem('4. Disposal of collected waste from Coaches & AC Bins', Icons.delete, context),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber.shade700, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Scoring: Rate each item on a scale of 1-10',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: _getBodyFontSize(context),
                      color: Colors.amber.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String text, IconData icon, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade600),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: _getBodyFontSize(context),
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getBodyFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 12; // Mobile
    } else if (screenWidth < 1200) {
      return 14; // Tablet
    } else {
      return 16; // Desktop
    }
  }

  Widget _buildScoringGrid(ScoreCardProvider provider, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // For very small screens, use a different layout
    if (screenWidth < 500) {
      return _buildMobileScoringGrid(provider, context);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Colors.blue.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: _getAreaColumnWidth(context),
                      child: Text(
                        'Area',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _getBodyFontSize(context),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ...List.generate(13, (index) =>
                        Container(
                          width: _getCoachColumnWidth(context),
                          child: Text(
                            'C${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: _getBodyFontSize(context) - 2,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              // Scoring Rows
              ...provider.data.cleanTrainActivities.entries.map((entry) =>
                  _buildScoringRow(entry.key, entry.value, provider, context)
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileScoringGrid(ScoreCardProvider provider, BuildContext context) {
    return Column(
      children: provider.data.cleanTrainActivities.entries.map((entry) =>
          _buildMobileActivityCard(entry.key, entry.value, provider, context)
      ).toList(),
    );
  }

  Widget _buildMobileActivityCard(String activity, Map<String, int> coaches,
      ScoreCardProvider provider, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade50, Colors.blue.shade100],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                activity,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: _getSubtitleFontSize(context),
                  color: Colors.blue.shade800,
                ),
              ),
            ),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: coaches.entries.map((coachEntry) =>
                  Container(
                    width: 70,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      children: [
                        Text(
                          coachEntry.key,
                          style: TextStyle(
                            fontSize: _getBodyFontSize(context) - 2,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButton<int>(
                            value: coachEntry.value == 0 ? null : coachEntry.value,
                            hint: Text('-', style: TextStyle(fontSize: 12)),
                            items: List.generate(10, (index) =>
                                DropdownMenuItem(
                                  value: index + 1,
                                  child: Text('${index + 1}',
                                      style: TextStyle(fontSize: 12)),
                                ),
                            ),
                            onChanged: (value) {
                              if (value != null) {
                                provider.updateCleanTrainActivity(activity, coachEntry.key, value);
                              }
                            },
                            underline: SizedBox(),
                            isExpanded: true,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoringRow(String activity, Map<String, int> coaches,
      ScoreCardProvider provider, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        children: [
          Container(
            width: _getAreaColumnWidth(context),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
            ),
            child: Text(
              activity,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: _getBodyFontSize(context),
                color: Colors.grey.shade800,
              ),
            ),
          ),
          ...coaches.entries.map((coachEntry) =>
              Container(
                width: _getCoachColumnWidth(context),
                height: 50,
                padding: EdgeInsets.all(4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: DropdownButton<int>(
                    value: coachEntry.value == 0 ? null : coachEntry.value,
                    hint: Text('-', style: TextStyle(fontSize: 12)),
                    items: List.generate(10, (index) =>
                        DropdownMenuItem(
                          value: index + 1,
                          child: Text('${index + 1}', style: TextStyle(fontSize: 12)),
                        ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        provider.updateCleanTrainActivity(activity, coachEntry.key, value);
                      }
                    },
                    underline: SizedBox(),
                    isExpanded: true,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
          ).toList(),
        ],
      ),
    );
  }
}