class ELocation {
  List<ELocationData>? _data;
  int? _total;

  ELocation({List<ELocationData>? data, int? total}) {
    if (data != null) {
      _data = data;
    }
    if (total != null) {
      _total = total;
    }
  }

  List<ELocationData>? get data => _data;

  set data(List<ELocationData>? data) => _data = data;

  int? get total => _total;

  set total(int? total) => _total = total;

  ELocation.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      _data = <ELocationData>[];
      json['data'].forEach((v) {
        _data!.add(ELocationData.fromJson(v));
      });
    }
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_data != null) {
      data['data'] = _data!.map((v) => v.toJson()).toList();
    }
    data['total'] = _total;
    return data;
  }
}

class ELocationData {
  int? _id;
  int? _countryId;
  int? _stateId;
  String? _name;
  String? _stateName;
  String? _countryName;
  String? _shortCode;
  int? _status;
  bool? _isSelected;

  ELocationData(
      {int? id,
      int? stateId,
      int? countryId,
      String? name,
      String? shortCode,
      String? stateName,
      int? status,
      bool? isSelected}) {
    if (countryId != null) {
      _countryId = countryId;
    }
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (shortCode != null) {
      _shortCode = shortCode;
    }
    if (status != null) {
      _status = status;
    }
    if (stateId != null) {
      _stateId = stateId;
    }
    if (isSelected != null) {
      _isSelected = isSelected;
    }
    if (stateName != null) {
      _stateName = stateName;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  int? get stateId => _stateId;

  set stateId(int? stateId) => _stateId = stateId;

  int? get countryId => _countryId;

  set countryId(int? countryId) => _countryId = countryId;

  String? get name => _name;

  set name(String? name) => _name = name;

  String? get countryName => _countryName;

  set countryName(String? countryName) => _countryName = countryName;

  String? get shortCode => _shortCode;

  set shortCode(String? shortCode) => _shortCode = shortCode;

  String? get stateName => _stateName;

  set stateName(String? stateName) => _stateName = stateName;

  int? get status => _status;

  set status(int? status) => _status = status;

  bool? get isSelected => _isSelected;

  set isSelected(bool? isSelected) => _isSelected = isSelected;

  ELocationData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryId = json['country_id'];
    _stateId = json['state_id'];
    _name = json['name'];
    _stateName = json['state_name'];
    _shortCode = json['short_code'];
    _countryName = json['country_name'];
    _status = json['status'];
    _isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['status'] = _status;
    return data;
  }
}
