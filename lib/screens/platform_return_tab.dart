import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class PlatformReturnTab extends StatelessWidget {
  final List<String> activities = [
    'Cleaning and wiping of toilet area',
    'Interior Cleaning of doorways, gangways, vestibules',
    'Cleaning & wiping of berths, panels, fixtures',
    'Floor cleaning under seats/berths',
    'Disposal of garbage'
  ];

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
                // Header Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.shade100,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.assignment_turned_in,
                            color: Colors.blue.shade600,
                            size: _getTitleFontSize(context),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Platform Return Activities',
                            style: TextStyle(
                              fontSize: _getTitleFontSize(context),
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.blue.shade600,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Maximum marks: 15 | Rating calculation: 12/15 × 100 = 80%',
                                style: TextStyle(
                                  fontSize: _getNoteFontSize(context),
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _getSpacing(context)),
                // Main Content
                _buildPlatformGrid(provider, context),
              ],
            ),
          ),
        );
      },
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

  double _getNoteFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 12; // Mobile
    } else if (screenWidth < 1200) {
      return 14; // Tablet
    } else {
      return 16; // Desktop
    }
  }

  double _getActivityColumnWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 140; // Mobile - narrower to fit more positions
    } else if (screenWidth < 1200) {
      return 200; // Tablet
    } else {
      return 250; // Desktop - wider
    }
  }

  double _getPositionColumnWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 25; // Mobile - narrower
    } else if (screenWidth < 1200) {
      return 30; // Tablet
    } else {
      return 35; // Desktop - wider
    }
  }

  double _getActivityFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 10; // Mobile
    } else if (screenWidth < 1200) {
      return 12; // Tablet
    } else {
      return 14; // Desktop
    }
  }

  double _getDropdownFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 8; // Mobile
    } else if (screenWidth < 1200) {
      return 10; // Tablet
    } else {
      return 12; // Desktop
    }
  }

  double _getHeaderFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 12; // Mobile
    } else if (screenWidth < 1200) {
      return 14; // Tablet
    } else {
      return 16; // Desktop
    }
  }

  Widget _buildPlatformGrid(ScoreCardProvider provider, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // For very small screens, use a different layout
    if (screenWidth < 500) {
      return _buildMobilePlatformGrid(provider, context);
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade600, Colors.blue.shade700],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: _getActivityColumnWidth(context),
                    child: Text(
                      'Activity',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _getHeaderFontSize(context),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ...List.generate(11, (index) =>
                      Container(
                        width: _getPositionColumnWidth(context),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: _getDropdownFontSize(context),
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ),
                ],
              ),
            ),
            // Activity Rows
            ...List.generate(5, (index) => _buildPlatformRow(
              'activity${index + 1}',
              activities[index],
              provider.data.platformReturnActivities['activity${index + 1}']!,
              provider,
              context,
              index,
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildMobilePlatformGrid(ScoreCardProvider provider, BuildContext context) {
    return Column(
      children: List.generate(5, (index) => _buildMobileActivityCard(
        'activity${index + 1}',
        activities[index],
        provider.data.platformReturnActivities['activity${index + 1}']!,
        provider,
        context,
        index,
      )),
    );
  }

  Widget _buildMobileActivityCard(String activityKey, String activityName,
      Map<String, int> positions, ScoreCardProvider provider, BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade500, Colors.blue.shade600],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.blue.shade600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    activityName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _getActivityFontSize(context) + 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Positions (1-11):',
                  style: TextStyle(
                    fontSize: _getActivityFontSize(context),
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: positions.entries.map((posEntry) =>
                      Container(
                        width: 50,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.blue.shade200),
                              ),
                              child: Text(
                                posEntry.key,
                                style: TextStyle(
                                  fontSize: _getDropdownFontSize(context),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.blue.shade200),
                              ),
                              child: DropdownButton<int>(
                                value: posEntry.value == 0 ? null : posEntry.value,
                                hint: Text('-', style: TextStyle(fontSize: _getDropdownFontSize(context), color: Colors.blue.shade400)),
                                items: List.generate(3, (index) =>
                                    DropdownMenuItem(
                                      value: index + 1,
                                      child: Text('${index + 1}',
                                          style: TextStyle(fontSize: _getDropdownFontSize(context))),
                                    ),
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    provider.updatePlatformReturnActivity(activityKey, posEntry.key, value);
                                  }
                                },
                                underline: SizedBox(),
                                isExpanded: true,
                                style: TextStyle(
                                    fontSize: _getDropdownFontSize(context),
                                    color: Colors.blue.shade800
                                ),
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
        ],
      ),
    );
  }

  Widget _buildPlatformRow(String activityKey, String activityName, Map<String, int> positions,
      ScoreCardProvider provider, BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.white : Colors.blue.shade200,
        border: Border(
          bottom: BorderSide(color: Colors.blue.shade100, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: _getActivityColumnWidth(context),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    activityName,
                    style: TextStyle(
                      fontSize: _getActivityFontSize(context),
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ...positions.entries.map((posEntry) =>
              Container(
                width: _getPositionColumnWidth(context),
                height: 44,
                padding: EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: DropdownButton<int>(
                    value: posEntry.value == 0 ? null : posEntry.value,
                    hint: Text('-', style: TextStyle(fontSize: _getDropdownFontSize(context), color: Colors.blue.shade400)),
                    items: List.generate(3, (index) =>
                        DropdownMenuItem(
                          value: index + 1,
                          child: Text('${index + 1}',
                              style: TextStyle(fontSize: _getDropdownFontSize(context))),
                        ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        provider.updatePlatformReturnActivity(activityKey, posEntry.key, value);
                      }
                    },
                    underline: SizedBox(),
                    isExpanded: true,
                    style: TextStyle(
                        fontSize: _getDropdownFontSize(context),
                        color: Colors.blue.shade800
                    ),
                  ),
                ),
              ),
          ).toList(),
        ],
      ),
    );
  }
}