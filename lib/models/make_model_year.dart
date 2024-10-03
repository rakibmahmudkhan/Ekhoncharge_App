class MakeModelYear {
  int? _status;
  bool? _success;
  List<MakeModelYearData>? _data;

  MakeModelYear({int? status, bool? success, List<MakeModelYearData>? data}) {
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
  List<MakeModelYearData>? get data => _data;
  set data(List<MakeModelYearData>? data) => _data = data;

  MakeModelYear.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = <MakeModelYearData>[];
      json['data'].forEach((v) {
        _data!.add(MakeModelYearData.fromJson(v));
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

class MakeModelYearData {
  int? _id;
  String? _text;

  MakeModelYearData({int? id, String? text}) {
    if (id != null) {
      _id = id;
    }
    if (text != null) {
      _text = text;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get text => _text;
  set text(String? text) => _text = text;

  MakeModelYearData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['text'] = _text;
    return data;
  }
}
