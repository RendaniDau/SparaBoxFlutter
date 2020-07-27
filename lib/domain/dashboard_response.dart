import 'package:sparabox/domain/transaction.dart';

class DashboardResponse {
  bool _accountLinked;
  double _availableBalance;
  double _spentToday;
  List<Transaction> _recentTransactions;

  DashboardResponse(this._accountLinked,
      this._availableBalance,
      this._spentToday,
      this._recentTransactions);

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    Iterable l = json['recentTransactions'];
    List<Transaction> transactions = l
        .map((e) => Transaction.fromJson(e))
        .toList();

    return DashboardResponse(
        json['accountLinked'],
        json['availableBalance'],
        json['spentToday'],
        transactions);
  }

  List<Transaction> get recentTransactions => _recentTransactions;

  double get spentToday => _spentToday;

  double get availableBalance => _availableBalance;

  bool get accountLinked => _accountLinked;

}