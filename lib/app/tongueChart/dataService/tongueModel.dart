class TongueModel {
  final String id;
  final String name;
  final String type;
  final String svg;
  final List<Control> controls;

  TongueModel(
      {required this.id,
      required this.name,
      required this.type,
      required this.svg,
      required this.controls});

  factory TongueModel.fromJson(Map<String, dynamic> json) {
    var list = json['controls'] as List;
    List<Control> controlsList = list.map((e) => Control.fromJson(e)).toList();

    return TongueModel(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        svg: json['svg'],
        controls: controlsList);
  }
}

class Control {
  final String id;
  final String name;
  final String type;
  final String template;
  final List<String> options;

  Control(
      {required this.id,
      required this.name,
      required this.type,
      required this.template,
      required this.options});

  factory Control.fromJson(Map<String, dynamic> json) {
    var options = json['options'];
    List<String> optionsList = options.cast<String>();
    return Control(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        template: json['template'],
        options: optionsList);
  }
}
