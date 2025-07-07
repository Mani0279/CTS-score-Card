import 'package:ctsscore/screens/platform_return_tab.dart';
import 'package:ctsscore/screens/submit_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scorecard_provider.dart';
import 'basic_info_tab.dart';
import 'clean_train_tab.dart';

class ScoreCardForm extends StatefulWidget {
  @override
  _ScoreCardFormState createState() => _ScoreCardFormState();
}

class _ScoreCardFormState extends State<ScoreCardForm> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Score Card'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(text: 'Basic Info'),
            Tab(text: 'Clean Train'),
            Tab(text: 'Platform Return'),
            Tab(text: 'Submit'),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: TabBarView(
          controller: _tabController,
          children: [
            BasicInfoTab(),
            CleanTrainTab(),
            PlatformReturnTab(),
            SubmitTab(),
          ],
        ),
      ),
    );
  }
}
