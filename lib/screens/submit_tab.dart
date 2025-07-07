import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class SubmitTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreCardProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Container(
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
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 24),
                  _buildSummaryCard(context, provider),
                  SizedBox(height: 20),
                  _buildCleanTrainSummaryCard(context, provider),
                  SizedBox(height: 20),
                  _buildPlatformReturnSummaryCard(context, provider),
                  SizedBox(height: 30),
                  _buildActionButtons(context, provider),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade700,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade200,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.assignment_turned_in, color: Colors.white, size: 28),
              SizedBox(width: 12),
              Text(
                'Review & Submit',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Please review all information before submitting',
            style: TextStyle(fontSize: 14, color: Colors.blue.shade100),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, ScoreCardProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.summarize,
                    color: Colors.blue.shade700,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Basic Info Grid
            _buildInfoGrid([
              _buildInfoItem('Work Order', provider.data.workOrderNo),
              _buildInfoItem('Train No', provider.data.trainNo),
              _buildInfoItem('Date', provider.data.date),
              _buildInfoItem('Contractor', provider.data.nameOfContractor),
              _buildInfoItem('Supervisor', provider.data.nameOfSupervisor),
              _buildInfoItem('Designation', provider.data.designation),
              _buildInfoItem('Date of Inspection', provider.data.dateOfInspection),
              _buildInfoItem('Arrival Time', provider.data.arrivalTime),
              _buildInfoItem('Departure Time', provider.data.depTime),
              _buildInfoItem('No of Coaches', provider.data.noOfCoaches.toString()),
              _buildInfoItem('Total No of Coaches', provider.data.totalNoOfCoaches.toString()),
            ]),

            SizedBox(height: 20),
            Divider(color: Colors.blue.shade100),
            SizedBox(height: 15),

            // Score Summary
            Row(
              children: [
                Expanded(
                  child: _buildScoreCard(
                    'Total Score',
                    provider.data.totalScoresObtained.toStringAsFixed(2),
                    Icons.star,
                    Colors.amber,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildScoreCard(
                    'Inaccessible Areas',
                    provider.data.inaccessibleX.toString(),
                    Icons.block,
                    Colors.red,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _buildScoreCard(
                    'Clean Train Activities',
                    '${_getCompletedCleanTrainActivities(provider)}',
                    Icons.clean_hands,
                    Colors.green,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildScoreCard(
                    'Platform Return Activities',
                    '${_getCompletedPlatformReturnActivities(provider)}',
                    Icons.assignment_return,
                    Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCleanTrainSummaryCard(BuildContext context, ScoreCardProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.train,
                    color: Colors.blue.shade700,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Clean Train Activities Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ..._buildCleanTrainSummary(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformReturnSummaryCard(BuildContext context, ScoreCardProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade100,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.featured_play_list_sharp,
                    color: Colors.blue.shade700,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Platform Return Activities Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ..._buildPlatformReturnSummary(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, ScoreCardProvider provider) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade600, Colors.blue.shade700],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade300,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => _submitForm(context, provider),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cloud_upload, color: Colors.white),
                SizedBox(width: 12),
                Text(
                  'Submit Score Card',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () => _showClearDialog(context, provider),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue.shade600, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.clear_all, color: Colors.blue.shade600),
                SizedBox(width: 12),
                Text(
                  'Clear Form',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoGrid(List<Widget> items) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isSmallScreen = screenWidth < 360;

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: isSmallScreen ? 2.2 : 2.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => items[index],
        );
      },
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.blue.shade600,
            ),
          ),
          SizedBox(height: 2),
          Flexible(
            child: Text(
              value.isEmpty ? 'N/A' : value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 11,
              color: Colors.blue.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  int _getCompletedCleanTrainActivities(ScoreCardProvider provider) {
    int completed = 0;
    provider.data.cleanTrainActivities.forEach((activity, coaches) {
      coaches.forEach((coach, score) {
        if (score > 0) completed++;
      });
    });
    return completed;
  }

  int _getCompletedPlatformReturnActivities(ScoreCardProvider provider) {
    int completed = 0;
    provider.data.platformReturnActivities.forEach((activity, positions) {
      positions.forEach((position, score) {
        if (score > 0) completed++;
      });
    });
    return completed;
  }

  List<Widget> _buildCleanTrainSummary(ScoreCardProvider provider) {
    List<Widget> widgets = [];
    provider.data.cleanTrainActivities.forEach((activity, coaches) {
      int completedCoaches = coaches.values.where((score) => score > 0).length;
      double avgScore = coaches.values.where((score) => score > 0).isNotEmpty
          ? coaches.values.where((score) => score > 0).reduce((a, b) => a + b) / coaches.values.where((score) => score > 0).length
          : 0.0;

      widgets.add(
        Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '$activity: $completedCoaches/13 coaches',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Avg: ${avgScore.toStringAsFixed(1)}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
    return widgets;
  }

  List<Widget> _buildPlatformReturnSummary(ScoreCardProvider provider) {
    List<Widget> widgets = [];
    provider.data.platformReturnActivities.forEach((activity, positions) {
      int completedPositions = positions.values.where((score) => score > 0).length;
      double avgScore = positions.values.where((score) => score > 0).isNotEmpty
          ? positions.values.where((score) => score > 0).reduce((a, b) => a + b) / positions.values.where((score) => score > 0).length
          : 0.0;

      widgets.add(
        Container(
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '$activity: $completedPositions/11 positions',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Avg: ${avgScore.toStringAsFixed(1)}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
    return widgets;
  }

  void _submitForm(BuildContext context, ScoreCardProvider provider) async {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          content: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade700),
                ),
                SizedBox(width: 20),
                Text(
                  'Submitting...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade800,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    try {
      await provider.submitForm();

      // Close loading dialog
      Navigator.of(context).pop();

      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 28),
                SizedBox(width: 12),
                Text(
                  'Success',
                  style: TextStyle(color: Colors.blue.shade800),
                ),
              ],
            ),
            content: Text(
              'Score card submitted successfully!',
              style: TextStyle(color: Colors.blue.shade700),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Close loading dialog
      Navigator.of(context).pop();

      // Show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                Icon(Icons.error, color: Colors.red, size: 28),
                SizedBox(width: 12),
                Text(
                  'Error',
                  style: TextStyle(color: Colors.blue.shade800),
                ),
              ],
            ),
            content: Text(
              'Failed to submit score card. Please try again.',
              style: TextStyle(color: Colors.blue.shade700),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _showClearDialog(BuildContext context, ScoreCardProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange, size: 28),
              SizedBox(width: 12),
              Text(
                'Clear Form',
                style: TextStyle(color: Colors.blue.shade800),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to clear all form data?',
            style: TextStyle(color: Colors.blue.shade700),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue.shade600,
              ),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // You'll need to add a clearForm() method to your provider
                // For now, we'll call individual update methods to reset values
                provider.updateBasicInfo(
                  workOrderNo: '',
                  date: '',
                  nameOfWork: '',
                  nameOfContractor: '',
                  nameOfSupervisor: '',
                  designation: '',
                  dateOfInspection: '',
                  trainNo: '',
                  arrivalTime: '',
                  depTime: '',
                  noOfCoaches: 0,
                  totalNoOfCoaches: 0,
                );

                // Reset all clean train activities
                provider.data.cleanTrainActivities.forEach((activity, coaches) {
                  coaches.forEach((coach, score) {
                    provider.updateCleanTrainActivity(activity, coach, 0);
                  });
                });

                // Reset all platform return activities
                provider.data.platformReturnActivities.forEach((activity, positions) {
                  positions.forEach((position, score) {
                    provider.updatePlatformReturnActivity(activity, position, 0);
                  });
                });

                Navigator.of(context).pop();

                // Show confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Form cleared successfully'),
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Clear'),
            ),
          ],
        );
      },
    );
  }
}