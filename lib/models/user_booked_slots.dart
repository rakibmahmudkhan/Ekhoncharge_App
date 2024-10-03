// ignore_for_file: dead_code

class UserBookedSlots {
  List<PastRecords>? _pastRecords;
  List<TodayRecords>? _todayRecords;
  List<FutureRecords>? _futureRecords;

  UserBookedSlots({List<PastRecords>? pastRecords,List<TodayRecords>? todayRecords, List<FutureRecords>? futureRecords}) {
    if (pastRecords != null) {
      _pastRecords = pastRecords;
    } if (todayRecords != null) {
      _todayRecords = todayRecords;
    }
    if (futureRecords != null) {
      _futureRecords = futureRecords;
    }
  }

  List<PastRecords>? get pastRecords => _pastRecords;
  set pastRecords(List<PastRecords>? pastRecords) => _pastRecords = pastRecords;
  List<TodayRecords>? get todayRecords => _todayRecords;
  set todayRecords(List<TodayRecords>? todayRecords) =>
      _todayRecords = todayRecords;
  List<FutureRecords>? get futureRecords => _futureRecords;
  set futureRecords(List<FutureRecords>? futureRecords) =>
      _futureRecords = futureRecords;

  UserBookedSlots.fromJson(Map<String, dynamic> json) {
    if (json['pastRecords'] != null) {
      _pastRecords = <PastRecords>[];
      json['pastRecords'].forEach((v) {
        _pastRecords!.add(new PastRecords.fromJson(v));
      });
    }
    if (json['todayRecords'] != null) {
      _todayRecords = <TodayRecords>[];
      json['todayRecords'].forEach((v) {
        _todayRecords!.add(new TodayRecords.fromJson(v));
      });
    }
    if (json['futureRecords'] != null) {
      _futureRecords = <FutureRecords>[];
      json['futureRecords'].forEach((v) {
        _futureRecords!.add(new FutureRecords.fromJson(v));
      });
    }
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (_pastRecords != null) {
      data['pastRecords'] = _pastRecords!.map((v) => v.toJson()).toList();
    }
    if (_todayRecords != null) {
      data['todayRecords'] =
          _todayRecords!.map((v) => v.toJson()).toList();
    }
    if (_futureRecords != null) {
      data['futureRecords'] =
          _futureRecords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PastRecords {
  int? _id;
  String? _uuid;
  String? _title;
  Null? _ocpptagId;
  String? _timeslotId;
  Null? _ocpptagUuid;
  Null? _ocpptagTitle;
  int? _connectorId;
  Null? _connectorUuid;
  Null? _connectorTitle;
  Null? _energytxnId;
  Null? _energytxnUuid;
  Null? _energytxnTitle;
  int? _chargerpointId;
  Null? _chargerpointUuid;
  Null? _chargerpointTitle;
  int? _customerId;
  Null? _customerUuid;
  Null? _customerTitle;
  Null? _idTag;
  Null? _startDatetime;
  String? _times;
  Null? _endDatetime;
  Null? _expiryDatetime;
  String? _date;
  Null? _status;
  int? _createdBy;
  Null? _updatedBy;
  Null? _deletedBy;
  Null? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  PastRecords(
      {int? id,
        String? uuid,
        String? title,
        Null? ocpptagId,
        String? timeslotId,
        Null? ocpptagUuid,
        Null? ocpptagTitle,
        int? connectorId,
        Null? connectorUuid,
        Null? connectorTitle,
        Null? energytxnId,
        Null? energytxnUuid,
        Null? energytxnTitle,
        int? chargerpointId,
        Null? chargerpointUuid,
        Null? chargerpointTitle,
        int? customerId,
        Null? customerUuid,
        Null? customerTitle,
        Null? idTag,
        Null? startDatetime,
        String? times,
        Null? endDatetime,
        Null? expiryDatetime,
        String? date,
        Null? status,
        int? createdBy,
        Null? updatedBy,
        Null? deletedBy,
        Null? deletedAt,
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
    if (ocpptagId != null) {
      _ocpptagId = ocpptagId;
    }
    if (timeslotId != null) {
      _timeslotId = timeslotId;
    }
    if (ocpptagUuid != null) {
      _ocpptagUuid = ocpptagUuid;
    }
    if (ocpptagTitle != null) {
      _ocpptagTitle = ocpptagTitle;
    }
    if (connectorId != null) {
      _connectorId = connectorId;
    }
    if (connectorUuid != null) {
      _connectorUuid = connectorUuid;
    }
    if (connectorTitle != null) {
      _connectorTitle = connectorTitle;
    }
    if (energytxnId != null) {
      _energytxnId = energytxnId;
    }
    if (energytxnUuid != null) {
      _energytxnUuid = energytxnUuid;
    }
    if (energytxnTitle != null) {
      _energytxnTitle = energytxnTitle;
    }
    if (chargerpointId != null) {
      _chargerpointId = chargerpointId;
    }
    if (chargerpointUuid != null) {
      _chargerpointUuid = chargerpointUuid;
    }
    if (chargerpointTitle != null) {
      _chargerpointTitle = chargerpointTitle;
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
    if (idTag != null) {
      _idTag = idTag;
    }
    if (startDatetime != null) {
      _startDatetime = startDatetime;
    }
    if (times != null) {
      _times = times;
    }
    if (endDatetime != null) {
      _endDatetime = endDatetime;
    }
    if (expiryDatetime != null) {
      _expiryDatetime = expiryDatetime;
    }
    if (date != null) {
      _date = date;
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
  Null? get ocpptagId => _ocpptagId;
  set ocpptagId(Null? ocpptagId) => _ocpptagId = ocpptagId;
  String? get timeslotId => _timeslotId;
  set timeslotId(String? timeslotId) => _timeslotId = timeslotId;
  Null? get ocpptagUuid => _ocpptagUuid;
  set ocpptagUuid(Null? ocpptagUuid) => _ocpptagUuid = ocpptagUuid;
  Null? get ocpptagTitle => _ocpptagTitle;
  set ocpptagTitle(Null? ocpptagTitle) => _ocpptagTitle = ocpptagTitle;
  int? get connectorId => _connectorId;
  set connectorId(int? connectorId) => _connectorId = connectorId;
  Null? get connectorUuid => _connectorUuid;
  set connectorUuid(Null? connectorUuid) => _connectorUuid = connectorUuid;
  Null? get connectorTitle => _connectorTitle;
  set connectorTitle(Null? connectorTitle) => _connectorTitle = connectorTitle;
  Null? get energytxnId => _energytxnId;
  set energytxnId(Null? energytxnId) => _energytxnId = energytxnId;
  Null? get energytxnUuid => _energytxnUuid;
  set energytxnUuid(Null? energytxnUuid) => _energytxnUuid = energytxnUuid;
  Null? get energytxnTitle => _energytxnTitle;
  set energytxnTitle(Null? energytxnTitle) => _energytxnTitle = energytxnTitle;
  int? get chargerpointId => _chargerpointId;
  set chargerpointId(int? chargerpointId) => _chargerpointId = chargerpointId;
  Null? get chargerpointUuid => _chargerpointUuid;
  set chargerpointUuid(Null? chargerpointUuid) =>
      _chargerpointUuid = chargerpointUuid;
  Null? get chargerpointTitle => _chargerpointTitle;
  set chargerpointTitle(Null? chargerpointTitle) =>
      _chargerpointTitle = chargerpointTitle;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  Null? get customerUuid => _customerUuid;
  set customerUuid(Null? customerUuid) => _customerUuid = customerUuid;
  Null? get customerTitle => _customerTitle;
  set customerTitle(Null? customerTitle) => _customerTitle = customerTitle;
  Null? get idTag => _idTag;
  set idTag(Null? idTag) => _idTag = idTag;
  Null? get startDatetime => _startDatetime;
  set startDatetime(Null? startDatetime) => _startDatetime = startDatetime;
  String? get times => _times;
  set times(String? times) => _times = times;
  Null? get endDatetime => _endDatetime;
  set endDatetime(Null? endDatetime) => _endDatetime = endDatetime;
  Null? get expiryDatetime => _expiryDatetime;
  set expiryDatetime(Null? expiryDatetime) => _expiryDatetime = expiryDatetime;
  String? get date => _date;
  set date(String? date) => _date = date;
  Null? get status => _status;
  set status(Null? status) => _status = status;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  Null? get updatedBy => _updatedBy;
  set updatedBy(Null? updatedBy) => _updatedBy = updatedBy;
  Null? get deletedBy => _deletedBy;
  set deletedBy(Null? deletedBy) => _deletedBy = deletedBy;
  Null? get deletedAt => _deletedAt;
  set deletedAt(Null? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  PastRecords.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _ocpptagId = json['ocpptag_id'];
    _timeslotId = json['timeslot_id'];
    _ocpptagUuid = json['ocpptag_uuid'];
    _ocpptagTitle = json['ocpptag_title'];
    _connectorId = json['connector_id'];
    _connectorUuid = json['connector_uuid'];
    _connectorTitle = json['connector_title'];
    _energytxnId = json['energytxn_id'];
    _energytxnUuid = json['energytxn_uuid'];
    _energytxnTitle = json['energytxn_title'];
    _chargerpointId = json['chargerpoint_id'];
    _chargerpointUuid = json['chargerpoint_uuid'];
    _chargerpointTitle = json['chargerpoint_title'];
    _customerId = json['customer_id'];
    _customerUuid = json['customer_uuid'];
    _customerTitle = json['customer_title'];
    _idTag = json['id_tag'];
    _startDatetime = json['start_datetime'];
    _times = json['times'];
    _endDatetime = json['end_datetime'];
    _expiryDatetime = json['expiry_datetime'];
    _date = json['date'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['ocpptag_id'] = _ocpptagId;
    data['timeslot_id'] = _timeslotId;
    data['ocpptag_uuid'] = _ocpptagUuid;
    data['ocpptag_title'] = _ocpptagTitle;
    data['connector_id'] = _connectorId;
    data['connector_uuid'] = _connectorUuid;
    data['connector_title'] = _connectorTitle;
    data['energytxn_id'] = _energytxnId;
    data['energytxn_uuid'] = _energytxnUuid;
    data['energytxn_title'] = _energytxnTitle;
    data['chargerpoint_id'] = _chargerpointId;
    data['chargerpoint_uuid'] = _chargerpointUuid;
    data['chargerpoint_title'] = _chargerpointTitle;
    data['customer_id'] = _customerId;
    data['customer_uuid'] = _customerUuid;
    data['customer_title'] = _customerTitle;
    data['id_tag'] = _idTag;
    data['start_datetime'] = _startDatetime;
    data['times'] = _times;
    data['end_datetime'] = _endDatetime;
    data['expiry_datetime'] = _expiryDatetime;
    data['date'] = _date;
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
class TodayRecords {
  int? _id;
  String? _uuid;
  String? _title;
  Null? _ocpptagId;
  String? _timeslotId;
  Null? _ocpptagUuid;
  Null? _ocpptagTitle;
  int? _connectorId;
  Null? _connectorUuid;
  Null? _connectorTitle;
  Null? _energytxnId;
  Null? _energytxnUuid;
  Null? _energytxnTitle;
  int? _chargerpointId;
  Null? _chargerpointUuid;
  Null? _chargerpointTitle;
  int? _customerId;
  Null? _customerUuid;
  Null? _customerTitle;
  Null? _idTag;
  Null? _startDatetime;
  String? _times;
  Null? _endDatetime;
  Null? _expiryDatetime;
  String? _date;
  Null? _status;
  int? _createdBy;
  Null? _updatedBy;
  Null? _deletedBy;
  Null? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  TodayRecords(
      {int? id,
        String? uuid,
        String? title,
        Null? ocpptagId,
        String? timeslotId,
        Null? ocpptagUuid,
        Null? ocpptagTitle,
        int? connectorId,
        Null? connectorUuid,
        Null? connectorTitle,
        Null? energytxnId,
        Null? energytxnUuid,
        Null? energytxnTitle,
        int? chargerpointId,
        Null? chargerpointUuid,
        Null? chargerpointTitle,
        int? customerId,
        Null? customerUuid,
        Null? customerTitle,
        Null? idTag,
        Null? startDatetime,
        String? times,
        Null? endDatetime,
        Null? expiryDatetime,
        String? date,
        Null? status,
        int? createdBy,
        Null? updatedBy,
        Null? deletedBy,
        Null? deletedAt,
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
    if (ocpptagId != null) {
      _ocpptagId = ocpptagId;
    }
    if (timeslotId != null) {
      _timeslotId = timeslotId;
    }
    if (ocpptagUuid != null) {
      _ocpptagUuid = ocpptagUuid;
    }
    if (ocpptagTitle != null) {
      _ocpptagTitle = ocpptagTitle;
    }
    if (connectorId != null) {
      _connectorId = connectorId;
    }
    if (connectorUuid != null) {
      _connectorUuid = connectorUuid;
    }
    if (connectorTitle != null) {
      _connectorTitle = connectorTitle;
    }
    if (energytxnId != null) {
      _energytxnId = energytxnId;
    }
    if (energytxnUuid != null) {
      _energytxnUuid = energytxnUuid;
    }
    if (energytxnTitle != null) {
      _energytxnTitle = energytxnTitle;
    }
    if (chargerpointId != null) {
      _chargerpointId = chargerpointId;
    }
    if (chargerpointUuid != null) {
      _chargerpointUuid = chargerpointUuid;
    }
    if (chargerpointTitle != null) {
      _chargerpointTitle = chargerpointTitle;
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
    if (idTag != null) {
      _idTag = idTag;
    }
    if (startDatetime != null) {
      _startDatetime = startDatetime;
    }
    if (times != null) {
      _times = times;
    }
    if (endDatetime != null) {
      _endDatetime = endDatetime;
    }
    if (expiryDatetime != null) {
      _expiryDatetime = expiryDatetime;
    }
    if (date != null) {
      _date = date;
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
  Null? get ocpptagId => _ocpptagId;
  set ocpptagId(Null? ocpptagId) => _ocpptagId = ocpptagId;
  String? get timeslotId => _timeslotId;
  set timeslotId(String? timeslotId) => _timeslotId = timeslotId;
  Null? get ocpptagUuid => _ocpptagUuid;
  set ocpptagUuid(Null? ocpptagUuid) => _ocpptagUuid = ocpptagUuid;
  Null? get ocpptagTitle => _ocpptagTitle;
  set ocpptagTitle(Null? ocpptagTitle) => _ocpptagTitle = ocpptagTitle;
  int? get connectorId => _connectorId;
  set connectorId(int? connectorId) => _connectorId = connectorId;
  Null? get connectorUuid => _connectorUuid;
  set connectorUuid(Null? connectorUuid) => _connectorUuid = connectorUuid;
  Null? get connectorTitle => _connectorTitle;
  set connectorTitle(Null? connectorTitle) => _connectorTitle = connectorTitle;
  Null? get energytxnId => _energytxnId;
  set energytxnId(Null? energytxnId) => _energytxnId = energytxnId;
  Null? get energytxnUuid => _energytxnUuid;
  set energytxnUuid(Null? energytxnUuid) => _energytxnUuid = energytxnUuid;
  Null? get energytxnTitle => _energytxnTitle;
  set energytxnTitle(Null? energytxnTitle) => _energytxnTitle = energytxnTitle;
  int? get chargerpointId => _chargerpointId;
  set chargerpointId(int? chargerpointId) => _chargerpointId = chargerpointId;
  Null? get chargerpointUuid => _chargerpointUuid;
  set chargerpointUuid(Null? chargerpointUuid) =>
      _chargerpointUuid = chargerpointUuid;
  Null? get chargerpointTitle => _chargerpointTitle;
  set chargerpointTitle(Null? chargerpointTitle) =>
      _chargerpointTitle = chargerpointTitle;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  Null? get customerUuid => _customerUuid;
  set customerUuid(Null? customerUuid) => _customerUuid = customerUuid;
  Null? get customerTitle => _customerTitle;
  set customerTitle(Null? customerTitle) => _customerTitle = customerTitle;
  Null? get idTag => _idTag;
  set idTag(Null? idTag) => _idTag = idTag;
  Null? get startDatetime => _startDatetime;
  set startDatetime(Null? startDatetime) => _startDatetime = startDatetime;
  String? get times => _times;
  set times(String? times) => _times = times;
  Null? get endDatetime => _endDatetime;
  set endDatetime(Null? endDatetime) => _endDatetime = endDatetime;
  Null? get expiryDatetime => _expiryDatetime;
  set expiryDatetime(Null? expiryDatetime) => _expiryDatetime = expiryDatetime;
  String? get date => _date;
  set date(String? date) => _date = date;
  Null? get status => _status;
  set status(Null? status) => _status = status;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  Null? get updatedBy => _updatedBy;
  set updatedBy(Null? updatedBy) => _updatedBy = updatedBy;
  Null? get deletedBy => _deletedBy;
  set deletedBy(Null? deletedBy) => _deletedBy = deletedBy;
  Null? get deletedAt => _deletedAt;
  set deletedAt(Null? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  TodayRecords.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _ocpptagId = json['ocpptag_id'];
    _timeslotId = json['timeslot_id'];
    _ocpptagUuid = json['ocpptag_uuid'];
    _ocpptagTitle = json['ocpptag_title'];
    _connectorId = json['connector_id'];
    _connectorUuid = json['connector_uuid'];
    _connectorTitle = json['connector_title'];
    _energytxnId = json['energytxn_id'];
    _energytxnUuid = json['energytxn_uuid'];
    _energytxnTitle = json['energytxn_title'];
    _chargerpointId = json['chargerpoint_id'];
    _chargerpointUuid = json['chargerpoint_uuid'];
    _chargerpointTitle = json['chargerpoint_title'];
    _customerId = json['customer_id'];
    _customerUuid = json['customer_uuid'];
    _customerTitle = json['customer_title'];
    _idTag = json['id_tag'];
    _startDatetime = json['start_datetime'];
    _times = json['times'];
    _endDatetime = json['end_datetime'];
    _expiryDatetime = json['expiry_datetime'];
    _date = json['date'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['ocpptag_id'] = _ocpptagId;
    data['timeslot_id'] = _timeslotId;
    data['ocpptag_uuid'] = _ocpptagUuid;
    data['ocpptag_title'] = _ocpptagTitle;
    data['connector_id'] = _connectorId;
    data['connector_uuid'] = _connectorUuid;
    data['connector_title'] = _connectorTitle;
    data['energytxn_id'] = _energytxnId;
    data['energytxn_uuid'] = _energytxnUuid;
    data['energytxn_title'] = _energytxnTitle;
    data['chargerpoint_id'] = _chargerpointId;
    data['chargerpoint_uuid'] = _chargerpointUuid;
    data['chargerpoint_title'] = _chargerpointTitle;
    data['customer_id'] = _customerId;
    data['customer_uuid'] = _customerUuid;
    data['customer_title'] = _customerTitle;
    data['id_tag'] = _idTag;
    data['start_datetime'] = _startDatetime;
    data['times'] = _times;
    data['end_datetime'] = _endDatetime;
    data['expiry_datetime'] = _expiryDatetime;
    data['date'] = _date;
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
class FutureRecords {
  int? _id;
  String? _uuid;
  String? _title;
  Null? _ocpptagId;
  String? _timeslotId;
  Null? _ocpptagUuid;
  Null? _ocpptagTitle;
  int? _connectorId;
  Null? _connectorUuid;
  Null? _connectorTitle;
  Null? _energytxnId;
  Null? _energytxnUuid;
  Null? _energytxnTitle;
  int? _chargerpointId;
  Null? _chargerpointUuid;
  Null? _chargerpointTitle;
  int? _customerId;
  Null? _customerUuid;
  Null? _customerTitle;
  Null? _idTag;
  Null? _startDatetime;
  String? _times;
  Null? _endDatetime;
  Null? _expiryDatetime;
  String? _date;
  Null? _status;
  int? _createdBy;
  Null? _updatedBy;
  Null? _deletedBy;
  Null? _deletedAt;
  String? _createdAt;
  String? _updatedAt;

  FutureRecords(
      {int? id,
        String? uuid,
        String? title,
        Null? ocpptagId,
        String? timeslotId,
        Null? ocpptagUuid,
        Null? ocpptagTitle,
        int? connectorId,
        Null? connectorUuid,
        Null? connectorTitle,
        Null? energytxnId,
        Null? energytxnUuid,
        Null? energytxnTitle,
        int? chargerpointId,
        Null? chargerpointUuid,
        Null? chargerpointTitle,
        int? customerId,
        Null? customerUuid,
        Null? customerTitle,
        Null? idTag,
        Null? startDatetime,
        String? times,
        Null? endDatetime,
        Null? expiryDatetime,
        String? date,
        Null? status,
        int? createdBy,
        Null? updatedBy,
        Null? deletedBy,
        Null? deletedAt,
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
    if (ocpptagId != null) {
      _ocpptagId = ocpptagId;
    }
    if (timeslotId != null) {
      _timeslotId = timeslotId;
    }
    if (ocpptagUuid != null) {
      _ocpptagUuid = ocpptagUuid;
    }
    if (ocpptagTitle != null) {
      _ocpptagTitle = ocpptagTitle;
    }
    if (connectorId != null) {
      _connectorId = connectorId;
    }
    if (connectorUuid != null) {
      _connectorUuid = connectorUuid;
    }
    if (connectorTitle != null) {
      _connectorTitle = connectorTitle;
    }
    if (energytxnId != null) {
      _energytxnId = energytxnId;
    }
    if (energytxnUuid != null) {
      _energytxnUuid = energytxnUuid;
    }
    if (energytxnTitle != null) {
      _energytxnTitle = energytxnTitle;
    }
    if (chargerpointId != null) {
      _chargerpointId = chargerpointId;
    }
    if (chargerpointUuid != null) {
      _chargerpointUuid = chargerpointUuid;
    }
    if (chargerpointTitle != null) {
      _chargerpointTitle = chargerpointTitle;
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
    if (idTag != null) {
      _idTag = idTag;
    }
    if (startDatetime != null) {
      _startDatetime = startDatetime;
    }
    if (times != null) {
      _times = times;
    }
    if (endDatetime != null) {
      _endDatetime = endDatetime;
    }
    if (expiryDatetime != null) {
      _expiryDatetime = expiryDatetime;
    }
    if (date != null) {
      _date = date;
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
  Null? get ocpptagId => _ocpptagId;
  set ocpptagId(Null? ocpptagId) => _ocpptagId = ocpptagId;
  String? get timeslotId => _timeslotId;
  set timeslotId(String? timeslotId) => _timeslotId = timeslotId;
  Null? get ocpptagUuid => _ocpptagUuid;
  set ocpptagUuid(Null? ocpptagUuid) => _ocpptagUuid = ocpptagUuid;
  Null? get ocpptagTitle => _ocpptagTitle;
  set ocpptagTitle(Null? ocpptagTitle) => _ocpptagTitle = ocpptagTitle;
  int? get connectorId => _connectorId;
  set connectorId(int? connectorId) => _connectorId = connectorId;
  Null? get connectorUuid => _connectorUuid;
  set connectorUuid(Null? connectorUuid) => _connectorUuid = connectorUuid;
  Null? get connectorTitle => _connectorTitle;
  set connectorTitle(Null? connectorTitle) => _connectorTitle = connectorTitle;
  Null? get energytxnId => _energytxnId;
  set energytxnId(Null? energytxnId) => _energytxnId = energytxnId;
  Null? get energytxnUuid => _energytxnUuid;
  set energytxnUuid(Null? energytxnUuid) => _energytxnUuid = energytxnUuid;
  Null? get energytxnTitle => _energytxnTitle;
  set energytxnTitle(Null? energytxnTitle) => _energytxnTitle = energytxnTitle;
  int? get chargerpointId => _chargerpointId;
  set chargerpointId(int? chargerpointId) => _chargerpointId = chargerpointId;
  Null? get chargerpointUuid => _chargerpointUuid;
  set chargerpointUuid(Null? chargerpointUuid) =>
      _chargerpointUuid = chargerpointUuid;
  Null? get chargerpointTitle => _chargerpointTitle;
  set chargerpointTitle(Null? chargerpointTitle) =>
      _chargerpointTitle = chargerpointTitle;
  int? get customerId => _customerId;
  set customerId(int? customerId) => _customerId = customerId;
  Null? get customerUuid => _customerUuid;
  set customerUuid(Null? customerUuid) => _customerUuid = customerUuid;
  Null? get customerTitle => _customerTitle;
  set customerTitle(Null? customerTitle) => _customerTitle = customerTitle;
  Null? get idTag => _idTag;
  set idTag(Null? idTag) => _idTag = idTag;
  Null? get startDatetime => _startDatetime;
  set startDatetime(Null? startDatetime) => _startDatetime = startDatetime;
  String? get times => _times;
  set times(String? times) => _times = times;
  Null? get endDatetime => _endDatetime;
  set endDatetime(Null? endDatetime) => _endDatetime = endDatetime;
  Null? get expiryDatetime => _expiryDatetime;
  set expiryDatetime(Null? expiryDatetime) => _expiryDatetime = expiryDatetime;
  String? get date => _date;
  set date(String? date) => _date = date;
  Null? get status => _status;
  set status(Null? status) => _status = status;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  Null? get updatedBy => _updatedBy;
  set updatedBy(Null? updatedBy) => _updatedBy = updatedBy;
  Null? get deletedBy => _deletedBy;
  set deletedBy(Null? deletedBy) => _deletedBy = deletedBy;
  Null? get deletedAt => _deletedAt;
  set deletedAt(Null? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  FutureRecords.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _title = json['title'];
    _ocpptagId = json['ocpptag_id'];
    _timeslotId = json['timeslot_id'];
    _ocpptagUuid = json['ocpptag_uuid'];
    _ocpptagTitle = json['ocpptag_title'];
    _connectorId = json['connector_id'];
    _connectorUuid = json['connector_uuid'];
    _connectorTitle = json['connector_title'];
    _energytxnId = json['energytxn_id'];
    _energytxnUuid = json['energytxn_uuid'];
    _energytxnTitle = json['energytxn_title'];
    _chargerpointId = json['chargerpoint_id'];
    _chargerpointUuid = json['chargerpoint_uuid'];
    _chargerpointTitle = json['chargerpoint_title'];
    _customerId = json['customer_id'];
    _customerUuid = json['customer_uuid'];
    _customerTitle = json['customer_title'];
    _idTag = json['id_tag'];
    _startDatetime = json['start_datetime'];
    _times = json['times'];
    _endDatetime = json['end_datetime'];
    _expiryDatetime = json['expiry_datetime'];
    _date = json['date'];
    _status = json['status'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _deletedBy = json['deleted_by'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['uuid'] = _uuid;
    data['title'] = _title;
    data['ocpptag_id'] = _ocpptagId;
    data['timeslot_id'] = _timeslotId;
    data['ocpptag_uuid'] = _ocpptagUuid;
    data['ocpptag_title'] = _ocpptagTitle;
    data['connector_id'] = _connectorId;
    data['connector_uuid'] = _connectorUuid;
    data['connector_title'] = _connectorTitle;
    data['energytxn_id'] = _energytxnId;
    data['energytxn_uuid'] = _energytxnUuid;
    data['energytxn_title'] = _energytxnTitle;
    data['chargerpoint_id'] = _chargerpointId;
    data['chargerpoint_uuid'] = _chargerpointUuid;
    data['chargerpoint_title'] = _chargerpointTitle;
    data['customer_id'] = _customerId;
    data['customer_uuid'] = _customerUuid;
    data['customer_title'] = _customerTitle;
    data['id_tag'] = _idTag;
    data['start_datetime'] = _startDatetime;
    data['times'] = _times;
    data['end_datetime'] = _endDatetime;
    data['expiry_datetime'] = _expiryDatetime;
    data['date'] = _date;
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