class ChargerPoint {
  int? _status;
  bool? _success;
  String? _message;
  ChargerPointData? _data;

  ChargerPoint(
      {int? status, bool? success, String? message, ChargerPointData? data}) {
    if (status != null) {
      _status = status;
    }
    if (success != null) {
      _success = success;
    }
    if (message != null) {
      _message = message;
    }
    if (data != null) {
      _data = data;
    }
  }

  int? get status => _status;

  set status(int? status) => _status = status;

  bool? get success => _success;

  set success(bool? success) => _success = success;

  String? get message => _message;

  set message(String? message) => _message = message;

  ChargerPointData? get data => _data;

  set data(ChargerPointData? data) => _data = data;

  ChargerPoint.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
    _data =
        json['data'] != null ? ChargerPointData.fromJson(json['data']) : null;
  }
}

class ChargerPointData {
  int? _id;
  int? _stationId;
  String? _stationTitle;
  String? _uuid;
  String? _title;
  String? _stationUuid;
  String? _chargerId;
  String? _ocppProtocol;
  String? _registrationStatus;
  String? _chargePointVendor;
  String? _chargePointModel;
  String? _chargePointSerialNumber;
  String? _chargeBoxSerialNumber;
  String? _fwVersion;
  String? _fwUpdateStatus;
  String? _fwUpdateTimestamp;
  String? _iccid;
  String? _imsi;
  String? _meterType;
  String? _meterSerialNumber;
  String? _diagnosticsStatus;
  String? _diagnosticsTimestamp;
  String? _lastHeartbeatTimestamp;
  String? _description;
  String? _note;
  String? _locationLatitude;
  String? _locationLongitude;
  String? _adminAddress;
  String? _chargingType;
  int? _status;
  String? _image;
  String? _imagePath;
  String? _installationDate;
  String? _lastMaintenanceDate;
  String? _nextMaintenanceDate;
  String? _qrcode;
  int? _createdBy;
  int? _updatedBy;
  String? _createdAt;
  String? _updatedAt;
  String? _chargerstatus;
  List<Connectors>? _connectors;
  ChargingDetails? _chargingDetails;

