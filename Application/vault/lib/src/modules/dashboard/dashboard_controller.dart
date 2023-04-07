import 'package:flutter/material.dart';

class DashBoardViewModel extends ChangeNotifier {
  bool timeStatsExpanded = true;
  bool bankAccountsExpande = true;

  void toggleTimeStats() {
    timeStatsExpanded = !timeStatsExpanded;
    notifyListeners();
  }

  void toggleBankAccounts() {
    bankAccountsExpande = !bankAccountsExpande;
    notifyListeners();
  }
}
