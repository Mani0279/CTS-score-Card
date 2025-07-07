import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';

class BasicInfoTab extends StatelessWidget {
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
                'Basic Information',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 20),
              _buildTextField(
                label: 'Work Order No.',
                value: provider.scoreCardData.workOrderNo,
                onChanged: (value) => provider.updateBasicInfo(workOrderNo: value),
              ),
              _buildTextField(
                label: 'Date',
                value: provider.scoreCardData.date,
                onChanged: (value) => provider.updateBasicInfo(date: value),
              ),
              _buildTextField(
                label: 'Name of Work',
                value: provider.scoreCardData.nameOfWork,
                onChanged: (value) => provider.updateBasicInfo(nameOfWork: value),
              ),
              _buildTextField(
                label: 'Name of Contractor',
                value: provider.scoreCardData.nameOfContractor,
                onChanged: (value) => provider.updateBasicInfo(nameOfContractor: value),
              ),
              _buildTextField(
                label: 'Supervisor Name',
                value: provider.scoreCardData.supervisorName,
                onChanged: (value) => provider.updateBasicInfo(supervisorName: value),
              ),
              _buildTextField(
                label: 'Designation',
                value: provider.scoreCardData.designation,
                onChanged: (value) => provider.updateBasicInfo(designation: value),
              ),
              _buildTextField(
                label: 'Date of Inspection',
                value: provider.scoreCardData.dateOfInspection,
                onChanged: (value) => provider.updateBasicInfo(dateOfInspection: value),
              ),
              _buildTextField(
                label: 'Train No.',
                value: provider.scoreCardData.trainNo,
                onChanged: (value) => provider.updateBasicInfo(trainNo: value),
              ),
              _buildTextField(
                label: 'Arrival Time',
                value: provider.scoreCardData.arrivalTime,
                onChanged: (value) => provider.updateBasicInfo(arrivalTime: value),
              ),
              _buildTextField(
                label: 'Departure Time',
                value: provider.scoreCardData.depTime,
                onChanged: (value) => provider.updateBasicInfo(depTime: value),
              ),
              _buildNumberField(
                label: 'No. of Coaches attended by contractor',
                value: provider.scoreCardData.noOfCoaches,
                onChanged: (value) => provider.updateBasicInfo(noOfCoaches: value),
              ),
              _buildNumberField(
                label: 'Total No. of Coaches in the train',
                value: provider.scoreCardData.totalCoachesInTrain,
                onChanged: (value) => provider.updateBasicInfo(totalCoachesInTrain: value),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildNumberField({
    required String label,
    required int value,
    required Function(int) onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: value.toString(),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          int? intValue = int.tryParse(value);
          if (intValue != null) {
            onChanged(intValue);
          }
        },
      ),
    );
  }
}