  ChargerPointData({
    int? id,
    int? stationId,
    String? stationTitle,
    String? uuid,
    String? title,
    String? stationUuid,
    String? chargerId,
    String? ocppProtocol,
    String? registrationStatus,
    String? chargePointVendor,
    String? chargePointModel,
    String? chargePointSerialNumber,
    String? chargeBoxSerialNumber,
    String? fwVersion,
    String? fwUpdateStatus,
    String? fwUpdateTimestamp,
    String? iccid,
    String? imsi,
    String? meterType,
    String? meterSerialNumber,
    String? diagnosticsStatus,
    String? diagnosticsTimestamp,
    String? lastHeartbeatTimestamp,
    String? description,
    String? note,
    String? locationLatitude,
    String? locationLongitude,
    String? adminAddress,
    String? chargingType,
    int? status,
    String? image,
    String? imagePath,
    String? installationDate,
    String? lastMaintenanceDate,
    String? nextMaintenanceDate,
    String? qrcode,
    int? createdBy,
    int? updatedBy,
    String? createdAt,
    String? updatedAt,
    String? chargerstatus,
    List<Connectors>? connectors,
    ChargingDetails? chargingDetails,
  }) {
    if (id != null) {
      _id = id;
    }
    if (stationId != null) {
      _stationId = stationId;
    }
    if (stationTitle != null) {
      _stationTitle = stationTitle;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (title != null) {
      _title = title;
    }
    if (stationUuid != null) {
      _stationUuid = stationUuid;
    }
    if (chargerId != null) {
      _chargerId = chargerId;
    }
    if (ocppProtocol != null) {
      _ocppProtocol = ocppProtocol;
    }
    if (registrationStatus != null) {
      _registrationStatus = registrationStatus;
    }
    if (chargePointVendor != null) {
      _chargePointVendor = chargePointVendor;
    }
    if (chargePointModel != null) {
      _chargePointModel = chargePointModel;
    }
    if (chargePointSerialNumber != null) {
      _chargePointSerialNumber = chargePointSerialNumber;
    }
    if (chargeBoxSerialNumber != null) {
      _chargeBoxSerialNumber = chargeBoxSerialNumber;
    }
    if (fwVersion != null) {
      _fwVersion = fwVersion;
    }
    if (fwUpdateStatus != null) {
      _fwUpdateStatus = fwUpdateStatus;
    }
    if (fwUpdateTimestamp != null) {
      _fwUpdateTimestamp = fwUpdateTimestamp;
    }
    if (iccid != null) {
      _iccid = iccid;
    }
    if (imsi != null) {
      _imsi = imsi;
    }
    if (meterType != null) {
      _meterType = meterType;
    }
    if (meterSerialNumber != null) {
      _meterSerialNumber = meterSerialNumber;
    }
    if (diagnosticsStatus != null) {
      _diagnosticsStatus = diagnosticsStatus;
    }
    if (diagnosticsTimestamp != null) {
      _diagnosticsTimestamp = diagnosticsTimestamp;
    }
    if (lastHeartbeatTimestamp != null) {
      _lastHeartbeatTimestamp = lastHeartbeatTimestamp;
    }
    if (description != null) {
      _description = description;
    }
    if (note != null) {
      _note = note;
    }
    if (locationLatitude != null) {
      _locationLatitude = locationLatitude;
    }
    if (locationLongitude != null) {
      _locationLongitude = locationLongitude;
    }
    if (adminAddress != null) {
      _adminAddress = adminAddress;
    }
    if (chargingType != null) {
      _chargingType = chargingType;
    }
    if (status != null) {
      _status = status;
    }
    if (image != null) {
      _image = image;
    }
    if (imagePath != null) {
      _imagePath = imagePath;
    }
    if (installationDate != null) {
      _installationDate = installationDate;
    }
    if (lastMaintenanceDate != null) {
      _lastMaintenanceDate = lastMaintenanceDate;
    }
    if (nextMaintenanceDate != null) {
      _nextMaintenanceDate = nextMaintenanceDate;
    }
    if (qrcode != null) {
      _qrcode = qrcode;
    }
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (updatedBy != null) {
      _updatedBy = updatedBy;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (chargerstatus != null) {
      _chargerstatus = chargerstatus;
    }
    if (connectors != null) {
      _connectors = connectors;
    }
    if (chargingDetails != null) {
      _chargingDetails = chargingDetails;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get stationId => _stationId;

  set stationId(int? stationId) => _stationId = stationId;

  String? get stationTitle => _stationTitle;

  set stationTitle(String? stationTitle) => _stationTitle = stationTitle;

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get title => _title;

  set title(String? title) => _title = title;

  String? get stationUuid => _stationUuid;

  set stationUuid(String? stationUuid) => _stationUuid = stationUuid;

  String? get chargerId => _chargerId;

  set chargerId(String? chargerId) => _chargerId = chargerId;

  String? get ocppProtocol => _ocppProtocol;

  set ocppProtocol(String? ocppProtocol) => _ocppProtocol = ocppProtocol;

  String? get registrationStatus => _registrationStatus;

  set registrationStatus(String? registrationStatus) =>
      _registrationStatus = registrationStatus;

  String? get chargePointVendor => _chargePointVendor;

  set chargePointVendor(String? chargePointVendor) =>
      _chargePointVendor = chargePointVendor;

  String? get chargePointModel => _chargePointModel;

  set chargePointModel(String? chargePointModel) =>
      _chargePointModel = chargePointModel;

  String? get chargePointSerialNumber => _chargePointSerialNumber;

  set chargePointSerialNumber(String? chargePointSerialNumber) =>
      _chargePointSerialNumber = chargePointSerialNumber;

  String? get chargeBoxSerialNumber => _chargeBoxSerialNumber;

  set chargeBoxSerialNumber(String? chargeBoxSerialNumber) =>
      _chargeBoxSerialNumber = chargeBoxSerialNumber;

  String? get fwVersion => _fwVersion;

  set fwVersion(String? fwVersion) => _fwVersion = fwVersion;

  String? get fwUpdateStatus => _fwUpdateStatus;

  set fwUpdateStatus(String? fwUpdateStatus) =>
      _fwUpdateStatus = fwUpdateStatus;

  String? get fwUpdateTimestamp => _fwUpdateTimestamp;

  set fwUpdateTimestamp(String? fwUpdateTimestamp) =>
      _fwUpdateTimestamp = fwUpdateTimestamp;

  String? get iccid => _iccid;

  set iccid(String? iccid) => _iccid = iccid;

  String? get imsi => _imsi;

  set imsi(String? imsi) => _imsi = imsi;

  String? get meterType => _meterType;

  set meterType(String? meterType) => _meterType = meterType;

  String? get meterSerialNumber => _meterSerialNumber;

  set meterSerialNumber(String? meterSerialNumber) =>
      _meterSerialNumber = meterSerialNumber;

  String? get diagnosticsStatus => _diagnosticsStatus;

  set diagnosticsStatus(String? diagnosticsStatus) =>
      _diagnosticsStatus = diagnosticsStatus;

  String? get diagnosticsTimestamp => _diagnosticsTimestamp;

  set diagnosticsTimestamp(String? diagnosticsTimestamp) =>
      _diagnosticsTimestamp = diagnosticsTimestamp;

  String? get lastHeartbeatTimestamp => _lastHeartbeatTimestamp;

  set lastHeartbeatTimestamp(String? lastHeartbeatTimestamp) =>
      _lastHeartbeatTimestamp = lastHeartbeatTimestamp;

  String? get description => _description;

  set description(String? description) => _description = description;

  String? get note => _note;

  set note(String? note) => _note = note;

  String? get locationLatitude => _locationLatitude;

  set locationLatitude(String? locationLatitude) =>
      _locationLatitude = locationLatitude;

  String? get locationLongitude => _locationLongitude;

  set locationLongitude(String? locationLongitude) =>
      _locationLongitude = locationLongitude;

  String? get adminAddress => _adminAddress;

  set adminAddress(String? adminAddress) => _adminAddress = adminAddress;

  String? get chargingType => _chargingType;

  set chargingType(String? chargingType) => _chargingType = chargingType;

  int? get status => _status;

  set status(int? status) => _status = status;

  String? get image => _image;

  set image(String? image) => _image = image;

  String? get imagePath => _imagePath;

  set imagePath(String? imagePath) => _imagePath = imagePath;

  String? get installationDate => _installationDate;

  set installationDate(String? installationDate) =>
      _installationDate = installationDate;

  String? get lastMaintenanceDate => _lastMaintenanceDate;

  set lastMaintenanceDate(String? lastMaintenanceDate) =>
      _lastMaintenanceDate = lastMaintenanceDate;

  String? get nextMaintenanceDate => _nextMaintenanceDate;

  set nextMaintenanceDate(String? nextMaintenanceDate) =>
      _nextMaintenanceDate = nextMaintenanceDate;

  String? get qrcode => _qrcode;

  set qrcode(String? qrcode) => _qrcode = qrcode;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  int? get updatedBy => _updatedBy;

  set updatedBy(int? updatedBy) => _updatedBy = updatedBy;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  String? get chargerstatus => _chargerstatus;

  set chargerstatus(String? chargerstatus) => _chargerstatus = chargerstatus;

  List<Connectors>? get connectors => _connectors;

  set connectors(List<Connectors>? connectors) => _connectors = connectors;

  ChargingDetails? get chargingDetails => _chargingDetails;

  set chargingDetails(ChargingDetails? chargingDetails) =>
      _chargingDetails = chargingDetails;

  ChargerPointData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _stationId = json['station_id'];
    _stationTitle = json['station_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _stationUuid = json['station_uuid'];
    _chargerId = json['chargerId'];
    _ocppProtocol = json['ocpp_protocol'];
    _registrationStatus = json['registration_status'];
    _chargePointVendor = json['charge_point_vendor'];
    _chargePointModel = json['charge_point_model'];
    _chargePointSerialNumber = json['charge_point_serial_number'];
    _chargeBoxSerialNumber = json['charge_box_serial_number'];
    _fwVersion = json['fw_version'];
    _fwUpdateStatus = json['fw_update_status'];
    _fwUpdateTimestamp = json['fw_update_timestamp'];
    _iccid = json['iccid'];
    _imsi = json['imsi'];
    _meterType = json['meter_type'];
    _meterSerialNumber = json['meter_serial_number'];
    _diagnosticsStatus = json['diagnostics_status'];
    _diagnosticsTimestamp = json['diagnostics_timestamp'];
    _lastHeartbeatTimestamp = json['last_heartbeat_timestamp'];
    _description = json['description'];
    _note = json['note'];
    _locationLatitude = json['location_latitude'];
    _locationLongitude = json['location_longitude'];
    _adminAddress = json['admin_address'];
    _chargingType = json['charging_type'];
    _status = json['status'];
    _image = json['image'];
    _imagePath = json['image_path'];
    _installationDate = json['installation_date'];
    _lastMaintenanceDate = json['last_maintenance_date'];
    _nextMaintenanceDate = json['next_maintenance_date'];
    _qrcode = json['qrcode'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _chargerstatus = json['chargerstatus'];
    if (json['connectors'] != null) {
      _connectors = <Connectors>[];
      json['connectors'].forEach((v) {
        _connectors!.add(Connectors.fromJson(v));
      });
    }
    _chargingDetails = json['charging_details'] != null
        ? ChargingDetails.fromJson(json['charging_details'])
        : null;
  }
}

class ChargingDetails {
  String? _connectorTitle;
  String? _readingContext;
  String? _energytxnTitle;
  String? _energytxnUuid;
  String? _wh;
  int? _kW;
  String? _w;
  String? _percent;
  String? _a;
  String? _v;
  dynamic _totalCost;

  ChargingDetails(
      {String? connectorTitle,
      String? readingContext,
      String? energytxnTitle,
      String? energytxnUuid,
      String? wh,
      int? kW,
      String? w,
      String? percent,
      String? a,
      dynamic totalCost,
      String? v}) {
    if (connectorTitle != null) {
      _connectorTitle = connectorTitle;
    }
    if (readingContext != null) {
      _readingContext = readingContext;
    }
    if (energytxnTitle != null) {
      _energytxnTitle = energytxnTitle;
    }
    if (energytxnUuid != null) {
      _energytxnUuid = energytxnUuid;
    }
    if (wh != null) {
      _wh = wh;
    }
    if (kW != null) {
      _kW = kW;
    }
    if (w != null) {
      _w = w;
    }
    if (percent != null) {
      _percent = percent;
    }
    if (a != null) {
      _a = a;
    }
    if (v != null) {
      _v = v;
    }
    if (totalCost != null) {
      _totalCost = totalCost;
    }
  }

  String? get connectorTitle => _connectorTitle;

  set connectorTitle(String? connectorTitle) =>
      _connectorTitle = connectorTitle;

  String? get readingContext => _readingContext;

  set readingContext(String? readingContext) =>
      _readingContext = readingContext;

  String? get energytxnTitle => _energytxnTitle;

  set energytxnTitle(String? energytxnTitle) =>
      _energytxnTitle = energytxnTitle;

  String? get energytxnUuid => _energytxnUuid;

  set energytxnUuid(String? energytxnUuid) => _energytxnUuid = energytxnUuid;

  String? get wh => _wh;

  set wh(String? wh) => _wh = wh;

  int? get kW => _kW;

  set kW(int? kW) => _kW = kW;

  String? get w => _w;

  set w(String? w) => _w = w;

  String? get percent => _percent;

  set percent(String? percent) => _percent = percent;

  String? get a => _a;

  set a(String? a) => _a = a;

  String? get v => _v;

  set v(String? v) => _v = v;

  dynamic get totalCost => _totalCost;

  set totalCost(dynamic totalCost) => _totalCost = totalCost;

  ChargingDetails.fromJson(Map<String, dynamic> json) {
    _connectorTitle = json['connector_title'];
    _readingContext = json['reading_context'];
    _energytxnTitle = json['energytxn_title'];
    _energytxnUuid = json['energytxn_uuid'];
    _wh = json['Wh'];
    _kW = json['kW'];
    _w = json['W'];
    _percent = json['Percent'];
    _a = json['A'];
    _v = json['V'];
    _totalCost = json['total_cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['connector_title'] = _connectorTitle;
    data['reading_context'] = _readingContext;
    data['energytxn_title'] = _energytxnTitle;
    data['energytxn_uuid'] = _energytxnUuid;
    data['Wh'] = _wh;
    data['kW'] = _kW;
    data['W'] = _w;
    data['Percent'] = _percent;
    data['A'] = _a;
    data['V'] = _v;
    data['total_cost'] = _totalCost;
    return data;
  }
}

class Connectors {
  int? _id;
  int? _chargerpointId;
  String? _chargerpointTitle;
  String? _uuid;
  String? _title;
  String? _chargerpointUuid;
  int? _createdBy;
  int? _updatedBy;
  String? _createdAt;
  String? _updatedAt;
  ConnectorStatus? _connectorStatus;

  Connectors(
      {int? id,
      int? chargerpointId,
      String? chargerpointTitle,
      String? uuid,
      String? title,
      String? chargerpointUuid,
      int? createdBy,
      int? updatedBy,
      String? createdAt,
      String? updatedAt,
      ConnectorStatus? connectorStatus}) {
    if (id != null) {
      _id = id;
    }
    if (chargerpointId != null) {
      _chargerpointId = chargerpointId;
    }
    if (chargerpointTitle != null) {
      _chargerpointTitle = chargerpointTitle;
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
    if (createdBy != null) {
      _createdBy = createdBy;
    }
    if (updatedBy != null) {
      _updatedBy = updatedBy;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (connectorStatus != null) {
      _connectorStatus = connectorStatus;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get chargerpointId => _chargerpointId;

  set chargerpointId(int? chargerpointId) => _chargerpointId = chargerpointId;

  String? get chargerpointTitle => _chargerpointTitle;

  set chargerpointTitle(String? chargerpointTitle) =>
      _chargerpointTitle = chargerpointTitle;

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get title => _title;

  set title(String? title) => _title = title;

  String? get chargerpointUuid => _chargerpointUuid;

  set chargerpointUuid(String? chargerpointUuid) =>
      _chargerpointUuid = chargerpointUuid;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  int? get updatedBy => _updatedBy;

  set updatedBy(int? updatedBy) => _updatedBy = updatedBy;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  ConnectorStatus? get connectorStatus => _connectorStatus;

  set connectorStatus(ConnectorStatus? connectorStatus) =>
      _connectorStatus = connectorStatus;

  Connectors.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _chargerpointId = json['chargerpoint_id'];
    _chargerpointTitle = json['chargerpoint_title'];
    _uuid = json['uuid'];
    _title = json['title'];
    _chargerpointUuid = json['chargerpoint_uuid'];
    _createdBy = json['created_by'];
    _updatedBy = json['updated_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _connectorStatus = json['connector_status'] != null
        ? ConnectorStatus.fromJson(json['connector_status'])
        : null;
  }
}

class ConnectorStatus {
  int? _id;
  int? _connectorId;
  String? _uuid;
  String? _connectorUuid;
  String? _connectorTitle;
  String? _status;
  String? _statusTimestamp;
  String? _errorCode;
  String? _vendorId;
  int? _createdBy;
  String? _createdAt;
  String? _updatedAt;

  ConnectorStatus(
      {int? id,
      int? connectorId,
      String? uuid,
      String? connectorUuid,
      String? connectorTitle,
      String? status,
      String? statusTimestamp,
      String? errorCode,
      String? vendorId,
      int? createdBy,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (connectorId != null) {
      _connectorId = connectorId;
    }
    if (uuid != null) {
      _uuid = uuid;
    }
    if (connectorUuid != null) {
      _connectorUuid = connectorUuid;
    }
    if (connectorTitle != null) {
      _connectorTitle = connectorTitle;
    }
    if (status != null) {
      _status = status;
    }
    if (statusTimestamp != null) {
      _statusTimestamp = statusTimestamp;
    }
    if (errorCode != null) {
      _errorCode = errorCode;
    }

    if (vendorId != null) {
      _vendorId = vendorId;
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

  int? get connectorId => _connectorId;

  set connectorId(int? connectorId) => _connectorId = connectorId;

  String? get uuid => _uuid;

  set uuid(String? uuid) => _uuid = uuid;

  String? get connectorUuid => _connectorUuid;

  set connectorUuid(String? connectorUuid) => _connectorUuid = connectorUuid;

  String? get connectorTitle => _connectorTitle;

  set connectorTitle(String? connectorTitle) =>
      _connectorTitle = connectorTitle;

  String? get status => _status;

  set status(String? status) => _status = status;

  String? get statusTimestamp => _statusTimestamp;

  set statusTimestamp(String? statusTimestamp) =>
      _statusTimestamp = statusTimestamp;

  String? get errorCode => _errorCode;

  set errorCode(String? errorCode) => _errorCode = errorCode;

  String? get vendorId => _vendorId;

  set vendorId(String? vendorId) => _vendorId = vendorId;

  int? get createdBy => _createdBy;

  set createdBy(int? createdBy) => _createdBy = createdBy;

  String? get createdAt => _createdAt;

  set createdAt(String? createdAt) => _createdAt = createdAt;

  String? get updatedAt => _updatedAt;

  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  ConnectorStatus.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _connectorId = json['connector_id'];
    _uuid = json['uuid'];
    _connectorUuid = json['connector_uuid'];
    _connectorTitle = json['connector_title'];
    _status = json['status'];
    _statusTimestamp = json['status_timestamp'];
    _errorCode = json['error_code'];
    _vendorId = json['vendor_id'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
}
