class Make {
  String? _title;
  bool? _isSelected;
  List<Model>? _modelList = [];

  Make({String? title = '', bool? isSelected = false, List<Model>? list}) {
    _title = title;
    _isSelected = isSelected;
    _modelList = list;
  }

  bool? get isSelected => _isSelected;

  set isSelected(bool? value) {
    _isSelected = value;
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }

  List<Model>? get modelList => _modelList;

  set modelList(List<Model>? value) {
    _modelList = value;
  }
}

class Model {
  String? _title;
  bool? _isSelected;

  Model({String? title = '', bool? isSelected = false}) {
    _title = title;
    _isSelected = isSelected;
  }

  bool? get isSelected => _isSelected;

  set isSelected(bool? value) {
    _isSelected = value;
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }
}
