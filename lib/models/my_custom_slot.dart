class MyCustomSlot {
  int? _customerId;
  String? _timeslotId;
  String? _status;
  String? _startTime;
  String? _endTime;

  String? get startTime => _startTime;

  set startTime(String? value) {
    _startTime = value;
  }

  String? get endTime => _endTime;

  set endTime(String? value) {
    _endTime = value;
  }

  MyCustomSlot(
      {int? customerId,
      String? timeslotId,
      String? status,
      String? startTime,
      String? endTime}) {
    if (customerId != null) {
      _customerId = customerId;
    }
    if (timeslotId != null) {
      _timeslotId = timeslotId;
    }
    if (status != null) {
      _status = status;
    }
    if (startTime != null) {
      _startTime = startTime;
    }
    if (endTime != null) {
      _endTime = endTime;
    }
  }

  int? get customerId => _customerId;

  set customerId(int? customerId) => _customerId = customerId;

  String? get timeslotId => _timeslotId;

  set timeslotId(String? timeslotId) => _timeslotId = timeslotId;

  String? get status => _status;

  set status(String? status) => _status = status;

  MyCustomSlot.fromJson(dynamic json, List<MyCustomSlot> mList) {
    if (json != null) {
      json.forEach((v) {
        for (MyCustomSlot m in mList) {
          if (v['timeslot_id'] == m.timeslotId) {
            m.status = v['status'];
            break;
          }
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = _customerId;
    data['timeslot_id'] = _timeslotId;
    data['status'] = _status;
    return data;
  }
}
