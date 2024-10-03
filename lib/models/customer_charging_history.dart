class CustomerTransactionHistory {
  int? _status;
  bool? _success;
  List<CustomerChargingHistoryData>? _data;

  CustomerTransactionHistory({int? status, bool? success, List<CustomerChargingHistoryData>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (success != null) {
      this._success = success;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get status => _status;
  set status(int? status) => _status = status;
  bool? get success => _success;
  set success(bool? success) => _success = success;
  List<CustomerChargingHistoryData>? get data => _data;
  set data(List<CustomerChargingHistoryData>? data) => _data = data;

  CustomerTransactionHistory.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = <CustomerChargingHistoryData>[];
      json['data'].forEach((v) {
        _data!.add(new CustomerChargingHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['success'] = this._success;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerChargingHistoryData {
  int? _id;
  int? _chargerpointId;
  String? _chargerpointTitle;
  int? _ocpptagId;
  String? _ocpptagTitle;
  int? _connectorId;
  String? _connectorTitle;
  int? _customerId;
  String? _customerTitle;
  String? _uuid;
  String? _title;
  String? _chargerpointUuid;
  String? _ocpptagUuid;
  String? _connectorUuid;
  String? _customerUuid;
  String? _idTag;

  String? _stopValue;
  String? _stopReason;
  String? _totalValueWt;
  String? _totalValueKwt;
  int? _unitPrice;
  int? _totalPrice;

  String? _createdAt;
  String? _updatedAt;
  String? _isInvoice;

  CustomerTransactionHistory(
      {int? id,
        int? chargerpointId,
        String? chargerpointTitle,
        int? ocpptagId,
        String? ocpptagTitle,
        int? connectorId,
        String? connectorTitle,
        int? customerId,
        String? customerTitle,
        String? uuid,
        String? title,
        String? chargerpointUuid,
        String? ocpptagUuid,
        String? connectorUuid,
        String? customerUuid,
        String? idTag,

        String? stopValue,
        String? stopReason,
        String? totalValueWt,
        String? totalValueKwt,
        int? unitPrice,
        int? totalPrice,
        int? createdBy,

        String? createdAt,
        String? updatedAt,
        String? isInvoice}) {
    if (id != null) {
      this._id = id;
    }
    if (chargerpointId != null) {
      this._chargerpointId = chargerpointId;
    }
    if (chargerpointTitle != null) {
      this._chargerpointTitle = chargerpointTitle;
    }
    if (ocpptagId != null) {
      this._ocpptagId = ocpptagId;
    }
    if (ocpptagTitle != null) {
      this._ocpptagTitle = ocpptagTitle;
    }
    if (connectorId != null) {
      this._connectorId = connectorId;
    }
    if (connectorTitle != null) {
      this._connectorTitle = connectorTitle;
    }
    if (customerId != null) {
      this._customerId = customerId;
    }
    if (customerTitle != null) {
      this._customerTitle = customerTitle;
    }
    if (uuid != null) {
      this._uuid = uuid;
    }
    if (title != null) {
      this._title = title;
    }
    if (chargerpointUuid != null) {
      this._chargerpointUuid = chargerpointUuid;
    }
    if (ocpptagUuid != null) {
      this._ocpptagUuid = ocpptagUuid;
    }
    if (connectorUuid != null) {
      this._connectorUuid = connectorUuid;
    }
    if (customerUuid != null) {
      this._customerUuid = customerUuid;
    }
    if (idTag != null) {
      this._idTag = idTag;
    }


    if (stopValue != null) {
      this._stopValue = stopValue;
    }
    if (stopReason != null) {
      this._stopReason = stopReason;
    }
    if (totalValueWt != null) {
      this._totalValueWt = totalValueWt;
    }
    if (totalValueKwt != null) {
      this._totalValueKwt = totalValueKwt;
    }
    if (unitPrice != null) {
      this._unitPrice = unitPrice;
    }


    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (isInvoice != null) {
      this._isInvoice = isInvoice;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get chargerpointId => _chargerpointId;
  set chargerpointId(int? chargerpointId) => _chargerpointId = chargerpointId;
  String? get chargerpointTitle => _chargerpointTitle;
  set chargerpointTitle(String? chargerpointTitle) =>
      _chargerpointTitle = chargerpointTitle;
  int? get ocpptagId => _ocpptagId;
  set ocpptagId(int? ocpptagId) => _ocpptagId = ocpptagId;
  String? get ocpptagTitle => _ocpptagTitle;
  set ocpptagTitle(String? ocpptagTitle) => _ocpptagTitle = ocpptagTitle;
  int? get connectorId => _connectorId;
  set connectorId(int? connectorId) => _connectorId = connectorId;
  String? get connectorTitle => _connectorTitle;
  set connectorTitle(String? connectorTitle) =>
      _connectorTitle = connectorTitle;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  String? get customerTitle => _customerTitle;
  set customerTitle(String? customerTitle) => _customerTitle = customerTitle;
  String? get uuid => _uuid;
  set uuid(String? uuid) => _uuid = uuid;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get chargerpointUuid => _chargerpointUuid;
  set chargerpointUuid(String? chargerpointUuid) =>
      _chargerpointUuid = chargerpointUuid;
  String? get ocpptagUuid => _ocpptagUuid;
  set ocpptagUuid(String? ocpptagUuid) => _ocpptagUuid = ocpptagUuid;
  String? get connectorUuid => _connectorUuid;
  set connectorUuid(String? connectorUuid) => _connectorUuid = connectorUuid;
  String? get customerUuid => _customerUuid;
  set customerUuid(String? customerUuid) => _customerUuid = customerUuid;
  String? get idTag => _idTag;
  set idTag(String? idTag) => _idTag = idTag;



  set stopValue(String? stopValue) => _stopValue = stopValue;
  String? get stopReason => _stopReason;
  set stopReason(String? stopReason) => _stopReason = stopReason;
  String? get totalValueWt => _totalValueWt;
  set totalValueWt(String? totalValueWt) => _totalValueWt = totalValueWt;
  String? get totalValueKwt => _totalValueKwt;
  set totalValueKwt(String? totalValueKwt) => _totalValueKwt = totalValueKwt;
  int? get unitPrice => _unitPrice;
  set unitPrice(int? unitPrice) => _unitPrice = unitPrice;
  int? get totalPrice => _totalPrice;
  set totalPrice(int? totalPrice) => _totalPrice = totalPrice;

  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get isInvoice => _isInvoice;
  set isInvoice(String? isInvoice) => _isInvoice = isInvoice;

  CustomerChargingHistoryData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _chargerpointId = json['chargerpoint_id'];
    _chargerpointTitle = json['chargerpoint_title'];
    _ocpptagId = json['ocpptag_id'];
    _ocpptagTitle = json['ocpptag_title'];
    _connectorId = json['connector_id'];
    _connectorTitle = json['connector_title'];
    _customerId = json['customer_id'];
    _customerTitle = json['customer_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _chargerpointUuid = json['chargerpoint_uuid'];
    _ocpptagUuid = json['ocpptag_uuid'];
    _connectorUuid = json['connector_uuid'];
    _customerUuid = json['customer_uuid'];
    _idTag = json['id_tag'];

    _stopValue = json['stop_value'];
    _stopReason = json['stop_reason'];
    _totalValueWt = json['total_value_wt'];
    _totalValueKwt = json['total_value_kwt'];
    _unitPrice = json['unit_price'];
    _totalPrice = json['total_price'];

    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isInvoice = json['is_invoice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['chargerpoint_id'] = this._chargerpointId;
    data['chargerpoint_title'] = this._chargerpointTitle;
    data['ocpptag_id'] = this._ocpptagId;
    data['ocpptag_title'] = this._ocpptagTitle;
    data['connector_id'] = this._connectorId;
    data['connector_title'] = this._connectorTitle;
    data['customer_id'] = this._customerId;
    data['customer_title'] = this._customerTitle;
    data['uuid'] = this._uuid;
    data['title'] = this._title;
    data['chargerpoint_uuid'] = this._chargerpointUuid;
    data['ocpptag_uuid'] = this._ocpptagUuid;
    data['connector_uuid'] = this._connectorUuid;
    data['customer_uuid'] = this._customerUuid;
    data['id_tag'] = this._idTag;

    data['stop_value'] = this._stopValue;
    data['stop_reason'] = this._stopReason;
    data['total_value_wt'] = this._totalValueWt;
    data['total_value_kwt'] = this._totalValueKwt;
    data['unit_price'] = this._unitPrice;
    data['total_price'] = this._totalPrice;

    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['is_invoice'] = this._isInvoice;
    return data;
  }
}
