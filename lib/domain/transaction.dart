class Transaction {
  int _transactionId;
  String _cardNumber;
  int _amount;
  String _currencyCode;
  String _merchantName;
  DateTime _transactionDateTime;

  Transaction(
      this._transactionId,
      this._cardNumber,
      this._amount,
      this._currencyCode,
      this._merchantName,
      this._transactionDateTime
      );

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        json['transactionId'],
        json['card'],
        json['amount'],
        json['currencyCode'],
        json['merchantName'],
        DateTime.parse(json['transactionDateTime']));
  }
}