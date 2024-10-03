class WalletModel {
  Wallet? _wallet;
  List<WalletDeposit>? _walletDeposit;
  List<WalletTransactions>? _walletTransactions;

  WalletModel(
      {Wallet? wallet,
      List<WalletDeposit>? walletDeposit,
      List<WalletTransactions>? walletTransactions}) {
    if (wallet != null) {
      _wallet = wallet;
    }
    if (walletDeposit != null) {
      _walletDeposit = walletDeposit;
    }
    if (walletTransactions != null) {
      _walletTransactions = walletTransactions;
    }
  }

  Wallet? get wallet => _wallet;

  set wallet(Wallet? wallet) => _wallet = wallet;

  List<WalletDeposit>? get walletDeposit => _walletDeposit;

  set walletDeposit(List<WalletDeposit>? walletDeposit) =>
      _walletDeposit = walletDeposit;

  List<WalletTransactions>? get walletTransactions => _walletTransactions;

  set walletTransactions(List<WalletTransactions>? walletTransactions) =>
      _walletTransactions = walletTransactions;

  WalletModel.fromJson(Map<String, dynamic> json) {
    _wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    if (json['wallet_deposit'] != null) {
      _walletDeposit = <WalletDeposit>[];
      json['wallet_deposit'].forEach((v) {
        _walletDeposit!.add(WalletDeposit.fromJson(v));
      });
    }
    if (json['wallet_transactions'] != null) {
      _walletTransactions = <WalletTransactions>[];
      json['wallet_transactions'].forEach((v) {
        _walletTransactions!.add(WalletTransactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_wallet != null) {
      data['wallet'] = _wallet!.toJson();
    }
    if (_walletDeposit != null) {
      data['wallet_deposit'] = _walletDeposit!.map((v) => v.toJson()).toList();
    }
    if (_walletTransactions != null) {
      data['wallet_transactions'] =
          _walletTransactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Wallet {
  int? _id;
  int? _customerId;
  String? _customerUuid;
  String? _walletNo;
  String? _customerTitle;
  dynamic balance;
  String? _createdAt;
  String? _updatedAt;

  Wallet(
      {int? id,
      int? customerId,
      String? customerUuid,
      String? walletNo,
      String? customerTitle,
      dynamic balance,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (customerId != null) {
      _customerId = customerId;
    }
    if (customerUuid != null) {
      _customerUuid = customerUuid;
    }
    if (walletNo != null) {
      _walletNo = walletNo;
    }
    if (customerTitle != null) {
      _customerTitle = customerTitle;
    }
    if (balance != null) {
      this.balance = balance;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get customerId => _customerId;

  set customerId(int? customerId) => _customerId = customerId;

  String? get customerUuid => _customerUuid;

  set customerUuid(String? customerUuid) => _customerUuid = customerUuid;

  String? get walletNo => _walletNo;

  set walletNo(String? walletNo) => _walletNo = walletNo;

  String? get customerTitle => _customerTitle;

  set customerTitle(String? customerTitle) => _customerTitle = customerTitle;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Wallet.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _customerUuid = json['customer_uuid'];
    _walletNo = json['wallet_no'];
    _customerTitle = json['customer_title'];
    balance = json['balance'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['customer_id'] = _customerId;
    data['customer_uuid'] = _customerUuid;
    data['wallet_no'] = _walletNo;
    data['customer_title'] = _customerTitle;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

class WalletDeposit {
  int? _id;
  int? _customerId;
  String? _customerTitle;
  String? _walletTxnTitle;
  String? _uuid;

  String? _customerUuid;
  String? _transactionCode;
  dynamic _amount;
  String? _dateTime;
  int? _createdBy;
  String? _createdAt;
  String? _updatedAt;

  WalletDeposit(
      {int? id,
      int? customerId,
      String? customerTitle,
      String? walletTxnTitle,
      String? uuid,
      String? customerUuid,
      String? transactionCode,
      dynamic amount,
      String? dateTime,
      int? createdBy,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (customerId != null) {
      _customerId = customerId;
    }
    if (customerTitle != null) {
      _customerTitle = customerTitle;
    }
    if (walletTxnTitle != null) {
      _walletTxnTitle = walletTxnTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }

    if (customerUuid != null) {
      _customerUuid = customerUuid;
    }

    if (transactionCode != null) {
      _transactionCode = transactionCode;
    }
    if (amount != null) {
      _amount = amount;
    }
    if (dateTime != null) {
      _dateTime = dateTime;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get customerId => _customerId;

  set customerId(int? customerId) => _customerId = customerId;

  String? get customerTitle => _customerTitle;

  set customerTitle(String? customerTitle) => _customerTitle = customerTitle;

  String? get walletTxnTitle => _walletTxnTitle;

  set walletTxnTitle(String? walletTxnTitle) =>
      _walletTxnTitle = walletTxnTitle;

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get customerUuid => _customerUuid;

  set customerUuid(String? customerUuid) => _customerUuid = customerUuid;

  String? get transactionCode => _transactionCode;

  set transactionCode(String? transactionCode) =>
      _transactionCode = transactionCode;

  dynamic get amount => _amount;

  set amount(dynamic amount) => _amount = amount;

  String? get dateTime => _dateTime;

  set dateTime(String? dateTime) => _dateTime = dateTime;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  WalletDeposit.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _customerTitle = json['customer_title'];
    _walletTxnTitle = json['wallet_txn_title'];
    _uuid = json['uuid'];
    _customerUuid = json['customer_uuid'];
    _transactionCode = json['transaction_code'];
    _amount = json['amount'];
    _dateTime = json['date_time'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['customer_id'] = _customerId;
    data['customer_title'] = _customerTitle;
    data['wallet_txn_title'] = _walletTxnTitle;
    data['uuid'] = _uuid;

    data['customer_uuid'] = _customerUuid;
    data['transaction_code'] = _transactionCode;
    data['amount'] = _amount;
    data['date_time'] = _dateTime;
    data['created_by'] = _createdBy;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

class WalletTransactions {
  int? _id;
  int? _customerId;
  String? _customerTitle;
  int? _paymentGatewayId;
  String? _paymentGatewayTitle;
  String? _currencyTitle;
  String? _uuid;
  String? _transactionCode;
  String? _customerUuid;
  String? _type;
  dynamic _debitAmount;
  dynamic _creditAmount;
  dynamic _balanceAmount;
  int? _createdBy;
  String? _createdAt;
  String? _updatedAt;

  WalletTransactions(
      {int? id,
      int? customerId,
      String? customerTitle,
      int? paymentGatewayId,
      String? paymentGatewayTitle,
      String? currencyTitle,
      String? uuid,
      String? transactionCode,
      String? customerUuid,
      String? type,
      dynamic debitAmount,
      dynamic creditAmount,
      dynamic balanceAmount,
      int? createdBy,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (customerId != null) {
      _customerId = customerId;
    }
    if (customerTitle != null) {
      _customerTitle = customerTitle;
    }
    if (paymentGatewayId != null) {
      _paymentGatewayId = paymentGatewayId;
    }
    if (paymentGatewayTitle != null) {
      _paymentGatewayTitle = paymentGatewayTitle;
    }
    if (currencyTitle != null) {
      _currencyTitle = currencyTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (transactionCode != null) {
      _transactionCode = transactionCode;
    }
    if (customerUuid != null) {
      _customerUuid = customerUuid;
    }
    if (type != null) {
      _type = type;
    }
    if (debitAmount != null) {
      _debitAmount = debitAmount;
    }
    if (creditAmount != null) {
      _creditAmount = creditAmount;
    }
    if (balanceAmount != null) {
      _balanceAmount = balanceAmount;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get customerId => _customerId;

  set customerId(int? customerId) => _customerId = customerId;

  String? get customerTitle => _customerTitle;

  set customerTitle(String? customerTitle) => _customerTitle = customerTitle;

  int? get paymentGatewayId => _paymentGatewayId;

  set paymentGatewayId(int? paymentGatewayId) =>
      _paymentGatewayId = paymentGatewayId;

  String? get paymentGatewayTitle => _paymentGatewayTitle;

  set paymentGatewayTitle(String? paymentGatewayTitle) =>
      _paymentGatewayTitle = paymentGatewayTitle;

  String? get currencyTitle => _currencyTitle;

  set currencyTitle(String? currencyTitle) => _currencyTitle = currencyTitle;

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get transactionCode => _transactionCode;

  set transactionCode(String? transactionCode) =>
      _transactionCode = transactionCode;

  String? get customerUuid => _customerUuid;

  set customerUuid(String? customerUuid) => _customerUuid = customerUuid;

  String? get type => _type;

  set type(String? type) => _type = type;

  dynamic get debitAmount => _debitAmount;

  set debitAmount(dynamic debitAmount) => _debitAmount = debitAmount;

  dynamic get creditAmount => _creditAmount;

  set creditAmount(dynamic creditAmount) => _creditAmount = creditAmount;

  dynamic get balanceAmount => _balanceAmount;

  set balanceAmount(dynamic balanceAmount) => _balanceAmount = balanceAmount;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  WalletTransactions.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _customerId = json['customer_id'];
    _customerTitle = json['customer_title'];
    _paymentGatewayId = json['payment_gateway_id'];
    _paymentGatewayTitle = json['payment_gateway_title'];
    _currencyTitle = json['currency_title'];
    _uuid = json['uuid'];
    _transactionCode = json['transaction_code'];
    _customerUuid = json['customer_uuid'];
    _type = json['type'];
    _debitAmount = json['debit_amount'];
    _creditAmount = json['credit_amount'];
    _balanceAmount = json['balance_amount'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['customer_id'] = _customerId;
    data['customer_title'] = _customerTitle;
    data['payment_gateway_id'] = _paymentGatewayId;
    data['payment_gateway_title'] = _paymentGatewayTitle;
    data['currency_title'] = _currencyTitle;
    data['uuid'] = _uuid;
    data['transaction_code'] = _transactionCode;
    data['customer_uuid'] = _customerUuid;
    data['type'] = _type;
    data['debit_amount'] = _debitAmount;
    data['credit_amount'] = _creditAmount;
    data['balance_amount'] = _balanceAmount;
    data['created_by'] = _createdBy;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
