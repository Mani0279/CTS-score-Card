import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class BasicInfoTab extends StatelessWidget {
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
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade500, Colors.blue.shade600],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: _getTitleFontSize(context),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Basic Information',
                        style: TextStyle(
                          fontSize: _getTitleFontSize(context),
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _getSpacing(context)),

                // Form Sections
                _buildSection(
                  'Work Order Details',
                  Icons.work_outline,
                  [
                    _buildTextField(
                      'Work Order No.',
                      provider.data.workOrderNo,
                          (value) => provider.updateBasicInfo(workOrderNo: value),
                      Icons.assignment,
                    ),
                    _buildTextField(
                      'Date',
                      provider.data.date,
                          (value) => provider.updateBasicInfo(date: value),
                      Icons.calendar_today,
                    ),
                    _buildTextField(
                      'Name of Work',
                      provider.data.nameOfWork,
                          (value) => provider.updateBasicInfo(nameOfWork: value),
                      Icons.construction,
                    ),
                  ],
                  context,
                ),

                SizedBox(height: _getSpacing(context)),

                _buildSection(
                  'Personnel Information',
                  Icons.people_outline,
                  [
                    _buildTextField(
                      'Name of Contractor',
                      provider.data.nameOfContractor,
                          (value) => provider.updateBasicInfo(nameOfContractor: value),
                      Icons.business,
                    ),
                    _buildTextField(
                      'Name of Supervisor',
                      provider.data.nameOfSupervisor,
                          (value) => provider.updateBasicInfo(nameOfSupervisor: value),
                      Icons.person,
                    ),
                    _buildTextField(
                      'Designation',
                      provider.data.designation,
                          (value) => provider.updateBasicInfo(designation: value),
                      Icons.badge,
                    ),
                  ],
                  context,
                ),

                SizedBox(height: _getSpacing(context)),

                _buildSection(
                  'Inspection & Train Details',
                  Icons.train_outlined,
                  [
                    _buildTextField(
                      'Date of Inspection',
                      provider.data.dateOfInspection,
                          (value) => provider.updateBasicInfo(dateOfInspection: value),
                      Icons.search,
                    ),
                    _buildTextField(
                      'Train No.',
                      provider.data.trainNo,
                          (value) => provider.updateBasicInfo(trainNo: value),
                      Icons.train,
                    ),
                    _buildTextField(
                      'Arrival Time',
                      provider.data.arrivalTime,
                          (value) => provider.updateBasicInfo(arrivalTime: value),
                      Icons.access_time,
                    ),
                    _buildTextField(
                      'Departure Time',
                      provider.data.depTime,
                          (value) => provider.updateBasicInfo(depTime: value),
                      Icons.access_time_filled,
                    ),
                    _buildNumberField(
                      'No. of Coaches',
                      provider.data.noOfCoaches,
                          (value) => provider.updateBasicInfo(noOfCoaches: value),
                      Icons.directions_railway,
                    ),
                    _buildNumberField(
                      'Total No. of Coaches',
                      provider.data.totalNoOfCoaches,
                          (value) => provider.updateBasicInfo(totalNoOfCoaches: value),
                      Icons.format_list_numbered,
                    ),
                  ],
                  context,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
      return 16; // Mobile
    } else if (screenWidth < 1200) {
      return 20; // Tablet
    } else {
      return 24; // Desktop
    }
  }

  double _getSectionTitleFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 16; // Mobile
    } else if (screenWidth < 1200) {
      return 18; // Tablet
    } else {
      return 20; // Desktop
    }
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children, BuildContext context) {
    return Container(
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
          // Section Header
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
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: _getSectionTitleFontSize(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Section Content
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String value, Function(String) onChanged, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade100),
        ),
        child: TextFormField(
          initialValue: value,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.blue.shade600,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: TextStyle(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.w500,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildNumberField(String label, int value, Function(int) onChanged, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue.shade100),
        ),
        child: TextFormField(
          initialValue: value.toString(),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.blue.shade700,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.blue.shade600,
              size: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
            ),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          style: TextStyle(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.w500,
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            int? intValue = int.tryParse(value);
            if (intValue != null) {
              onChanged(intValue);
            }
          },
        ),
      ),
    );
  }
}