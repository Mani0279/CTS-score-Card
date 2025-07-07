# ctsscore

Digital Score Card Flutter App
A Flutter application for Clean Train Station Inspection Score Card form digitization. 
This app replicates the paper-based score card system used for railway station cleanliness inspection.

lib/
├── main.dart                 # Main app entry point
|
├── models/
│   └── score_card_data.dart  # Data models
├── providers/
│   └── score_card_provider.dart # State management
├── screens/
│   ├── basic_info_tab.dart   # Basic information form
│   ├── clean_train_tab.dart  # Clean train activities
│   ├── platform_return_tab.dart # Platform return activities
│   └── submit_tab.dart       # Review and submit
└── widgets/
└── common_widgets.dart   # Reusable UI components

1. Basic Information Tab
   Captures essential details:

Work Order Number
Date of inspection
Name of work and contractor
Supervisor details
Train information (number, arrival/departure times)
Coach counts

2. Clean Train Station Activities Tab
   Scoring grid for cleanliness activities:

Toilets (T1-T4): Cleaning completion, equipment usage
Vestibule Areas (B1-B2): Area cleanliness
Doorway Areas (D1-D2): Entrance/exit cleanliness
Coaches (C1-C13): Individual coach scoring
Score range: 0-10 for each parameter

3. Platform Return Activities Tab
   Platform-specific cleaning activities:

Toilet area cleaning and wiping
Interior coach cleaning
Floor cleaning including under seats
Garbage disposal
Each activity has specific max scores (1-3 points)

4. Submit Tab

Form summary review
Submission to mock API endpoint
Success/error status display
Clear form option