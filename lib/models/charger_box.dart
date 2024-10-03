class ChargerBox {
  bool? _status;
  List<ChargerBoxData>? _data;

  ChargerBox({bool? status, List<ChargerBoxData>? data}) {
    if (status != null) {
      _status = status;
    }
    if (data != null) {
      _data = data;
    }
  }

  bool? get status => _status;
  set status(bool? status) => _status = status;
  List<ChargerBoxData>? get data => _data;
  set data(List<ChargerBoxData>? data) => _data = data;

  ChargerBox.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = <ChargerBoxData>[];
      json['data'].forEach((v) {
        _data!.add(ChargerBoxData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChargerBoxData {
  int? _chargeBoxPk;
  String? _chargeBoxId;
  String? _endpointAddress;
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
  dynamic _locationLatitude;
  dynamic _locationLongitude;
  int? _addressPk;
  String? _adminAddress;
  int? _insertConnectorStatusAfterTransactionMsg;

  ChargerBoxData(
      {int? chargeBoxPk,
        String? chargeBoxId,
        String? endpointAddress,
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
        dynamic locationLatitude,
        dynamic locationLongitude,
        int? addressPk,
        String? adminAddress,
        int? insertConnectorStatusAfterTransactionMsg}) {
    if (chargeBoxPk != null) {
      _chargeBoxPk = chargeBoxPk;
    }
    if (chargeBoxId != null) {
      _chargeBoxId = chargeBoxId;
    }
    if (endpointAddress != null) {
      _endpointAddress = endpointAddress;
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
    if (addressPk != null) {
      _addressPk = addressPk;
    }
    if (adminAddress != null) {
      _adminAddress = adminAddress;
    }
    if (insertConnectorStatusAfterTransactionMsg != null) {
      _insertConnectorStatusAfterTransactionMsg =
          insertConnectorStatusAfterTransactionMsg;
    }
  }

  int? get chargeBoxPk => _chargeBoxPk;
  set chargeBoxPk(int? chargeBoxPk) => _chargeBoxPk = chargeBoxPk;
  String? get chargeBoxId => _chargeBoxId;
  set chargeBoxId(String? chargeBoxId) => _chargeBoxId = chargeBoxId;
  String? get endpointAddress => _endpointAddress;
  set endpointAddress(String? endpointAddress) =>
      _endpointAddress = endpointAddress;
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
  dynamic get locationLatitude => _locationLatitude;
  set locationLatitude(dynamic locationLatitude) =>
      _locationLatitude = locationLatitude;
  dynamic get locationLongitude => _locationLongitude;
  set locationLongitude(dynamic locationLongitude) =>
      _locationLongitude = locationLongitude;
  int? get addressPk => _addressPk;
  set addressPk(int? addressPk) => _addressPk = addressPk;
  String? get adminAddress => _adminAddress;
  set adminAddress(String? adminAddress) => _adminAddress = adminAddress;
  int? get insertConnectorStatusAfterTransactionMsg =>
      _insertConnectorStatusAfterTransactionMsg;
  set insertConnectorStatusAfterTransactionMsg(
      int? insertConnectorStatusAfterTransactionMsg) =>
      _insertConnectorStatusAfterTransactionMsg =
          insertConnectorStatusAfterTransactionMsg;

  ChargerBoxData.fromJson(Map<String, dynamic> json) {
    _chargeBoxPk = json['charge_box_pk'];
    _chargeBoxId = json['charge_box_id'];
    _endpointAddress = json['endpoint_address'];
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
    _addressPk = json['address_pk'];
    _adminAddress = json['admin_address'];
    _insertConnectorStatusAfterTransactionMsg =
    json['insert_connector_status_after_transaction_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['charge_box_pk'] = _chargeBoxPk;
    data['charge_box_id'] = _chargeBoxId;
    data['endpoint_address'] = _endpointAddress;
    data['ocpp_protocol'] = _ocppProtocol;
    data['registration_status'] = _registrationStatus;
    data['charge_point_vendor'] = _chargePointVendor;
    data['charge_point_model'] = _chargePointModel;
    data['charge_point_serial_number'] = _chargePointSerialNumber;
    data['charge_box_serial_number'] = _chargeBoxSerialNumber;
    data['fw_version'] = _fwVersion;
    data['fw_update_status'] = _fwUpdateStatus;
    data['fw_update_timestamp'] = _fwUpdateTimestamp;
    data['iccid'] = _iccid;
    data['imsi'] = _imsi;
    data['meter_type'] = _meterType;
    data['meter_serial_number'] = _meterSerialNumber;
    data['diagnostics_status'] = _diagnosticsStatus;
    data['diagnostics_timestamp'] = _diagnosticsTimestamp;
    data['last_heartbeat_timestamp'] = _lastHeartbeatTimestamp;
    data['description'] = _description;
    data['note'] = _note;
    data['location_latitude'] = _locationLatitude;
    data['location_longitude'] = _locationLongitude;
    data['address_pk'] = _addressPk;
    data['admin_address'] = _adminAddress;
    data['insert_connector_status_after_transaction_msg'] =
        _insertConnectorStatusAfterTransactionMsg;
    return data;
  }
}
