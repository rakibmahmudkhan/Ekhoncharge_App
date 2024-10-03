class ChargingHistory {
  int? _status;
  bool? _success;
  List<ChargingHistoryData>? _data;

  ChargingHistory(
      {int? status, bool? success, List<ChargingHistoryData>? data}) {
    if (status != null) {
      _status = status;
    }
    if (success != null) {
      _success = success;
    }
    if (data != null) {
      _data = data;
    }
  }

  int? get status => _status;

  set status(int? status) => _status = status;

  bool? get success => _success;

  set success(bool? success) => _success = success;

  List<ChargingHistoryData>? get data => _data;

  set data(List<ChargingHistoryData>? data) => _data = data;

  ChargingHistory.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = <ChargingHistoryData>[];
      json['data'].forEach((v) {
        _data!.add(ChargingHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    data['success'] = _success;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChargingHistoryData {
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
  String? _chargerId;
  String? _startEventTimestamp;
  String? _startTimestamp;
  String? _startValue;
  String? _stopEventActor;
  String? _stopEventTimestamp;
  String? _stopTimestamp;
  String? _stopValue;
  String? _stopReason;
  String? _totalValueWt;
  String? _totalValueKwt;
  dynamic _unitPrice;
  dynamic _totalPrice;
  int? _createdBy;
  int? _updatedBy;
  int? _deletedBy;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _isInvoice;
  Invoice? _invoice;
  ChargerPoint? _chargerpoint;

  ChargingHistoryData(
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
      String? chargerId,
      String? startEventTimestamp,
      String? startTimestamp,
      String? startValue,
      String? stopEventTimestamp,
      String? stopTimestamp,
      String? stopValue,
      String? stopReason,
      String? totalValueWt,
      String? totalValueKwt,
      dynamic unitPrice,
      dynamic totalPrice,
      int? createdBy,
      int? updatedBy,
      int? deletedBy,
      String? deletedAt,
      String? createdAt,
      String? updatedAt,
      String? isInvoice,
      Invoice? invoice,
      ChargerPoint? chargerpoint}) {
    if (id != null) {
      _id = id;
    }
    if (chargerpointId != null) {
      _chargerpointId = chargerpointId;
    }
    if (chargerpointTitle != null) {
      _chargerpointTitle = chargerpointTitle;
    }
    if (ocpptagId != null) {
      _ocpptagId = ocpptagId;
    }
    if (ocpptagTitle != null) {
      _ocpptagTitle = ocpptagTitle;
    }
    if (connectorId != null) {
      _connectorId = connectorId;
    }
    if (connectorTitle != null) {
      _connectorTitle = connectorTitle;
    }
    if (customerId != null) {
      _customerId = customerId;
    }
    if (customerTitle != null) {
      _customerTitle = customerTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (chargerpointUuid != null) {
      _chargerpointUuid = chargerpointUuid;
    }
    if (ocpptagUuid != null) {
      _ocpptagUuid = ocpptagUuid;
    }
    if (connectorUuid != null) {
      _connectorUuid = connectorUuid;
    }
    if (customerUuid != null) {
      _customerUuid = customerUuid;
    }
    if (chargerId != null) {
      _chargerId = chargerId;
    }
    if (startEventTimestamp != null) {
      _startEventTimestamp = startEventTimestamp;
    }
    if (startTimestamp != null) {
      _startTimestamp = startTimestamp;
    }
    if (startValue != null) {
      _startValue = startValue;
    }
    if (stopEventActor != null) {
      _stopEventActor = stopEventActor;
    }
    if (stopEventTimestamp != null) {
      _stopEventTimestamp = stopEventTimestamp;
    }
    if (stopTimestamp != null) {
      _stopTimestamp = stopTimestamp;
    }
    if (stopValue != null) {
      _stopValue = stopValue;
    }
    if (stopReason != null) {
      _stopReason = stopReason;
    }
    if (totalValueWt != null) {
      _totalValueWt = totalValueWt;
    }
    if (totalValueKwt != null) {
      _totalValueKwt = totalValueKwt;
    }
    if (unitPrice != null) {
      _unitPrice = unitPrice;
    }
    if (totalPrice != null) {
      _totalPrice = totalPrice;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (updatedBy != null) {
      _updatedBy = updatedBy;
    }
    if (deletedBy != null) {
      _deletedBy = deletedBy;
    }
    if (deletedAt != null) {
      _deletedAt = deletedAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (isInvoice != null) {
      _isInvoice = isInvoice;
    }
    if (invoice != null) {
      _invoice = invoice;
    }
    if (chargerpoint != null) {
      _chargerpoint = chargerpoint;
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

  String? get chargerId => _chargerId;

  set chargerId(String? chargerId) => _chargerId = chargerId;

  String? get startEventTimestamp => _startEventTimestamp;

  set startEventTimestamp(String? startEventTimestamp) =>
      _startEventTimestamp = startEventTimestamp;

  String? get startTimestamp => _startTimestamp;

  set startTimestamp(String? startTimestamp) =>
      _startTimestamp = startTimestamp;

  String? get startValue => _startValue;

  set startValue(String? startValue) => _startValue = startValue;

  String? get stopEventActor => _stopEventActor;

  set stopEventActor(String? stopEventActor) =>
      _stopEventActor = stopEventActor;

  String? get stopEventTimestamp => _stopEventTimestamp;

  set stopEventTimestamp(String? stopEventTimestamp) =>
      _stopEventTimestamp = stopEventTimestamp;

  String? get stopTimestamp => _stopTimestamp;

  set stopTimestamp(String? stopTimestamp) => _stopTimestamp = stopTimestamp;

  String? get stopValue => _stopValue;

  set stopValue(String? stopValue) => _stopValue = stopValue;

  String? get stopReason => _stopReason;

  set stopReason(String? stopReason) => _stopReason = stopReason;

  String? get totalValueWt => _totalValueWt;

  set totalValueWt(String? totalValueWt) => _totalValueWt = totalValueWt;

  String? get totalValueKwt => _totalValueKwt;

  set totalValueKwt(String? totalValueKwt) => _totalValueKwt = totalValueKwt;

  dynamic get unitPrice => _unitPrice;

  set unitPrice(dynamic unitPrice) => _unitPrice = unitPrice;

  dynamic get totalPrice => _totalPrice;

  set totalPrice(dynamic totalPrice) => _totalPrice = totalPrice;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  int? get updatedBy => _updatedBy;

  set updatedBy(int? updatedBy) => _updatedBy = updatedBy;

  int? get deletedBy => _deletedBy;

  set deletedBy(int? deletedBy) => _deletedBy = deletedBy;

  String? get deletedAt => _deletedAt;

  set deletedAt(String? deletedAt) => _deletedAt = deletedAt;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  String? get isInvoice => _isInvoice;

  set isInvoice(String? isInvoice) => _isInvoice = isInvoice;

  Invoice? get invoice => _invoice;

  set invoice(Invoice? invoice) => _invoice = invoice;

  ChargerPoint? get chargerpoint => _chargerpoint;

  set chargerpoint(ChargerPoint? chargerpoint) => _chargerpoint = chargerpoint;

  ChargingHistoryData.fromJson(Map<String, dynamic> json) {
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
    _chargerId = json['chargerId'];
    _startEventTimestamp = json['start_event_timestamp'];
    _startTimestamp = json['start_timestamp'];
    _startValue = json['start_value'];
    _stopEventActor = json['stop_event_actor'];
    _stopEventTimestamp = json['stop_event_timestamp'];
    _stopTimestamp = json['stop_timestamp'];
    _stopValue = json['stop_value'];
    _stopReason = json['stop_reason'];
    _totalValueWt = json['total_value_wt'];
    _totalValueKwt = json['total_value_kwt'];
    _unitPrice = json['unit_price'];
    _totalPrice = json['total_price'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isInvoice = json['is_invoice'];
    _invoice =
        json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
    _chargerpoint = json['chargerpoint'] != null
        ? ChargerPoint.fromJson(json['chargerpoint'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['chargerpoint_id'] = _chargerpointId;
    data['chargerpoint_title'] = _chargerpointTitle;
    data['ocpptag_id'] = _ocpptagId;
    data['ocpptag_title'] = _ocpptagTitle;
    data['connector_id'] = _connectorId;
    data['connector_title'] = _connectorTitle;
    data['customer_id'] = _customerId;
    data['customer_title'] = _customerTitle;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['chargerpoint_uuid'] = _chargerpointUuid;
    data['ocpptag_uuid'] = _ocpptagUuid;
    data['connector_uuid'] = _connectorUuid;
    data['customer_uuid'] = _customerUuid;
    data['chargerId'] = _chargerId;
    data['start_event_timestamp'] = _startEventTimestamp;
    data['start_timestamp'] = _startTimestamp;
    data['start_value'] = _startValue;
    data['stop_event_actor'] = _stopEventActor;
    data['stop_event_timestamp'] = _stopEventTimestamp;
    data['stop_timestamp'] = _stopTimestamp;
    data['stop_value'] = _stopValue;
    data['stop_reason'] = _stopReason;
    data['total_value_wt'] = _totalValueWt;
    data['total_value_kwt'] = _totalValueKwt;
    data['unit_price'] = _unitPrice;
    data['total_price'] = _totalPrice;
    data['created_by'] = _createdBy;
    data['updated_by'] = _updatedBy;
    data['deleted_by'] = _deletedBy;
    data['deleted_at'] = _deletedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['is_invoice'] = _isInvoice;
    if (_invoice != null) {
      data['invoice'] = _invoice!.toJson();
    }
    if (_chargerpoint != null) {
      data['chargerpoint'] = _chargerpoint!.toJson();
    }
    return data;
  }
}

class Invoice {
  int? _id;
  String? _uuid;
  String? _title;
  int? _customerId;
  String? _customerUuid;
  String? _customerTitle;
  String? _contactPerson;
  int? _salesorderId;
  String? _salesOrderUuid;
  String? _salesOrderTitle;
  String? _salesInvoiceNo;
  String? _refNo;
  String? _salesInvoiceDate;
  dynamic totalItemPrice;
  dynamic _discountPercentage;
  dynamic _discountAmount;
  dynamic _totalPriceAfterDiscount;
  dynamic _taxRate;
  dynamic _vatTaxAmount;
  dynamic _additionalFeeTitle;
  dynamic _additionalFeeAmount;
  dynamic _finalPrice;
  int? _currencyId;
  String? _currencyUuid;
  String? _currencyTitle;
  int? _status;
  int? _createdBy;
  int? _updatedBy;
  int? _deletedBy;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  Invoice(
      {int? id,
      String? uuid,
      String? title,
      int? customerId,
      String? customerUuid,
      String? customerTitle,
      String? contactPerson,
      int? salesorderId,
      String? salesOrderUuid,
      String? salesOrderTitle,
      String? salesInvoiceNo,
      String? refNo,
      String? salesInvoiceDate,
      dynamic totalItemPrice,
      dynamic discountPercentage,
      dynamic discountAmount,
      dynamic totalPriceAfterDiscount,
      dynamic taxRate,
      dynamic vatTaxAmount,
      dynamic additionalFeeTitle,
      dynamic additionalFeeAmount,
      dynamic finalPrice,
      int? currencyId,
      String? currencyUuid,
      String? currencyTitle,
      int? status,
      int? createdBy,
      int? updatedBy,
      int? deletedBy,
      String? deletedAt,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (customerId != null) {
      _customerId = customerId;
    }
    if (customerUuid != null) {
      _customerUuid = customerUuid;
    }
    if (customerTitle != null) {
      _customerTitle = customerTitle;
    }
    if (contactPerson != null) {
      _contactPerson = contactPerson;
    }
    if (salesorderId != null) {
      _salesorderId = salesorderId;
    }
    if (salesOrderUuid != null) {
      _salesOrderUuid = salesOrderUuid;
    }
    if (salesOrderTitle != null) {
      _salesOrderTitle = salesOrderTitle;
    }
    if (salesInvoiceNo != null) {
      _salesInvoiceNo = salesInvoiceNo;
    }
    if (refNo != null) {
      _refNo = refNo;
    }
    if (salesInvoiceDate != null) {
      _salesInvoiceDate = salesInvoiceDate;
    }

    if (totalItemPrice != null) {
      this.totalItemPrice = totalItemPrice;
    }
    if (discountPercentage != null) {
      _discountPercentage = discountPercentage;
    }
    if (discountAmount != null) {
      _discountAmount = discountAmount;
    }
    if (totalPriceAfterDiscount != null) {
      _totalPriceAfterDiscount = totalPriceAfterDiscount;
    }
    if (taxRate != null) {
      _taxRate = taxRate;
    }
    if (vatTaxAmount != null) {
      _vatTaxAmount = vatTaxAmount;
    }
    if (additionalFeeTitle != null) {
      _additionalFeeTitle = additionalFeeTitle;
    }
    if (additionalFeeAmount != null) {
      _additionalFeeAmount = additionalFeeAmount;
    }
    if (finalPrice != null) {
      _finalPrice = finalPrice;
    }
    if (currencyId != null) {
      _currencyId = currencyId;
    }
    if (currencyUuid != null) {
      _currencyUuid = currencyUuid;
    }
    if (currencyTitle != null) {
      _currencyTitle = currencyTitle;
    }
    if (status != null) {
      _status = status;
    }

    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (updatedBy != null) {
      _updatedBy = updatedBy;
    }
    if (deletedBy != null) {
      _deletedBy = deletedBy;
    }
    if (deletedAt != null) {
      _deletedAt = deletedAt;
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

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get title => _title;

  set title(String? title) => _title = title;

  int? get customerId => _customerId;

  set customerId(int? customerId) => _customerId = customerId;

  String? get customerUuid => _customerUuid;

  set customerUuid(String? customerUuid) => _customerUuid = customerUuid;

  String? get customerTitle => _customerTitle;

  set customerTitle(String? customerTitle) => _customerTitle = customerTitle;

  String? get contactPerson => _contactPerson;

  set contactPerson(String? contactPerson) => _contactPerson = contactPerson;

  int? get salesorderId => _salesorderId;

  set salesorderId(int? salesorderId) => _salesorderId = salesorderId;

  String? get salesOrderUuid => _salesOrderUuid;

  set salesOrderUuid(String? salesOrderUuid) =>
      _salesOrderUuid = salesOrderUuid;

  String? get salesOrderTitle => _salesOrderTitle;

  set salesOrderTitle(String? salesOrderTitle) =>
      _salesOrderTitle = salesOrderTitle;

  String? get salesInvoiceNo => _salesInvoiceNo;

  set salesInvoiceNo(String? salesInvoiceNo) =>
      _salesInvoiceNo = salesInvoiceNo;

  String? get refNo => _refNo;

  set refNo(String? refNo) => _refNo = refNo;

  String? get salesInvoiceDate => _salesInvoiceDate;

  set salesInvoiceDate(String? salesInvoiceDate) =>
      _salesInvoiceDate = salesInvoiceDate;

  dynamic get discountPercentage => _discountPercentage;

  set discountPercentage(dynamic discountPercentage) =>
      _discountPercentage = discountPercentage;

  dynamic get discountAmount => _discountAmount;

  set discountAmount(dynamic discountAmount) =>
      _discountAmount = discountAmount;

  dynamic get totalPriceAfterDiscount => _totalPriceAfterDiscount;

  set totalPriceAfterDiscount(dynamic totalPriceAfterDiscount) =>
      _totalPriceAfterDiscount = totalPriceAfterDiscount;

  dynamic get taxRate => _taxRate;

  set taxRate(dynamic taxRate) => _taxRate = taxRate;

  dynamic get vatTaxAmount => _vatTaxAmount;

  set vatTaxAmount(dynamic vatTaxAmount) => _vatTaxAmount = vatTaxAmount;

  dynamic get additionalFeeTitle => _additionalFeeTitle;

  set additionalFeeTitle(dynamic additionalFeeTitle) =>
      _additionalFeeTitle = additionalFeeTitle;

  dynamic get additionalFeeAmount => _additionalFeeAmount;

  set additionalFeeAmount(dynamic additionalFeeAmount) =>
      _additionalFeeAmount = additionalFeeAmount;

  dynamic get finalPrice => _finalPrice;

  set finalPrice(dynamic finalPrice) => _finalPrice = finalPrice;

  int? get currencyId => _currencyId;

  set currencyId(int? currencyId) => _currencyId = currencyId;

  String? get currencyUuid => _currencyUuid;

  set currencyUuid(String? currencyUuid) => _currencyUuid = currencyUuid;

  String? get currencyTitle => _currencyTitle;

  set currencyTitle(String? currencyTitle) => _currencyTitle = currencyTitle;

  int? get status => _status;

  set status(int? status) => _status = status;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  int? get updatedBy => _updatedBy;

  set updatedBy(int? updatedBy) => _updatedBy = updatedBy;

  int? get deletedBy => _deletedBy;

  set deletedBy(int? deletedBy) => _deletedBy = deletedBy;

  String? get deletedAt => _deletedAt;

  set deletedAt(String? deletedAt) => _deletedAt = deletedAt;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Invoice.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _customerId = json['customer_id'];
    _customerUuid = json['customer_uuid'];
    _customerTitle = json['customer_title'];
    _contactPerson = json['contact_person'];
    _salesorderId = json['salesorder_id'];
    _salesOrderUuid = json['sales_order_uuid'];
    _salesOrderTitle = json['sales_order_title'];
    _salesInvoiceNo = json['sales_invoice_no'];
    _refNo = json['ref_no'];
    _salesInvoiceDate = json['sales_invoice_date'];
    totalItemPrice = json['total_item_price'];
    _discountPercentage = json['discount_percentage'];
    _discountAmount = json['discount_amount'];
    _totalPriceAfterDiscount = json['total_price_after_discount'];
    _taxRate = json['tax_rate'];
    _vatTaxAmount = json['vat_tax_amount'];
    _additionalFeeTitle = json['additional_fee_title'];
    _additionalFeeAmount = json['additional_fee_amount'];
    _finalPrice = json['final_price'];
    _currencyId = json['currency_id'];
    _currencyUuid = json['currency_uuid'];
    _currencyTitle = json['currency_title'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['customer_id'] = _customerId;
    data['customer_uuid'] = _customerUuid;
    data['customer_title'] = _customerTitle;
    data['contact_person'] = _contactPerson;
    data['salesorder_id'] = _salesorderId;
    data['sales_order_uuid'] = _salesOrderUuid;
    data['sales_order_title'] = _salesOrderTitle;
    data['sales_invoice_no'] = _salesInvoiceNo;
    data['ref_no'] = _refNo;
    data['sales_invoice_date'] = _salesInvoiceDate;
    data['discount_percentage'] = _discountPercentage;
    data['discount_amount'] = _discountAmount;
    data['total_price_after_discount'] = _totalPriceAfterDiscount;
    data['tax_rate'] = _taxRate;
    data['vat_tax_amount'] = _vatTaxAmount;
    data['additional_fee_title'] = _additionalFeeTitle;
    data['additional_fee_amount'] = _additionalFeeAmount;
    data['final_price'] = _finalPrice;
    data['currency_id'] = _currencyId;
    data['currency_uuid'] = _currencyUuid;
    data['currency_title'] = _currencyTitle;
    data['status'] = _status;

    data['created_by'] = _createdBy;
    data['updated_by'] = _updatedBy;
    data['deleted_by'] = _deletedBy;
    data['deleted_at'] = _deletedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}

class ChargerPoint {
  int? id;
  String? chargingType;

  ChargerPoint({this.id, this.chargingType});

  ChargerPoint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chargingType = json['charging_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['charging_type'] = chargingType;
    return data;
  }
}
