import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/scorecard_provider.dart';

class BasicInfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScoreCardProvider>(
      builder: (context, provider, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final width = MediaQuery.of(context).size.width;

            return SingleChildScrollView(
              padding: _getPadding(width),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(context, width),
                      SizedBox(height: _getSpacing(width)),
                      _buildSection(
                        'Work Order Details',
                        Icons.work_outline,
                        [
                          _buildTextField('Work Order No.', provider.data.workOrderNo,
                                  (value) => provider.updateBasicInfo(workOrderNo: value), Icons.assignment),
                          _buildTextField('Date', provider.data.date,
                                  (value) => provider.updateBasicInfo(date: value), Icons.calendar_today),
                          _buildTextField('Name of Work', provider.data.nameOfWork,
                                  (value) => provider.updateBasicInfo(nameOfWork: value), Icons.construction),
                        ],
                        context,
                        width,
                      ),
                      SizedBox(height: _getSpacing(width)),
                      _buildSection(
                        'Personnel Information',
                        Icons.people_outline,
                        [
                          _buildTextField('Name of Contractor', provider.data.nameOfContractor,
                                  (value) => provider.updateBasicInfo(nameOfContractor: value), Icons.business),
                          _buildTextField('Name of Supervisor', provider.data.nameOfSupervisor,
                                  (value) => provider.updateBasicInfo(nameOfSupervisor: value), Icons.person),
                          _buildTextField('Designation', provider.data.designation,
                                  (value) => provider.updateBasicInfo(designation: value), Icons.badge),
                        ],
                        context,
                        width,
                      ),
                      SizedBox(height: _getSpacing(width)),
                      _buildSection(
                        'Inspection & Train Details',
                        Icons.train_outlined,
                        [
                          _buildTextField('Date of Inspection', provider.data.dateOfInspection,
                                  (value) => provider.updateBasicInfo(dateOfInspection: value), Icons.search),
                          _buildTextField('Train No.', provider.data.trainNo,
                                  (value) => provider.updateBasicInfo(trainNo: value), Icons.train),
                          _buildTextField('Arrival Time', provider.data.arrivalTime,
                                  (value) => provider.updateBasicInfo(arrivalTime: value), Icons.access_time),
                          _buildTextField('Departure Time', provider.data.depTime,
                                  (value) => provider.updateBasicInfo(depTime: value), Icons.access_time_filled),
                          _buildNumberField('No. of Coaches', provider.data.noOfCoaches,
                                  (value) => provider.updateBasicInfo(noOfCoaches: value), Icons.directions_railway),
                          _buildNumberField('Total No. of Coaches', provider.data.totalNoOfCoaches,
                                  (value) => provider.updateBasicInfo(totalNoOfCoaches: value), Icons.format_list_numbered),
                        ],
                        context,
                        width,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, double width) {
    return Container(
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
              size: _getTitleFontSize(width),
            ),
          ),
          SizedBox(width: 16),
          Flexible(
            child: Text(
              'Basic Information',
              style: TextStyle(
                fontSize: _getTitleFontSize(width),
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children, BuildContext context, double width) {
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
                Icon(icon, color: Colors.white, size: 20),
                SizedBox(width: 12),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: _getSectionTitleFontSize(width),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: children),
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
            prefixIcon: Icon(icon, color: Colors.blue.shade600, size: 20),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
            ),
          ),
          style: TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.w500),
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
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon, color: Colors.blue.shade600, size: 20),
            filled: true,
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.blue.shade400, width: 2),
            ),
          ),
          style: TextStyle(color: Colors.blue.shade800, fontWeight: FontWeight.w500),
          onChanged: (value) {
            int? parsed = int.tryParse(value);
            if (parsed != null) {
              onChanged(parsed);
            }
          },
        ),
      ),
    );
  }

  EdgeInsets _getPadding(double width) {
    if (width < 600) return EdgeInsets.all(12);
    if (width < 1200) return EdgeInsets.all(16);
    return EdgeInsets.all(24);
  }

  double _getSpacing(double width) {
    if (width < 600) return 16;
    if (width < 1200) return 20;
    return 24;
  }

  double _getTitleFontSize(double width) {
    if (width < 600) return 18;
    if (width < 1200) return 20;
    return 24;
  }

  double _getSectionTitleFontSize(double width) {
    if (width < 600) return 16;
    if (width < 1200) return 18;
    return 20;
  }
}
